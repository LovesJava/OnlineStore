package com.jsu.controller.common;

import com.jsu.common.Const;
import com.jsu.pojo.User;
import com.jsu.util.CookieUtil;
import com.jsu.util.JsonUtil;
import com.jsu.util.RedisPoolUtil;
import org.apache.commons.lang.StringUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * @author 松鼠航
 * @date 2020/7/12 10:59
 * 过滤器：每当用户访问新的接口，则刷新Redis中CookieToken的有效期
 */
public class SessionExpireFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest)servletRequest;

        //获取loginToken对应的值
        String loginToken = CookieUtil.readLoginToken(httpServletRequest);

        if (StringUtils.isNotEmpty(loginToken)){
            //通过loginToken从Redis中获取user序列化后的字符串
            String userJsonStr = RedisPoolUtil.get(loginToken);
            //将userJsonStr反序列化
            User user = JsonUtil.string2Obj(userJsonStr, User.class);

            //若反序列化后的user不为空，则重置session时间
            if (user != null){
                RedisPoolUtil.expire(loginToken, Const.RedisCacheExtime.REDIS_SESSION_EXTIME);
            }
        }
        filterChain.doFilter(servletRequest,servletResponse);
    }

    @Override
    public void destroy() {

    }
}
