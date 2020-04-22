package com.jsu.controller.portal;

import com.github.pagehelper.PageInfo;
import com.jsu.common.Const;
import com.jsu.common.ResponseCode;
import com.jsu.common.ServerResponse;
import com.jsu.pojo.Shipping;
import com.jsu.pojo.User;
import com.jsu.service.IShippingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/shipping/")
public class ShippingController {

    @Autowired
    private IShippingService iShippingService;

    /**
     * 新增收货地址
     * @param session 会话对象
     * @param shipping 地址对象
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping("add.do")
    @ResponseBody
    public ServerResponse add(HttpSession session, Shipping shipping){
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null){ //判断当前用户是否已经登陆
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return iShippingService.add(user.getId(), shipping);
    }

    /**
     * 删除收货地址
     * @param session 会话对象
     * @param shippingId 收货地址ID
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping("delete.do")
    @ResponseBody
    public ServerResponse delete(HttpSession session, Integer shippingId){
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null){ //判断当前用户是否已经登陆
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return iShippingService.delete(user.getId(), shippingId);
    }

    /**
     * 更新收货地址
     * @param session 会话对象
     * @param shipping 地址对象
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping("update.do")
    @ResponseBody
    public ServerResponse update(HttpSession session, Shipping shipping){
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null){ //判断当前用户是否已经登陆
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return iShippingService.update(user.getId(), shipping);
    }

    /**
     * 查询地址详情
     * @param session 会话对象
     * @param shippingId 地址对象Id
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping("select.do")
    @ResponseBody
    public ServerResponse select(HttpSession session, Integer shippingId){
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null){ //判断当前用户是否已经登陆
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return iShippingService.select(user.getId(), shippingId);
    }

    /**
     * 查询某个用户的所以收货地址（分页）
     * @param pageNum 页码
     * @param pageSize 一页数量
     * @param session 会话对象
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping("list.do")
    @ResponseBody
    public ServerResponse<PageInfo> list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                         @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
                                         HttpSession session){
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null){ //判断当前用户是否已经登陆
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return iShippingService.list(user.getId(), pageNum, pageSize);
    }

}
