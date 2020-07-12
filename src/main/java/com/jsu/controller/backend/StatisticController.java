package com.jsu.controller.backend;

import com.jsu.common.Const;
import com.jsu.common.ResponseCode;
import com.jsu.common.ServerResponse;
import com.jsu.pojo.User;
import com.jsu.service.IStatisticService;
import com.jsu.service.IUserService;
import com.jsu.util.CookieUtil;
import com.jsu.util.JsonUtil;
import com.jsu.util.RedisPoolUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//后台数据统计接口
@Controller
@RequestMapping("/manage/statistic/")
public class StatisticController {
    @Autowired
    private IUserService iUserService;

    @Autowired
    private IStatisticService iStatisticService;

    /**
     *  查询商品、用户、订单数据，并返回给前端
     * @param httpServletRequest 请求对象
     * @return 通用的响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping(value = "base_count.do", method = RequestMethod.GET)
    @ResponseBody
    public ServerResponse baseCount(HttpServletRequest httpServletRequest){
        //获取loginToken对应的值
        String loginToken = CookieUtil.readLoginToken(httpServletRequest);
        if (StringUtils.isEmpty(loginToken)){
            return ServerResponse.createByErrorMessage("用户未登录，无法获取当前用户的信息");
        }
        //通过loginToken从Redis中获取user序列化后的字符串
        String userJsonStr = RedisPoolUtil.get(loginToken);
        //将userJsonStr反序列化
        User user = JsonUtil.string2Obj(userJsonStr, User.class);

        if (user == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),"用户未登录，请登录之后再操作");
        }
        //校验当前用户是否为管理员
        if (iUserService.checkAdminRole(user).isSuccess()){
            //是管理员-->增加处理逻辑
            return iStatisticService.getCount();
        } else {
            return ServerResponse.createByErrorMessage("无权限操作，需要管理员权限");
        }
    }
}
