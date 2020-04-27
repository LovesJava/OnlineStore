package com.jsu.controller.portal;

import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.demo.trade.config.Configs;
import com.google.common.collect.Maps;
import com.jsu.common.Const;
import com.jsu.common.ResponseCode;
import com.jsu.common.ServerResponse;
import com.jsu.pojo.User;
import com.jsu.service.IOrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Iterator;
import java.util.Map;

//支付接口和订单接口均在此控制器中实现
@Controller
@RequestMapping("/order/")
public class OrderController {

    private static final Logger logger = LoggerFactory.getLogger(OrderController.class);

    @Autowired
    private IOrderService iOrderService;

    /**
     * 创建订单接口
     * @param session 会话对象
     * @param shippingId 收获地址id
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping("create.do")
    @ResponseBody
    public ServerResponse create(HttpSession session, Integer shippingId){
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null){ //判断当前用户是否已经登陆
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return iOrderService.createOrder(user.getId(), shippingId);
    }

    /**
     * 取消订单（此接口只能取消未付款的订单）
     * @param session 会话对象
     * @param orderNo 订单号
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping("cancel.do")
    @ResponseBody
    public ServerResponse cancel(HttpSession session, Long orderNo){
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null){ //判断当前用户是否已经登陆
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return iOrderService.cancel(user.getId(), orderNo);
    }

    /**
     * 获取购物车中被选中的商品详情
     * @param session 会话对象
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping("get_order_cart_product.do")
    @ResponseBody
    public ServerResponse getOrderCartProduct(HttpSession session){
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null){ //判断当前用户是否已经登陆
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return iOrderService.getOrderCartProduct(user.getId());
    }


    /**
     * 获取订单详情
     * @param session 会话对象
     * @param orderNo 订单号
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping("detail.do")
    @ResponseBody
    public ServerResponse detail(HttpSession session, Long orderNo){
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null){ //判断当前用户是否已经登陆
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return iOrderService.getOrderDetail(user.getId(), orderNo);
    }

    /**
     * 查看用户订单列表
     * @param session 会话对象
     * @param pageNum 分页信息，当前页（默认值为1）
     * @param pageSize 分页大小，每页容量（默认值为10）
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping("list.do")
    @ResponseBody
    public ServerResponse list(HttpSession session,
                               @RequestParam(value = "pageNum" ,defaultValue = "1") int pageNum,
                               @RequestParam(value = "pageSize" ,defaultValue = "10") int pageSize){
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null){ //判断当前用户是否已经登陆
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        return iOrderService.getOrderList(user.getId(), pageNum, pageSize);
    }

    /**
     * 支付接口
     * @param session 会话对象
     * @param orderNo 订单号
     * @param request 请求对象，用于获取Servlet上下文，得到upload文件夹，
     *                然后把自动生成的二维码上传到ftp服务器上，再获取二维码的地址，将图片进行展示
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping("pay.do")
    @ResponseBody
    public ServerResponse pay(HttpSession session, Long orderNo, HttpServletRequest request){
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null){ //判断当前用户是否已经登陆
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        //获取upload文件夹的真实路径
        String path = request.getSession().getServletContext().getRealPath("upload");
        return iOrderService.pay(orderNo, user.getId(), path);
    }

    /**
     * 支付宝的回调接口
     * @param request 支付宝的回调会将所有信息放到request中
     * @return Object对象，此处会根据alipay要求的参数返回进行参数返回
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping("alipay_callback.do")
    @ResponseBody
    public Object alipayCallback(HttpServletRequest request){
        //用来储存从请求中取出来的键值对
        Map<String, String> params = Maps.newHashMap();

        //获取请求中所有的参数，并以map接收
        Map requestParams = request.getParameterMap();
        //通过迭代器将Map中数据全部取出来
        for (Iterator iterator = requestParams.keySet().iterator(); iterator.hasNext();){
            String name = (String)iterator.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length-1) ? valueStr + values[i] : valueStr + values[i] + ",";
            }
            params.put(name, valueStr);
        }
        logger.info("支付宝回调：sign:{},trade_status:{},参数:{}", params.get("sign"), params.get("trade_status"), params.toString());

        //此时已经获取到支付宝回调的所有参数
        //此处应该验证回调的正确性，是不是支付宝发出的回调，并且还要避免重复通知
        params.remove("sign_type");//支付宝的验签要去除sign_type参数
        try {
            boolean alipayRSACheckedV2 = AlipaySignature.rsaCheckV2(params, Configs.getAlipayPublicKey(),"utf-8", Configs.getSignType());
            if (!alipayRSACheckedV2){ //若返回false，则验证不通过，返回错误信息
                return ServerResponse.createByErrorMessage("非法请求，支付宝验证未通过，此为恶意请求");
            }
        } catch (AlipayApiException e) {
            logger.error("支付宝回调验证异常", e);
        }

        //todo 商户要验证各种数据是否和数据库中的数据一致

        //处理支付宝回调的业务逻辑
        ServerResponse serverResponse = iOrderService.alipayCallback(params);
        if (serverResponse.isSuccess()){ //判断响应对象是否成功
            return Const.AlipayCallback.RESPONSE_SUCCESS;
        }
        return Const.AlipayCallback.RESPONSE_FAILED;
    }

    /**
     * 查询用户订单支付状态
     * @param session 会话对象
     * @param orderNo 订单号
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping("query_order_pay_status.do")
    @ResponseBody
    public ServerResponse<Boolean> queryOrderPayStatus(HttpSession session, Long orderNo){
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null){ //判断当前用户是否已经登陆
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), ResponseCode.NEED_LOGIN.getDesc());
        }
        ServerResponse serverResponse =  iOrderService.queryOrderPayStatus(user.getId(), orderNo);
        if (serverResponse.isSuccess()){
            return ServerResponse.createBySuccess(true);
        }
        return ServerResponse.createBySuccess(false);
    }

}
