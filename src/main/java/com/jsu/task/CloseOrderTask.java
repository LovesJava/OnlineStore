package com.jsu.task;

import com.jsu.common.Const;
import com.jsu.common.RedissonManager;
import com.jsu.service.IOrderService;
import com.jsu.util.PropertiesUtil;
import com.jsu.util.RedisShardedPoolUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.redisson.api.RLock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.PreDestroy;
import java.util.concurrent.TimeUnit;

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

    @Autowired
    private RedissonManager redissonManager;

    /**
     * 当tomcat关闭的时候，销毁redis中的分布式锁
     * 但如果分布式锁过多，会造成tomcat关闭时间很长
     */
    @PreDestroy
    public void delLock(){
        RedisShardedPoolUtil.del(Const.REDIS_LOCK.CLOSE_ORDER_TASK_LOCK);//释放锁
    }

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

    /**
     * 第二版定时任务，通过redis分布式锁，来约束其他tomcat集群的执行
     * 每一分钟都会执行一次，关闭以当前时间为准，2个小时之前下单了但未付款的订单
     */
    //@Scheduled(cron = "0 */1 * * * ?")//每一分钟执行(每1分钟的整数倍)
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

    /**
     * 第三版定时任务，解决tomcat强制关闭，导致redis中的CLOSE_ORDER_TASK_LOCK永久存在，从而造成死锁的问题
     * 每一分钟都会执行一次，关闭以当前时间为准，2个小时之前下单了但未付款的订单
     */
    @Scheduled(cron = "0 */1 * * * ?")//每一分钟执行(每1分钟的整数倍)
    public void closeOrderTaskV3(){
        log.info("关闭订单定时任务启动");
        //获取配置文件中锁的超时时间
        long lockTimeout = Long.parseLong(PropertiesUtil.getProperty("lock.timeout", "5000"));
        //将锁的常量作为key，当前时间加上超时时间作为value，以setnx的形式设置到redis中
        Long setnxResult = RedisShardedPoolUtil.setnx(Const.REDIS_LOCK.CLOSE_ORDER_TASK_LOCK, String.valueOf(System.currentTimeMillis() + lockTimeout));
        if (setnxResult != null && setnxResult.intValue() == 1){
            //如果返回值为1，代表设置成功，获取锁
            closeOrder(Const.REDIS_LOCK.CLOSE_ORDER_TASK_LOCK);
        } else {
            //与第二版的主要区别是处理else分支
            //未获取到锁，继续判断，通过时间戳判断是否可以重置并获取到锁
            String lockValueStr = RedisShardedPoolUtil.get(Const.REDIS_LOCK.CLOSE_ORDER_TASK_LOCK);
            if (lockValueStr != null && System.currentTimeMillis() > Long.parseLong(lockValueStr)){
                //若lockValueStr存在值，且小于当前的时间戳，则表示程序有权获取到锁
                //因为是tomcat集群，所以lockValueStr与getSetResult是可能不一致的，若只有一个tomcat，则它们相等
                //此处给锁设置了一个新的value值，并获取旧值
                String getSetResult = RedisShardedPoolUtil.getSet(Const.REDIS_LOCK.CLOSE_ORDER_TASK_LOCK, String.valueOf(System.currentTimeMillis() + lockTimeout));
                //通过返回的key的旧值，判断是否可以获取锁
                //当key没有旧值，即key不存在，返回nil --> 即可获取锁
                //若getSetResult不为空，且lockValueStr与getSetResult相等，则表示程序执行到此处，锁的value并没有被其他线程set新值
                if (getSetResult == null || (getSetResult != null && StringUtils.equals(lockValueStr, getSetResult))){
                    //真正获取到锁
                    closeOrder(Const.REDIS_LOCK.CLOSE_ORDER_TASK_LOCK);
                } else {
                    log.info("没有获取到分布式锁：{}", Const.REDIS_LOCK.CLOSE_ORDER_TASK_LOCK);
                }
            } else {
                log.info("没有获取到分布式锁：{}", Const.REDIS_LOCK.CLOSE_ORDER_TASK_LOCK);
            }
        }
        log.info("关闭订单定时任务结束");
    }

    /**
     * 第四版定时任务，通过Redisson来实现分布式锁
     * 每一分钟都会执行一次，关闭以当前时间为准，2个小时之前下单了但未付款的订单
     */
    //@Scheduled(cron = "0 */1 * * * ?")//每一分钟执行(每1分钟的整数倍)
    public void closeOrderTaskV4(){
        //声明RLock
        RLock lock = redissonManager.getRedisson().getLock(Const.REDIS_LOCK.CLOSE_ORDER_TASK_LOCK);
        boolean getLock = false;//是否获取到锁
        try {
            //尝试获取锁，等待时间，锁的自动解锁时间，时间单位
            if(getLock = lock.tryLock(0, 5, TimeUnit.SECONDS)){
                log.info("Redisson获取到分布式锁：{}，ThreadName：{}",Const.REDIS_LOCK.CLOSE_ORDER_TASK_LOCK, Thread.currentThread().getName());
                int hour = Integer.parseInt(PropertiesUtil.getProperty("close.order.task.time.hour", "2"));
                iOrderService.closeOrder(hour);
            } else {
                log.info("Redisson未获取到分布式锁：{}，ThreadName：{}",Const.REDIS_LOCK.CLOSE_ORDER_TASK_LOCK, Thread.currentThread().getName());
            }
        } catch (InterruptedException e) {
            log.error("Redisson分布式锁获取异常", e);
        } finally {
            //若未获取到锁，直接返回
            if(!getLock){
                return;
            }
            lock.unlock(); //释放锁
            log.info("Redisson分布式锁释放");
        }
    }

    //关闭订单，同时为分布式锁设置有效期
    private void closeOrder(String lockName){
        RedisShardedPoolUtil.expire(lockName, 5);//设置有效期50秒，防止死锁，线上环境设置5秒即可
        log.info("获取{}，ThreadName：{}",Const.REDIS_LOCK.CLOSE_ORDER_TASK_LOCK, Thread.currentThread().getName());
        int hour = Integer.parseInt(PropertiesUtil.getProperty("close.order.task.time.hour", "2"));
        iOrderService.closeOrder(hour);
        RedisShardedPoolUtil.del(Const.REDIS_LOCK.CLOSE_ORDER_TASK_LOCK);//释放锁
        log.info("释放{}，ThreadName：{}",Const.REDIS_LOCK.CLOSE_ORDER_TASK_LOCK, Thread.currentThread().getName());
        log.info("==================================");
    }
}
