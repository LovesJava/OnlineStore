package com.jsu.controller.backend;

import com.google.common.collect.Maps;
import com.jsu.common.ResponseCode;
import com.jsu.common.ServerResponse;
import com.jsu.pojo.Product;
import com.jsu.pojo.User;
import com.jsu.service.IFileService;
import com.jsu.service.IProductService;
import com.jsu.service.IUserService;
import com.jsu.util.CookieUtil;
import com.jsu.util.JsonUtil;
import com.jsu.util.PropertiesUtil;
import com.jsu.util.RedisShardedPoolUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

//后台的商品管理
@Controller
@RequestMapping("/manage/product/")
public class ProductManageController {

    @Autowired
    private IUserService iUserService;

    @Autowired
    private IProductService iProductService;

    @Autowired
    private IFileService iFileService;

    /**
     * 根据传递的product对象是否包含id判断是新增产品还是更新产品
     * @param httpServletRequest 请求对象
     * @param product 产品对象
     * @return 通用的响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping(value = "save.do")
    @ResponseBody
    public ServerResponse productSave(HttpServletRequest httpServletRequest, Product product){
        /*
        //判断当前用户是否具有操作权限
        //获取loginToken对应的值
        String loginToken = CookieUtil.readLoginToken(httpServletRequest);
        if (StringUtils.isEmpty(loginToken)){
            return ServerResponse.createByErrorMessage("用户未登录，无法获取当前用户的信息");
        }
        //通过loginToken从Redis中获取user序列化后的字符串
        String userJsonStr = RedisShardedPoolUtil.get(loginToken);
        //将userJsonStr反序列化
        User user = JsonUtil.string2Obj(userJsonStr, User.class);

        if (user == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "用户未登录，请登录管理员");
        }
        if (iUserService.checkAdminRole(user).isSuccess()){
            //填充增加产品的业务逻辑
            return iProductService.saveOrUpdateProduct(product);
        } else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
        */
        //全部通过拦截器验证是否登录以及权限验证
        return iProductService.saveOrUpdateProduct(product);
    }

    /**
     * 更新产品状态
     * @param httpServletRequest 请求对象
     * @param productId 产品ID
     * @param productStatus 产品状态
     * @return 通用的响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping(value = "set_sale_status.do")
    @ResponseBody
    public ServerResponse setSaleStatus(HttpServletRequest httpServletRequest, Integer productId, Integer productStatus){
        /*
        //判断当前用户是否具有操作权限
        //获取loginToken对应的值
        String loginToken = CookieUtil.readLoginToken(httpServletRequest);
        if (StringUtils.isEmpty(loginToken)){
            return ServerResponse.createByErrorMessage("用户未登录，无法获取当前用户的信息");
        }
        //通过loginToken从Redis中获取user序列化后的字符串
        String userJsonStr = RedisShardedPoolUtil.get(loginToken);
        //将userJsonStr反序列化
        User user = JsonUtil.string2Obj(userJsonStr, User.class);

        if (user == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "用户未登录，请登录管理员");
        }
        if (iUserService.checkAdminRole(user).isSuccess()){
            //填充更新产品状态的业务逻辑
            return iProductService.setSaleStatus(productId, productStatus);
        } else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
        */
        //全部通过拦截器验证是否登录以及权限验证
        return iProductService.setSaleStatus(productId, productStatus);
    }

    /**
     * 获取产品详情
     * @param httpServletRequest 请求对象
     * @param productId 产品ID
     * @return 通用的响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping(value = "detail.do")
    @ResponseBody
    public ServerResponse getDetail(HttpServletRequest httpServletRequest, Integer productId){
        /*
        //判断当前用户是否具有操作权限
        //获取loginToken对应的值
        String loginToken = CookieUtil.readLoginToken(httpServletRequest);
        if (StringUtils.isEmpty(loginToken)){
            return ServerResponse.createByErrorMessage("用户未登录，无法获取当前用户的信息");
        }
        //通过loginToken从Redis中获取user序列化后的字符串
        String userJsonStr = RedisShardedPoolUtil.get(loginToken);
        //将userJsonStr反序列化
        User user = JsonUtil.string2Obj(userJsonStr, User.class);

        if (user == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "用户未登录，请登录管理员");
        }
        if (iUserService.checkAdminRole(user).isSuccess()){
            //获取产品详情的业务逻辑
            return iProductService.manageProductDetail(productId);
        } else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
        */
        //全部通过拦截器验证是否登录以及权限验证
        return iProductService.manageProductDetail(productId);
    }

    /**
     * 获取产品列表,并且分页
     * @param httpServletRequest 请求对象
     * @param pageNum 当前页，默认值为第一页
     * @param pageSize 每一页的容量，默认值为10
     * @return 通用的响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping(value = "list.do")
    @ResponseBody
    public ServerResponse getList(HttpServletRequest httpServletRequest, @RequestParam(value = "pageNum",defaultValue = "1") int pageNum, @RequestParam(value = "pageSize",defaultValue = "10") int pageSize){
        /*
        //判断当前用户是否具有操作权限
        //获取loginToken对应的值
        String loginToken = CookieUtil.readLoginToken(httpServletRequest);
        if (StringUtils.isEmpty(loginToken)){
            return ServerResponse.createByErrorMessage("用户未登录，无法获取当前用户的信息");
        }
        //通过loginToken从Redis中获取user序列化后的字符串
        String userJsonStr = RedisShardedPoolUtil.get(loginToken);
        //将userJsonStr反序列化
        User user = JsonUtil.string2Obj(userJsonStr, User.class);

        if (user == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "用户未登录，请登录管理员");
        }
        if (iUserService.checkAdminRole(user).isSuccess()){
            //返回响应对象
            return iProductService.getProductList(pageNum, pageSize);
        } else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
        */
        //全部通过拦截器验证是否登录以及权限验证
        return iProductService.getProductList(pageNum, pageSize);
    }

    /**
     * 产品搜索功能
     * @param httpServletRequest 请求对象
     * @param productName 产品名称（近似值）
     * @param productId 产品Id
     * @param pageNum 当前页，默认值为第一页
     * @param pageSize 每一页的容量，默认值为10
     * @return 通用的响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping(value = "search.do")
    @ResponseBody
    public ServerResponse productSearch(HttpServletRequest httpServletRequest, String productName, Integer productId, @RequestParam(value = "pageNum",defaultValue = "1") int pageNum, @RequestParam(value = "pageSize",defaultValue = "10") int pageSize){
        /*
        //判断当前用户是否具有操作权限
        //获取loginToken对应的值
        String loginToken = CookieUtil.readLoginToken(httpServletRequest);
        if (StringUtils.isEmpty(loginToken)){
            return ServerResponse.createByErrorMessage("用户未登录，无法获取当前用户的信息");
        }
        //通过loginToken从Redis中获取user序列化后的字符串
        String userJsonStr = RedisShardedPoolUtil.get(loginToken);
        //将userJsonStr反序列化
        User user = JsonUtil.string2Obj(userJsonStr, User.class);

        if (user == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "用户未登录，请登录管理员");
        }
        if (iUserService.checkAdminRole(user).isSuccess()){
            //填充业务逻辑，返回响应对象
            return iProductService.searchProduct(productName, productId, pageNum, pageSize);
        } else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
        */
        //全部通过拦截器验证是否登录以及权限验证
        return iProductService.searchProduct(productName, productId, pageNum, pageSize);
    }

    /**
     * 文件上传接口
     * @param file SpringMVC的文件上传接口对象
     * @param request 请求对象
     * @return 通用的响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping(value = "upload.do")
    @ResponseBody
    public ServerResponse upload(HttpServletRequest httpServletRequest, @RequestParam(value = "upload_file", required = false) MultipartFile file, HttpServletRequest request){
        /*
        //判断当前用户是否具有操作权限
        //获取loginToken对应的值
        String loginToken = CookieUtil.readLoginToken(httpServletRequest);
        if (StringUtils.isEmpty(loginToken)){
            return ServerResponse.createByErrorMessage("用户未登录，无法获取当前用户的信息");
        }
        //通过loginToken从Redis中获取user序列化后的字符串
        String userJsonStr = RedisShardedPoolUtil.get(loginToken);
        //将userJsonStr反序列化
        User user = JsonUtil.string2Obj(userJsonStr, User.class);

        if (user == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "用户未登录，请登录管理员");
        }
        if (iUserService.checkAdminRole(user).isSuccess()){ //处理文件上传的业务逻辑
            //获取文件上传到服务器位置(非FTP服务器)
            String path = request.getSession().getServletContext().getRealPath("upload");
            String targetFileName = iFileService.upload(file, path);
            //文件的URL地址
            String url = PropertiesUtil.getProperty("ftp.server.http.prefix") + targetFileName;

            //返回一个HashMap集合存储文件名和文件URL地址
            Map fileMap = Maps.newHashMap();
            fileMap.put("uri", targetFileName);
            fileMap.put("url", url);
            return ServerResponse.createBySuccess(fileMap);
        } else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
        */
        //全部通过拦截器验证是否登录以及权限验证
        //获取文件上传到服务器位置(非FTP服务器)
        String path = request.getSession().getServletContext().getRealPath("upload");
        String targetFileName = iFileService.upload(file, path);
        //文件的URL地址
        String url = PropertiesUtil.getProperty("ftp.server.http.prefix") + targetFileName;

        //返回一个HashMap集合存储文件名和文件URL地址
        Map fileMap = Maps.newHashMap();
        fileMap.put("uri", targetFileName);
        fileMap.put("url", url);
        return ServerResponse.createBySuccess(fileMap);
    }

    @RequestMapping(value = "richtext_img_upload.do")
    @ResponseBody
    public Map richtextImgUpload(HttpServletRequest httpServletRequest,
                                 @RequestParam(value = "upload_file", required = false) MultipartFile file,
                                 HttpServletRequest request, HttpServletResponse response){
        Map resultMap = Maps.newHashMap(); //返回的map集合
        /*
        //判断当前用户是否具有操作权限
        //获取loginToken对应的值
        String loginToken = CookieUtil.readLoginToken(httpServletRequest);
        if (StringUtils.isEmpty(loginToken)){
            resultMap.put("success", false);
            resultMap.put("msg","请登录管理员");
            return resultMap;
        }
        //通过loginToken从Redis中获取user序列化后的字符串
        String userJsonStr = RedisShardedPoolUtil.get(loginToken);
        //将userJsonStr反序列化
        User user = JsonUtil.string2Obj(userJsonStr, User.class);

        if (user == null){
            resultMap.put("success", false);
            resultMap.put("msg","请登录管理员");
            return resultMap;
        }
        //富文本中对象返回值有自己的要求，我们使用的是simditor，所有按照simditor的要求返回
        if (iUserService.checkAdminRole(user).isSuccess()){ //处理文件上传的业务逻辑
            //获取文件上传到服务器位置(非FTP服务器)
            String path = request.getSession().getServletContext().getRealPath("upload");
            String targetFileName = iFileService.upload(file, path);
            if (StringUtils.isBlank(targetFileName)){
                //若返回的目标文件名为空，则上传失败
                resultMap.put("success", false);
                resultMap.put("msg","文件上传失败");
                return resultMap;
            }
            //文件的URL地址
            String url = PropertiesUtil.getProperty("ftp.server.http.prefix") + targetFileName;

            resultMap.put("success", true);
            resultMap.put("msg","文件上传成功");
            resultMap.put("file_path", url); //文件上传成功，要返回文件的url地址
            //上传成功，增加响应头信息
            response.addHeader("Access-Control-Allow-Headers","X-File-Name");
            return resultMap;
        } else {
            resultMap.put("success", false);
            resultMap.put("msg","无权限操作");
            return resultMap;
        }
        */
        //全部通过拦截器验证是否登录以及权限验证
        //获取文件上传到服务器位置(非FTP服务器)
        String path = request.getSession().getServletContext().getRealPath("upload");
        String targetFileName = iFileService.upload(file, path);
        if (StringUtils.isBlank(targetFileName)){
            //若返回的目标文件名为空，则上传失败
            resultMap.put("success", false);
            resultMap.put("msg","文件上传失败");
            return resultMap;
        }

        //文件的URL地址
        String url = PropertiesUtil.getProperty("ftp.server.http.prefix") + targetFileName;
        resultMap.put("success", true);
        resultMap.put("msg","文件上传成功");
        resultMap.put("file_path", url); //文件上传成功，要返回文件的url地址
        //上传成功，增加响应头信息
        response.addHeader("Access-Control-Allow-Headers","X-File-Name");
        return resultMap;
    }

}
