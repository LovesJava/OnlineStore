package com.jsu.service.impl;

import com.google.common.base.Splitter;
import com.google.common.collect.Lists;
import com.jsu.common.Const;
import com.jsu.common.ResponseCode;
import com.jsu.common.ServerResponse;
import com.jsu.dao.CartMapper;
import com.jsu.dao.ProductMapper;
import com.jsu.pojo.Cart;
import com.jsu.pojo.Product;
import com.jsu.service.ICartService;
import com.jsu.util.BigDecimalUtil;
import com.jsu.util.PropertiesUtil;
import com.jsu.vo.CartProductVo;
import com.jsu.vo.CartVo;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

//购物车业务层
@Service("iCartService")
public class CartServiceImpl implements ICartService {

    @Autowired
    private CartMapper cartMapper;

    @Autowired
    private ProductMapper productMapper;

    //添加商品方法
    public ServerResponse<CartVo> add(Integer userId, Integer productId, Integer count){
        //判断参数是否非法
        if (productId == null || count == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.ILLEGAL_ARGUMENT.getCode(), ResponseCode.ILLEGAL_ARGUMENT.getDesc());
        }

        Cart cart = cartMapper.selectCartByUserIdProductId(userId, productId);
        System.out.println(cart);
        if (cart == null){ //若为空，则这个产品不在这个购物车内，需要新增一个这个产品的记录
            Cart cartItem = new Cart();
            cartItem.setQuantity(count);
            cartItem.setChecked(Const.Cart.CHECKED);
            cartItem.setProductId(productId);
            cartItem.setUserId(userId);
            //将新创建的购物车对象插入到数据库中
            cartMapper.insert(cartItem);
        } else { //这个产品已经在这个用户的购物车中了，所以需要增加产品的数量
            count = cart.getQuantity() + count;
            cart.setQuantity(count);
            //将购物车对象更新到数据库中
            cartMapper.updateByPrimaryKeySelective(cart);
        }
        //根据userId填充CartVo对象，并返回
        return this.list(userId);
    }

    //更新购物车中产品
    public ServerResponse<CartVo> update(Integer userId, Integer productId, Integer count){
        //判断参数是否非法
        if (productId == null || count == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.ILLEGAL_ARGUMENT.getCode(), ResponseCode.ILLEGAL_ARGUMENT.getDesc());
        }
        Cart cart = cartMapper.selectCartByUserIdProductId(userId, productId);
        if (cart != null){ //若购物车对象不为空，则更新数量
            cart.setQuantity(count);
        }
        //在数据库中更新cart对象
        cartMapper.updateByPrimaryKeySelective(cart);
        return this.list(userId);
    }

    //删除购物车中的产品
    public ServerResponse<CartVo> deleteProduct(Integer userId, String productIds){
        //用逗号分割字符串，并自动添加到集合中
        List<String> productList = Splitter.on(",").splitToList(productIds);
        if (CollectionUtils.isEmpty(productList)) {  //若该集合为空的话，则返回参数错误
            return ServerResponse.createByErrorCodeMessage(ResponseCode.ILLEGAL_ARGUMENT.getCode(), ResponseCode.ILLEGAL_ARGUMENT.getDesc());
        }
        //删除的持久层操作
        cartMapper.deleteByUserIdProductIds(userId, productList);
        //重新获取CartVO对象，并返回
        return this.list(userId);
    }

    //查询购物车内商品集合
    public ServerResponse<CartVo> list(Integer userId){
        CartVo cartVo = this.getCartVoLimit(userId);
        return ServerResponse.createBySuccess(cartVo);
    }

    //全选||全反选||单独选||单独反选商品(单选时，需要传入productId，全选时，productId传入null即可)
    public ServerResponse<CartVo> selectOrUnselect(Integer userId, Integer productId, Integer checked){
        cartMapper.checkedOrUncheckedProduct(userId, productId, checked);
        return this.list(userId);
    }

    //查询购物车内商品的数量
    public ServerResponse<Integer> getCartProductCount(Integer userId){
        if (userId == null){
            return ServerResponse.createBySuccess(0);
        }
        return ServerResponse.createBySuccess(cartMapper.selectCartProductCount(userId));
    }

    //查询用户的购物车内的商品，并填充到CartVo对象中
    private CartVo getCartVoLimit(Integer userId){
        CartVo cartVo = new CartVo();
        List<Cart> cartList =cartMapper.selectCartByUserId(userId);

        //创建一个CartProductVo的集合
        List<CartProductVo> cartProductVoList = Lists.newArrayList();
        BigDecimal cartTotalPrice = new BigDecimal("0");

        if (CollectionUtils.isNotEmpty(cartList)){ //若cartList不为空
            for (Cart cartItem : cartList){ //遍历cartList集合，并填充CartProductVo对象
                CartProductVo cartProductVo = new CartProductVo();
                cartProductVo.setId(cartItem.getId());
                cartProductVo.setUserId(userId);
                cartProductVo.setProductId(cartItem.getProductId());

                //在数据库中查询商品ID，返回商品对象
                Product product = productMapper.selectByPrimaryKey(cartItem.getProductId());
                if (product != null){ //若产品不为空
                    //将商品属性填充到CartProductVO对象中
                    cartProductVo.setProductMainImage(product.getMainImage());
                    cartProductVo.setProductName(product.getName());
                    cartProductVo.setProductSubtitle(product.getSubtitle());
                    cartProductVo.setProductStatus(product.getStatus());
                    cartProductVo.setProductPrice(product.getPrice());
                    cartProductVo.setProductStock(product.getStock());

                    //判断库存
                    int buyLimitCount = 0;
                    if (product.getStock() >= cartItem.getQuantity()){ //若商品库存大于购物车内商品的数量
                        //库存充足的时候
                        buyLimitCount = cartItem.getQuantity();
                        cartProductVo.setLimitQuantity(Const.Cart.LIMIT_NUM_SUCCESS);
                    } else { //购物车中放入产品的有效数量（不能超过商品的库存量）
                        buyLimitCount = product.getStock();
                        cartProductVo.setLimitQuantity(Const.Cart.LIMIT_NUM_FAIL);
                        //购物车中更新有效库存
                        Cart cartForQuantity = new Cart();
                        cartForQuantity.setId(cartItem.getId());
                        cartForQuantity.setQuantity(buyLimitCount);
                        cartMapper.updateByPrimaryKeySelective(cartForQuantity);
                    }
                    cartProductVo.setQuantity(buyLimitCount);
                    //计算总价(某一个商品的总价)
                    cartProductVo.setProductTotalPrice(BigDecimalUtil.mul(product.getPrice().doubleValue(), cartProductVo.getQuantity().doubleValue()));
                    //购物车产品勾选
                    cartProductVo.setProductChecked(cartItem.getChecked());
                }
                //若是某个商品是勾选状态，则需要计入购物车总价中
                if (cartItem.getChecked() == Const.Cart.CHECKED){
                    cartTotalPrice = BigDecimalUtil.add(cartTotalPrice.doubleValue(), cartProductVo.getProductTotalPrice().doubleValue());
                }
                //将CartProductVo对象添加到集合中
                cartProductVoList.add(cartProductVo);
            }
        }
        cartVo.setCartTotalPrice(cartTotalPrice);
        cartVo.setCartProductVoList(cartProductVoList);
        cartVo.setAllChecked(this.getAllCheckedStatus(userId));
        cartVo.setImageHost(PropertiesUtil.getProperty("ftp.server.http.prefix"));
        return cartVo;
    }

    private boolean getAllCheckedStatus(Integer userId){
        if (userId == null){
            return false;
        }
        return cartMapper.selectCartProductCheckedStatusByUserId(userId) == 0;
    }

}
