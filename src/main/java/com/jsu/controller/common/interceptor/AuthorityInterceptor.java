package com.jsu.controller.common.interceptor;

import com.google.common.collect.Maps;
import com.jsu.common.Const;
import com.jsu.common.ServerResponse;
import com.jsu.pojo.User;
import com.jsu.util.CookieUtil;
import com.jsu.util.JsonUtil;
import com.jsu.util.RedisShardedPoolUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Map;

/**
 * @author 松鼠航
 * @date 2020/7/19 11:04
 * 拦截器，将做后台的管理员登录及管理员权限的判断
 */
@Slf4j
public class AuthorityInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        log.info("preHandle");
        //获取请求中Controller中的方法名
        HandlerMethod handlerMethod = (HandlerMethod) handler;

        //解析HandlerMethod
        String methodName = handlerMethod.getMethod().getName();                //获取方法名
        String className = handlerMethod.getBean().getClass().getSimpleName();  //获取简单类名

        //解析参数，具体的参数key与value是什么，然后打印出来（测试）
        StringBuffer requestParamBuffer = new StringBuffer();
        Map paramMap = request.getParameterMap();//参数集合
        //通过迭代器取出参数
        Iterator iterator = paramMap.entrySet().iterator();
        while (iterator.hasNext()){
            Map.Entry entry = (Map.Entry)iterator.next();
            String mapKey = (String) entry.getKey();
            String mapValue = StringUtils.EMPTY;

            //request这个参数的map，里面的value返回的是一个String数组
            Object obj = entry.getValue();
            if (obj instanceof  String[]){
                String[] strings = (String[]) obj;
                mapValue = Arrays.toString(strings);
            }
            requestParamBuffer.append(mapKey).append("=").append(mapValue);
        }

        //若拦截到管理员的登录接口则放过该请求
        if (StringUtils.equals(className, "UserManageController") && StringUtils.equals(methodName, "login")){
            log.info("权限拦截器拦截到请求，className:{},methodName:{}", className, methodName);
            //若是拦截到登录请求，则不打印参数，因为可能会导致密码的泄露
            return true;
        }

        //若是除登录之外的请求，则将请求信息打印到日志中
        log.info("权限拦截器拦截到请求，className:{},methodName:{},param:{}", className, methodName,requestParamBuffer.toString());

        User user = null;

        //获取loginToken对应的值
        String loginToken = CookieUtil.readLoginToken(request);
        //若loginToken不为空
        if (StringUtils.isNotEmpty(loginToken)){
            //通过loginToken从Redis中获取user序列化后的字符串
            String userJsonStr = RedisShardedPoolUtil.get(loginToken);
            //将userJsonStr反序列化
            user = JsonUtil.string2Obj(userJsonStr, User.class);
        }

        //对user进行判断
        if (user == null || (user.getRole().intValue() != Const.Role.ROLE_ADMIN)){
            //此时应该返回false，即不会调用Controller中的方法，需要重写response
            response.reset(); //将response重置，否则会报异常
            response.setCharacterEncoding("UTF-8"); //此处需要设置编码，否则会乱码
            response.setContentType("application/json;charset=UTF-8");  //此处需要设置返回值的类型，因为后端统一返回json类型

            //获取输出对象
            PrintWriter out = response.getWriter();

            //若用户对象为空，即用户未登录
            if (user == null){
                //若是拦截到富文本上传的请求，富文本上传请求需要特殊处理
                if (StringUtils.equals(className, "ProductManageController") && StringUtils.equals(methodName, "richtextImgUpload")){
                    Map resultMap = Maps.newHashMap();
                    resultMap.put("success", false);
                    resultMap.put("msg","请登录管理员");
                    //此时返回resultMap序列化后的json字符串
                    out.print(JsonUtil.obj2String(resultMap));
                } else {
                    out.print(JsonUtil.obj2String(ServerResponse.createByErrorMessage("拦截器拦截，用户未登录")));
                }
            }
            //非管理员用户操作
            else {
                //若是拦截到富文本上传的请求，富文本上传请求需要特殊处理
                if (StringUtils.equals(className, "ProductManageController") && StringUtils.equals(methodName, "richtextImgUpload")){
                    Map resultMap = Maps.newHashMap();
                    resultMap.put("success", false);
                    resultMap.put("msg","无权限操作");
                    //此时返回resultMap序列化后的json字符串
                    out.print(JsonUtil.obj2String(resultMap));
                } else {
                    out.print(JsonUtil.obj2String(ServerResponse.createByErrorMessage("拦截器拦截，用户无权限操作")));
                }
            }
            out.flush();
            out.close();//关闭输出流
            return false; //因为进入此判断，该请求肯定会被拦截下来，所以此处返回false
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        log.info("postHandle");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception e) throws Exception {
        log.info("afterCompletion");
    }
}
