package com.jsu.common;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author 松鼠航
 * @date 2020/7/18 15:39
 * 全局异常处理类，使用Component注解注入到spring容器中
 */
@Slf4j
@Component
public class ExceptionResolver implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        //将错误信息打印到日志和控制台中
        log.error("{} Exception", httpServletRequest.getRequestURI(), e);

        //创建ModelAndView对象并且返回，传递MappingJacksonJsonView来创建对象，返回的将是一个json字符串
        //当使用的是jackson2.x的时候使用MappingJackson2JsonView，本项目使用是1.9版本，所以传递MappingJacksonJsonView
        ModelAndView modelAndView = new ModelAndView(new MappingJacksonJsonView());

        modelAndView.addObject("status", ResponseCode.ERROR.getCode());
        modelAndView.addObject("msg","接口异常，详情请查看服务日志的错误信息");
        modelAndView.addObject("data", e.toString());

        return modelAndView;
    }
}
