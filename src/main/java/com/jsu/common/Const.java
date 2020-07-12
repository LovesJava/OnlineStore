package com.jsu.common;

import com.google.common.collect.Sets;

import java.util.Set;

//常量类
public class Const {

    public static final String CURRENT_USER = "currentUser";

    public static final String EMAIL = "email";
    public static final String USERNAME = "username";

    //token的前缀
    public static final String TOKEN_PREFIX = "token_";

    //设置session的缓存时间常量
    public interface RedisCacheExtime{
        int REDIS_SESSION_EXTIME = 60 * 30; //30分钟
    }

    public interface Cart{ //购物车选择状态
        int CHECKED = 1;//购物车选中状态
        int UN_CHECKED = 0;//购物车未选中状态

        String LIMIT_NUM_FAIL = "LIMIT_NUM_FAIL"; //购物车商品数量限制失败
        String LIMIT_NUM_SUCCESS = "LIMIT_NUM_SUCCESS"; //购物车商品数量限制成功
    }

    //按价格排序（升序或者降序）
    public interface ProductListOrderBy{
        Set<String> PRICE_ASC_DESC = Sets.newHashSet("price_desc", "price_asc");
    }

    public interface Role{ //声明角色的常量
        int ROLE_CUSTOMER = 0;//普通用户
        int ROLE_ADMIN = 1;//管理员
    }

    public enum ProductStatusEnum{  //产品销售状态枚举类
        ON_SALE("在售", 1),
        OFF_SHELF("下架", 2);
        private String value;
        private int code;

        ProductStatusEnum(String value, int code) {
            this.value = value;
            this.code = code;
        }
        public String getValue() {
            return value;
        }
        public int getCode() {
            return code;
        }
    }

    public enum OrderStatusEnum{ //订单状态的枚举类
        CANCELED(0, "已取消"),
        NO_PAY(10, "未支付"),
        PAID(20, "已付款"),
        SHIPPED(40, "已发货"),
        ORDER_SUCCESS(50, "订单完成"),
        ORDER_CLOSE(60, "订单关闭")
        ;

        private String value;
        private int code;

        OrderStatusEnum(int code, String value) {
            this.value = value;
            this.code = code;
        }
        public String getValue() {
            return value;
        }
        public int getCode() {
            return code;
        }

        //遍历枚举类的所有枚举对象，找对应的code的枚举就返回，找不到就抛出异常
        public static OrderStatusEnum codeOf(int code){
            for(OrderStatusEnum orderStatusEnum : values()){
                if(orderStatusEnum.getCode() == code){
                    return orderStatusEnum;
                }
            }
            throw new RuntimeException("没有找到对应的枚举");
        }
    }

    //支付宝回调的状态
    public interface AlipayCallback{
        String TRADE_STATUS_WAIT_BUYER_PAY = "WAIT_BUYER_PAY"; //等待支付
        String TRADE_STATUS_TRADE_SUCCESS = "TRADE_SUCCESS"; //支付成功

        String RESPONSE_SUCCESS = "success"; //响应成功
        String RESPONSE_FAILED = "failed"; //响应失败
    }

    //支付平台枚举类
    public enum PayPlatformEnum{
        ALIPAY(1,"支付宝");

        PayPlatformEnum(int code,String value){
            this.code = code;
            this.value = value;
        }
        private String value;
        private int code;

        public String getValue() {
            return value;
        }

        public int getCode() {
            return code;
        }

        //遍历枚举类的所有枚举对象，找对应的code的枚举就返回，找不到就抛出异常
        public static PayPlatformEnum codeOf(int code){
            for(PayPlatformEnum payPlatformEnum : values()){
                if(payPlatformEnum.getCode() == code){
                    return payPlatformEnum;
                }
            }
            throw new RuntimeException("没有找到对应的枚举");
        }
    }

    //支付类型枚举类
    public enum PaymentTypeEnum{
        ONLINE_PAY(1,"在线支付");

        PaymentTypeEnum(int code,String value){
            this.code = code;
            this.value = value;
        }
        private String value;
        private int code;

        public String getValue() {
            return value;
        }

        public int getCode() {
            return code;
        }

        //遍历枚举类的所有枚举对象，找对应的code的枚举就返回，找不到就抛出异常
        public static PaymentTypeEnum codeOf(int code){
            for(PaymentTypeEnum paymentTypeEnum : values()){
                if(paymentTypeEnum.getCode() == code){
                    return paymentTypeEnum;
                }
            }
            throw new RuntimeException("没有找到对应的枚举");
        }

    }
}
