package com.jsu.common;

import com.jsu.util.PropertiesUtil;
import redis.clients.jedis.*;
import redis.clients.util.Hashing;
import redis.clients.util.Sharded;

import java.util.ArrayList;
import java.util.List;

/**
 * @author 松鼠航
 * @date 2020/7/16 10:52
 * redis分布式的连接池类
 */
public class RedisShardedPool {
    //sharded jedis连接池
    private static ShardedJedisPool pool;
    //最大连接数
    private static Integer maxTotal = Integer.parseInt(PropertiesUtil.getProperty("redis.max.total","20"));
    //在jedisPool中最大idle状态（空闲状态）的jedis实例个数
    private static Integer maxIdle = Integer.parseInt(PropertiesUtil.getProperty("redis.max.idle","10"));
    //在jedisPool中最小idle状态（空闲状态）的jedis实例个数
    private static Integer minIdle = Integer.parseInt(PropertiesUtil.getProperty("redis.min.idle","2"));

    //在borrow一个jedis实例的时候，是否要进行验证操作。如果赋值为true，则得到的jedis实例一定是可用的。
    private static Boolean testOnBorrow = Boolean.parseBoolean(PropertiesUtil.getProperty("redis.test.borrow","true"));
    //在return一个jedis实例的时候，是否要进行验证操作。如果赋值为true，则放回的jedis实例一定是可用的
    private static Boolean testOnReturn = Boolean.parseBoolean(PropertiesUtil.getProperty("redis.test.return","true"));

    private static String redis1Ip = PropertiesUtil.getProperty("redis1.ip");
    private static Integer redis1Port = Integer.parseInt(PropertiesUtil.getProperty("redis1.port"));

    private static String redis2Ip = PropertiesUtil.getProperty("redis2.ip");
    private static Integer redis2Port = Integer.parseInt(PropertiesUtil.getProperty("redis2.port"));

    //初始化连接池
    private static void initPool(){
        JedisPoolConfig config = new JedisPoolConfig();

        config.setMaxTotal(maxTotal);
        config.setMaxIdle(maxIdle);
        config.setMinIdle(minIdle);

        config.setTestOnBorrow(testOnBorrow);
        config.setTestOnReturn(testOnReturn);

        //当连接池不够用时，是否阻塞下一个连接请求的borrow，false会抛出异常，true会阻塞直到超时。默认为true
        config.setBlockWhenExhausted(true);

        //创建两个redis信息
        JedisShardInfo info1 = new JedisShardInfo(redis1Ip, redis1Port, 1000*2);
        JedisShardInfo info2 = new JedisShardInfo(redis2Ip, redis2Port, 1000*2);

        List<JedisShardInfo> jedisShardInfoList = new ArrayList<>(2);

        jedisShardInfoList.add(info1);
        jedisShardInfoList.add(info2);

        //创建sharded连接池对象（四个参数：配置，redis库集合，hash分配策略：一致性算法，。。。）
        pool = new ShardedJedisPool(config, jedisShardInfoList, Hashing.MURMUR_HASH, Sharded.DEFAULT_KEY_TAG_PATTERN);
    }

    static {
        initPool();
    }

    //获取连接池中实例
    public static ShardedJedis getJedis(){
        return pool.getResource();
    }

    //将实例放回连接池(损坏的连接)
    public static void returnBrokenResource(ShardedJedis jedis){
        pool.returnBrokenResource(jedis);
    }

    //将实例放回连接池(正常连接)
    public static void returnResource(ShardedJedis jedis){
        pool.returnResource(jedis);
    }

    public static void main(String[] args) {
        ShardedJedis jedis = pool.getResource();

        for (int i = 0; i < 10; i++) {
            jedis.set("key"+i, "value"+i);
        }

        returnResource(jedis);

        //pool.destroy();
    }
}
