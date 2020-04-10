package com.jsu.controller.portal;

import com.jsu.common.Const;
import com.jsu.common.ResponseCode;
import com.jsu.common.ServerResponse;
import com.jsu.pojo.User;
import com.jsu.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user/")
public class UserController {

    @Autowired
    private IUserService iUserService;

    /**
     * 用户登录接口
     * @param username 用户名
     * @param password 密码
     * @param session 会话对象
     * @return 通用的响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping(value = "login.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<User> login(String username, String password, HttpSession session){
        //service -> mybatis -> dao
        ServerResponse<User> response = iUserService.login(username,password);
        if (response.isSuccess()){ //如果响应对象是登录成功的响应对象
            //将user设置到session中
            session.setAttribute(Const.CURRENT_USER, response.getData());
        }
        return response;
    }

    /**
     * 登出功能
     * @param session 会话对象
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping(value = "logout.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> logout(HttpSession session){
        session.removeAttribute(Const.CURRENT_USER);
        return ServerResponse.createBySuccess();
    }

    /**
     * 注册功能
     * @param user 用户对象
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping(value = "register.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> register(User user){
        return iUserService.register(user);
    }

    /**
     * 用于前端实时反馈用户名和邮箱是否已经在数据库中存在
     * @param str email||username
     * @param type 判断str是email还是用户名
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping(value = "check_valid.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> checkValid(String str, String type){
        return iUserService.checkValid(str, type);
    }

    /**
     * 获取登录用户的信息
     * @param session 会话对象
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping(value = "get_user_info.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<User> getUserInfo(HttpSession session){
        User user = (User)session.getAttribute(Const.CURRENT_USER);
        if (user != null){
            return ServerResponse.createBySuccess(user);
        }
        return ServerResponse.createByErrorMeesage("用户未登录，无法获取当前用户的信息");
    }

    /**
     * 获取忘记密码的提示问题
     * @param username 用户名
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping(value = "forget_get_question.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> forgetGetQuestion(String username){
        return iUserService.selectQuestion(username);
    }

    /**
     * 校验忘记密码的提示问题的答案
     * @param username 用户名
     * @param question 问题
     * @param answer 答案
     * @return 通用响应对象（若校验通过，会把token令牌设置在响应中）
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping(value = "forget_check_answer.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> forgetCheckAnswer(String username, String question, String answer){
        return iUserService.checkAnswer(username, question, answer);
    }

    /**
     * 用户重置密码(未登录状态)
     * @param username 用户名
     * @param passwordNew 用户新密码
     * @param forgetToken 令牌
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping(value = "forget_reset_password.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> forgetRestPassword(String username, String passwordNew, String forgetToken){
        return iUserService.forgetRestPassword(username, passwordNew, forgetToken);
    }

    /**
     * 用户重置密码(登录状态)
     * @param session 会话对象
     * @param passwordOld 旧密码
     * @param passwordNew 新密码
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping(value = "reset_password.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> resetPassword(HttpSession session, String passwordOld, String passwordNew){
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null){
            return ServerResponse.createByErrorMeesage("用户未登录，请登录之后再操作");
        }
        return iUserService.resetPassword(passwordOld, passwordNew, user);
    }

    /**
     * 更新用户个人信息
     * @param session 会话对象
     * @param user 用户对象
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping(value = "update_information.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<User> updateInformation(HttpSession session, User user){
        User currentUser = (User) session.getAttribute(Const.CURRENT_USER);
        if (currentUser == null){
            return ServerResponse.createByErrorMeesage("用户未登录，请登录之后再操作");
        }
        user.setId(currentUser.getId());
        user.setUsername(currentUser.getUsername());
        ServerResponse<User> response = iUserService.updateInformation(user);
        if (response.isSuccess()){//如果更新个人信息成功了
            session.setAttribute(Const.CURRENT_USER, response.getData());
        }
        return response;
    }

    /**
     * 获取用户详细信息
     * @param session 会话对象
     * @return 通用响应对象
     * ResponseBody : 返回的时候自动通过SpringMVC的jackson插件让返回值序列化为json
     */
    @RequestMapping(value = "get_information.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<User> getInformation(HttpSession session){
        User currentUser = (User) session.getAttribute(Const.CURRENT_USER);
        if (currentUser == null){
            return ServerResponse.createByErrorCodeMeesage(ResponseCode.NEED_LOGIN.getCode(),"用户未登录，需要强制登录");
        }
        return iUserService.getInformation(currentUser.getId());
    }

}
