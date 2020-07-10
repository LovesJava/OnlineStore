package com.jsu.util;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.net.ftp.FTPClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

//上传文件的工具类
@Slf4j
public class FTPUtil {

    public FTPUtil(String ip, int port, String user, String password) {
        this.ip = ip;
        this.port = port;
        this.user = user;
        this.password = password;
    }

    //FTP服务器IP
    private static String ftpIp = PropertiesUtil.getProperty("ftp.server.ip");
    //FTP服务器用户名
    private static String ftpUser = PropertiesUtil.getProperty("ftp.user");
    //FTP服务器密码
    private static String ftpPass = PropertiesUtil.getProperty("ftp.pass");

    /**
     * 上传文件（可以上传多个文件）
     * @param fileList 文件集合
     * @return 是否上传成功
     */
    public static boolean uploadFile(List<File> fileList) throws IOException {
        //创建FTPUtil对象
        FTPUtil ftpUtil = new FTPUtil(ftpIp, 21, ftpUser, ftpPass);

        log.info("开始连接FTP服务器");
        boolean result = ftpUtil.uploadFile("img", fileList);
        log.info("关闭接连FTP服务器，结束上传，上传结果：{}", result ? "成功" : "失败");
        return result;
    }

    /**
     * 上传文件
     * @param remotePath 远程路径，FTP服务器下的文件夹
     * @param fileList 文件集合
     * @return 是否上传成功
     */
    private boolean uploadFile(String remotePath, List<File> fileList) throws IOException {
        boolean uploaded = true; //是否上传了
        FileInputStream fileInputStream = null; //文件输入流

        //连接FTP服务器
        if (connectServer(this.ip, this.port, this.user, this.password)){
            try {
                //更改工作空间
                ftpClient.changeWorkingDirectory(remotePath);
                //设置缓冲区
                ftpClient.setBufferSize(1024);
                //设置编码
                ftpClient.setControlEncoding("UTF-8");
                //设置文件类型为二进制类型
                ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);
/*                //打开本地的被动模式
                ftpClient.enterLocalPassiveMode();*/

                for (File file : fileList){
                    //根据文件集合内的每个文件对象创建文件输入流
                    fileInputStream = new FileInputStream(file);
                    //存储文件到FTP服务器
                    ftpClient.storeFile(file.getName(), fileInputStream);
                }
            } catch (IOException e) {
                log.error("上传文件异常", e);
                uploaded = false;
                e.printStackTrace();
            } finally {
                //关闭文件输入流
                fileInputStream.close();
                //断开FTP服务器连接
                ftpClient.disconnect();
            }
        }
        return uploaded;
    }

    //连接FTP服务器
    private boolean connectServer(String ip, int port, String user, String password){
        boolean isSuccess = false; //是否登录成功
        ftpClient = new FTPClient();  //创建FTP客户端对象
        //打开本地的被动模式(要在连接ftp服务器之前开启被动模式)
        ftpClient.enterLocalPassiveMode();
        try {
            //连接FTP服务器ip
            ftpClient.connect(ip);
            //登录FTP服务器
            isSuccess = ftpClient.login(user, password);
        } catch (IOException e) {
            log.error("连接FTP服务器异常",e);
        }
        return isSuccess;
    }

    private String ip; //ip地址
    private int port; //端口
    private String user; //用户名
    private String password; //密码
    private FTPClient ftpClient; //FTP客户端对象

    public FTPClient getFtpClient() {
        return ftpClient;
    }

    public void setFtpClient(FTPClient ftpClient) {
        this.ftpClient = ftpClient;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public int getPort() {
        return port;
    }

    public void setPort(int port) {
        this.port = port;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
