package com.jsu.common;

import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.concurrent.TimeUnit;

//令牌缓存类
public class TokenCache {
    private static Logger logger = LoggerFactory.getLogger(TokenCache.class);

    public static final String TOKEN_PREFIX = "token_";

    /**
     * initialCapacity(数值):初始化容量
     * maximumSize(数值):最大容量(超过容量使用LRU算法清理，即最少使用算法)
     * expireAfterAccess(数值，单位):设置有效期
     */
    private static LoadingCache<String, String> localCache = CacheBuilder.newBuilder().
            initialCapacity(1000).maximumSize(10000).expireAfterAccess(12, TimeUnit.HOURS).
            build(new CacheLoader<String, String>() {
                //默认的数据加载实现，当调用get取值的时候，如果key没有对应的值，就调用这个方法进行加载
                public String load(String s) throws Exception {
                    return "null";
                }
            });

    //把令牌设置到缓存中
    public static void setKey(String key, String value){
        localCache.put(key, value);
    }
    //从缓存中获取令牌
    public static String getKey(String key){
        String value = null;
        try {
            value = localCache.get(key);
            if ("null".equals(value)) return null;
            return value;
        } catch (Exception e){
            logger.error("localCache get error", e);
        }
        return null;
    }
}
