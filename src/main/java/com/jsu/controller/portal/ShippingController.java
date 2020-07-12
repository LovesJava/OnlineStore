package com.jsu.controller.portal;

import com.github.pagehelper.PageInfo;
import com.jsu.common.Const;
import com.jsu.common.ResponseCode;
import com.jsu.common.ServerResponse;
import com.jsu.pojo.Shipping;
import com.jsu.pojo.User;
import com.jsu.service.IShippingService;
import com.jsu.util.CookieUtil;
import com.jsu.util.JsonUtil;
import com.jsu.util.RedisPoolUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/shipping/")
public class ShippingController {

    @Autowired
    private IShippingService iShippingService;

    /**
     * 新增收货地址
     * @param httpServletRequest 请求对象
     * @param shipping 地址对象
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping("add.do")
    @ResponseBody
    public ServerResponse add(HttpServletRequest httpServletRequest, Shipping shipping){
        //获取loginToken对应的值
        String loginToken = CookieUtil.readLoginToken(httpServletRequest);
        if (StringUtils.isEmpty(loginToken)){
            return ServerResponse.createByErrorMessage("用户未登录，无法获取当前用户的信息");
        }
        //通过loginToken从Redis中获取user序列化后的字符串
        String userJsonStr = RedisPoolUtil.get(loginToken);
        //将userJsonStr反序列化
        User user = JsonUtil.string2Obj(userJsonStr, User.class);

        if (user == null){ //判断当前用户是否已经登陆
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return iShippingService.add(user.getId(), shipping);
    }

    /**
     * 删除收货地址
     * @param httpServletRequest 请求对象
     * @param shippingId 收货地址ID
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping("delete.do")
    @ResponseBody
    public ServerResponse delete(HttpServletRequest httpServletRequest, Integer shippingId){
        //获取loginToken对应的值
        String loginToken = CookieUtil.readLoginToken(httpServletRequest);
        if (StringUtils.isEmpty(loginToken)){
            return ServerResponse.createByErrorMessage("用户未登录，无法获取当前用户的信息");
        }
        //通过loginToken从Redis中获取user序列化后的字符串
        String userJsonStr = RedisPoolUtil.get(loginToken);
        //将userJsonStr反序列化
        User user = JsonUtil.string2Obj(userJsonStr, User.class);

        if (user == null){ //判断当前用户是否已经登陆
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return iShippingService.delete(user.getId(), shippingId);
    }

    /**
     * 更新收货地址
     * @param httpServletRequest 请求对象
     * @param shipping 地址对象
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping("update.do")
    @ResponseBody
    public ServerResponse update(HttpServletRequest httpServletRequest, Shipping shipping){
        //获取loginToken对应的值
        String loginToken = CookieUtil.readLoginToken(httpServletRequest);
        if (StringUtils.isEmpty(loginToken)){
            return ServerResponse.createByErrorMessage("用户未登录，无法获取当前用户的信息");
        }
        //通过loginToken从Redis中获取user序列化后的字符串
        String userJsonStr = RedisPoolUtil.get(loginToken);
        //将userJsonStr反序列化
        User user = JsonUtil.string2Obj(userJsonStr, User.class);

        if (user == null){ //判断当前用户是否已经登陆
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return iShippingService.update(user.getId(), shipping);
    }

    /**
     * 查询地址详情
     * @param httpServletRequest 请求对象
     * @param shippingId 地址对象Id
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping("select.do")
    @ResponseBody
    public ServerResponse select(HttpServletRequest httpServletRequest, Integer shippingId){
        //获取loginToken对应的值
        String loginToken = CookieUtil.readLoginToken(httpServletRequest);
        if (StringUtils.isEmpty(loginToken)){
            return ServerResponse.createByErrorMessage("用户未登录，无法获取当前用户的信息");
        }
        //通过loginToken从Redis中获取user序列化后的字符串
        String userJsonStr = RedisPoolUtil.get(loginToken);
        //将userJsonStr反序列化
        User user = JsonUtil.string2Obj(userJsonStr, User.class);

        if (user == null){ //判断当前用户是否已经登陆
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return iShippingService.select(user.getId(), shippingId);
    }

    /**
     * 查询某个用户的所以收货地址（分页）
     * @param pageNum 页码
     * @param pageSize 一页数量
     * @param httpServletRequest 请求对象
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping("list.do")
    @ResponseBody
    public ServerResponse<PageInfo> list(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                                         @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
                                         HttpServletRequest httpServletRequest){
        //获取loginToken对应的值
        String loginToken = CookieUtil.readLoginToken(httpServletRequest);
        if (StringUtils.isEmpty(loginToken)){
            return ServerResponse.createByErrorMessage("用户未登录，无法获取当前用户的信息");
        }
        //通过loginToken从Redis中获取user序列化后的字符串
        String userJsonStr = RedisPoolUtil.get(loginToken);
        //将userJsonStr反序列化
        User user = JsonUtil.string2Obj(userJsonStr, User.class);

        if (user == null){ //判断当前用户是否已经登陆
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return iShippingService.list(user.getId(), pageNum, pageSize);
    }

}
