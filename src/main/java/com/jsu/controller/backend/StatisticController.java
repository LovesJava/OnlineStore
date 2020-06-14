package com.jsu.controller.backend;

import com.jsu.common.Const;
import com.jsu.common.ResponseCode;
import com.jsu.common.ServerResponse;
import com.jsu.pojo.User;
import com.jsu.service.IStatisticService;
import com.jsu.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
     * @param session 会话对象
     * @return 通用的响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping(value = "base_count.do", method = RequestMethod.GET)
    @ResponseBody
    public ServerResponse baseCount(HttpSession session){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
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
