package com.jsu.common;

import com.google.common.collect.Sets;

import java.util.Set;

//常量类
public class Const {

    public static final String CURRENT_USER = "currentUser";

    public static final String EMAIL = "email";
    public static final String USERNAME = "username";

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
        ON_SALE("在售", 1);
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
}
