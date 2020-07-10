package com.jsu.util;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author 松鼠航
 * @date 2020/7/10 17:31
 * 往Redis内编辑Cookie的工具类
 */
@Slf4j
public class CookieUtil {

    //配置Cookie的Domain为一级域名
    private final static String COOKIE_DOMAIN = ".guangping.store";
    //写入Redis的cookie的key
    private final static String COOKIE_NAME = "mall_login_token";

    //从请求中获取cookie
    public static String readLoginToken(HttpServletRequest request){
        Cookie[] cks = request.getCookies();
        if (cks != null){
            for (Cookie ck : cks) {
                log.info("read cookieName:{}, cookieValue:{}", ck.getName(), ck.getValue());
                if (StringUtils.equals(ck.getName(), COOKIE_NAME)){
                    log.info("return cookieName:{}, cookieValue:{}", ck.getName(), ck.getValue());
                    return ck.getValue();
                }
            }
        }
        return null;
    }

    //写入cookie
    public static void writeLoginToken(HttpServletResponse response, String token){
        Cookie ck = new Cookie(COOKIE_NAME, token);
        ck.setDomain(COOKIE_DOMAIN);
        ck.setPath("/");   //表示设置在跟目录
        //如果是-1，表示永久，单位为秒
        //若这个属性不设置，则cookie不会写入硬盘，而是写在内存。只在当前页面有效
        ck.setMaxAge(60 * 60 * 24 * 365);

        log.info("write cookieName:{}, cookieValue:{}", ck.getName(), ck.getValue());
        response.addCookie(ck);
    }

    //删除浏览器中的cookie
    public static void delLoginToken(HttpServletRequest request, HttpServletResponse response){
        Cookie[] cks = request.getCookies();
        if (cks != null){
            for (Cookie ck : cks){
                if (StringUtils.equals(ck.getName(), COOKIE_NAME)){
                    ck.setDomain(COOKIE_DOMAIN);
                    ck.setPath("/");
                    //设置为0，表示删除此cookie
                    ck.setMaxAge(0);
                    log.info("del cookieName:{}, cookieValue:{}", ck.getName(), ck.getValue());
                    response.addCookie(ck);
                    return;
                }
            }
        }
    }
}
