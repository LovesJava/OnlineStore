package com.jsu.common;

import com.jsu.util.PropertiesUtil;
import lombok.extern.slf4j.Slf4j;
import org.redisson.Redisson;
import org.redisson.config.Config;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * @author 松鼠航
 * @date 2020/8/9 15:30
 * Redisson的管理类，初始化Redisson对象，并对外提供Redisson实例
 */
@Component
@Slf4j
public class RedissonManager {

    private Config config = new Config();

    private Redisson redisson = null;

    public Redisson getRedisson() {
        return redisson;
    }

    private static String redis1Ip = PropertiesUtil.getProperty("redis1.ip");
    private static Integer redis1Port = Integer.parseInt(PropertiesUtil.getProperty("redis1.port"));

    //private static String redis2Ip = PropertiesUtil.getProperty("redis2.ip");
    //private static Integer redis2Port = Integer.parseInt(PropertiesUtil.getProperty("redis2.port"));

    //RedissonManager执行完构造方法后，便执行init方法
    @PostConstruct
    private void init(){
        try {
            //Redisson不支持一致性算法，所以只用一个redis库即可
            config.useSingleServer().setAddress(new StringBuilder().append(redis1Ip).append(":").append(redis1Port).toString());
            redisson = (Redisson) Redisson.create(config);
            log.info("初始化Redisson结束");
        } catch (Exception e) {
            log.error("Redisson init error", e);
        }
    }


}
