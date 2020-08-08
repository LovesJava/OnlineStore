package com.jsu.task;

import com.jsu.common.Const;
import com.jsu.common.RedisShardedPool;
import com.jsu.service.IOrderService;
import com.jsu.util.PropertiesUtil;
import com.jsu.util.RedisShardedPoolUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @author 松鼠航
 * @date 2020/8/7 9:41
 * 定时关单类
 */
@Component
@Slf4j
public class CloseOrderTask {

    @Autowired
    private IOrderService iOrderService;

    /**
     * 若不是tomcat集群项目，第一版的定时任务即可满足需求
     * 每一分钟都会执行一次，关闭以当前时间为准，2个小时之前下单了但未付款的订单
     */
    //@Scheduled(cron = "0 */1 * * * ?")//每一分钟执行(每1分钟的整数倍)
    public void closeOrderTaskV1(){
        log.info("关闭订单定时任务启动");
        int hour = Integer.parseInt(PropertiesUtil.getProperty("close.order.task.time.hour", "2"));
        iOrderService.closeOrder(hour);
        log.info("关闭订单定时任务结束");
    }

    public void closeOrderTaskV2(){
        log.info("关闭订单定时任务启动");
        //获取配置文件中分布式锁的超时时间
        long lockTimeout = Long.parseLong(PropertiesUtil.getProperty("lock.timeout", "5000"));
        //将分布式锁的常量作为key，当前时间加上超时时间作为value，以setnx的形式设置到redis中
        Long setnxResult = RedisShardedPoolUtil.setnx(Const.REDIS_LOCK.CLOSE_ORDER_TASK_LOCK, String.valueOf(System.currentTimeMillis() + lockTimeout));
        if (setnxResult != null && setnxResult.intValue() == 1){
            //如果返回值为1，代表设置成功，获取锁
            closeOrder(Const.REDIS_LOCK.CLOSE_ORDER_TASK_LOCK);
        } else {
            log.info("没有获取到分布式锁：{}", Const.REDIS_LOCK.CLOSE_ORDER_TASK_LOCK);
        }
        log.info("关闭订单定时任务结束");
    }

    //关闭订单，同时为分布式锁设置有效期
    private void closeOrder(String lockName){
        RedisShardedPoolUtil.expire(lockName, 50);//设置有效期50秒，防止死锁，线上环境设置5秒即可
        log.info("获取{}，ThreadName：{}",Const.REDIS_LOCK.CLOSE_ORDER_TASK_LOCK, Thread.currentThread().getName());
        int hour = Integer.parseInt(PropertiesUtil.getProperty("close.order.task.time.hour", "2"));
        iOrderService.closeOrder(hour);
        RedisShardedPoolUtil.del(Const.REDIS_LOCK.CLOSE_ORDER_TASK_LOCK);//释放锁
        log.info("释放{}，ThreadName：{}",Const.REDIS_LOCK.CLOSE_ORDER_TASK_LOCK, Thread.currentThread().getName());
        log.info("==================================");
    }
}
