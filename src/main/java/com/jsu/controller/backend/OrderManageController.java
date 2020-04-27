package com.jsu.controller.backend;

import com.jsu.common.Const;
import com.jsu.common.ResponseCode;
import com.jsu.common.ServerResponse;
import com.jsu.pojo.User;
import com.jsu.service.IOrderService;
import com.jsu.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/manage/order/")
public class OrderManageController {

    @Autowired
    private IUserService iUserService;

    @Autowired
    private IOrderService iOrderService;

    /**
     * 查询订单列表接口
     * @param session 会话对象
     * @param pageNum 分页信息，当前页（默认值为1）
     * @param pageSize 分页大小，每页容量（默认值为10）
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping("list.do")
    @ResponseBody
    public ServerResponse orderList(HttpSession session,
                               @RequestParam(value = "pageNum" ,defaultValue = "1") int pageNum,
                               @RequestParam(value = "pageSize" ,defaultValue = "10") int pageSize) {
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "用户未登录,请登录管理员");

        }
        if (iUserService.checkAdminRole(user).isSuccess()) {
            //填充产品的业务逻辑
            return iOrderService.manageList(pageNum, pageSize);
        } else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    /**
     * 查询商品订单详情
     * @param session 会话对象
     * @param orderNo 订单号
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping("detail.do")
    @ResponseBody
    public ServerResponse orderDetail(HttpSession session,Long orderNo) {
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "用户未登录,请登录管理员");

        }
        if (iUserService.checkAdminRole(user).isSuccess()) {
            //填充产品的业务逻辑
            return iOrderService.manageDetail(orderNo);
        } else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    /**
     * 查询某个订单号（此处应该实现多条件匹配和模糊查询的效果,不过我没有实现，不要问我为什么，因为我懒）
     * @param session 会话对象
     * @param orderNo 订单号
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping("search.do")
    @ResponseBody
    public ServerResponse orderSearch(HttpSession session,Long orderNo,
                                      @RequestParam(value = "pageNum" ,defaultValue = "1") int pageNum,
                                      @RequestParam(value = "pageSize" ,defaultValue = "10") int pageSize) {
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "用户未登录,请登录管理员");

        }
        if (iUserService.checkAdminRole(user).isSuccess()) {
            //填充产品的业务逻辑
            return iOrderService.manageSearch(orderNo, pageNum, pageSize);
        } else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    /**
     * 发货接口
     * @param session 会话对象
     * @param orderNo 订单号
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping("send_goods.do")
    @ResponseBody
    public ServerResponse<String> orderSendGoods(HttpSession session,Long orderNo) {
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "用户未登录,请登录管理员");

        }
        if (iUserService.checkAdminRole(user).isSuccess()) {
            //填充产品的业务逻辑
            return iOrderService.manageSendGoods(orderNo);
        } else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }
}
