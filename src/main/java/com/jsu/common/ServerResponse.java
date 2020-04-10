package com.jsu.common;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.codehaus.jackson.map.annotate.JsonSerialize;

import java.io.Serializable;
//序列化的时候为null的字段不会加入到json中
//保证序列化json的时候，如果是null的对象，key也会消失
@JsonSerialize(include = JsonSerialize.Inclusion.NON_NULL)
//通用的响应对象类，实现序列化接口
public class ServerResponse<T> implements Serializable {

    private int status; //响应状态
    private String msg; //响应信息
    private T data;     //泛型的数据对象

    private ServerResponse(int status){
        this.status = status;
    }

    private ServerResponse(int status, T data){
        this.status = status;
        this.data = data;
    }

    private ServerResponse(int status, String msg, T data){
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

    private ServerResponse(int status, String msg){
        this.status = status;
        this.msg = msg;
    }

    //是否成功响应
    @JsonIgnore//该注解表示，isSuccess字段在序列化之后不会显示在json之中(使之不在json序列化结果当中)
    public boolean isSuccess(){
        return this.status == ResponseCode.SUCCESS.getCode();
    }

    public int getStatus() {
        return status;
    }

    public String getMsg() {
        return msg;
    }

    public T getData() {
        return data;
    }

    //创建响应成功的响应对象（包含状态码）
    public static <T> ServerResponse<T> createBySuccess(){
        return new ServerResponse<>(ResponseCode.SUCCESS.getCode());
    }

    //创建响应成功的响应对象,并包含响应信息和状态码
    public static <T> ServerResponse<T> createBySuccessMessage(String msg){
        return new ServerResponse<>(ResponseCode.SUCCESS.getCode(), msg);
    }

    //创建响应成功的响应对象,并包含数据对象和状态码
    public static <T> ServerResponse<T> createBySuccess(T data){
        return new ServerResponse<>(ResponseCode.SUCCESS.getCode(), data);
    }

    //创建响应成功的响应对象,并包含数据对象、响应信息和状态码
    public static <T> ServerResponse<T> createBySuccess(String msg, T data){
        return new ServerResponse<>(ResponseCode.SUCCESS.getCode(), msg, data);
    }


    //创建响应失败的响应对象（包含状态码）
    public static <T> ServerResponse<T> createByError(){
        return new ServerResponse<>(ResponseCode.ERROR.getCode(),ResponseCode.ERROR.getDesc());
    }

    //创建响应失败的响应对象,并包含响应信息和状态码
    public static <T> ServerResponse<T> createByErrorMeesage(String ErrorMessage){
        return new ServerResponse<>(ResponseCode.ERROR.getCode(),ErrorMessage);
    }

    //创建响应失败的响应对象,并包含传入的响应信息和状态码
    public static <T> ServerResponse<T> createByErrorCodeMeesage(int errorCode, String ErrorMessage){
        return new ServerResponse<>(errorCode,ErrorMessage);
    }
}
