package com.jsu.service.impl;

import com.google.common.collect.Lists;
import com.jsu.service.IFileService;
import com.jsu.util.FTPUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service("iFileService")
public class FileServiceImpl implements IFileService {

    //日志对象
    private Logger logger = LoggerFactory.getLogger(FileServiceImpl.class);

    /**
     * 上传文件
     * @param file SpringMVC上传文件接口
     * @param path 上传文件服务器路径
     * @return 上传之后的文件名
     */
    public String upload(MultipartFile file, String path){
        //获取上传文件的原始文件名
        String fileName = file.getOriginalFilename();
        //获取文件的扩展名
        String fileExtensionName = fileName.substring(fileName.lastIndexOf(".")+1);

        //上传之后的文件名
        String uploadFileName = UUID.randomUUID().toString() + "." + fileExtensionName;
        //打印日志，使用{}占位
        logger.info("开始上传文件：上传文件的文件名:{}，上传的路径:{}，新文件名:{}",fileName, path, uploadFileName);

        File fileDir = new File(path);  //创建文件对象
        if (!fileDir.exists()) { //如果路径下的文件夹不存在
            fileDir.setWritable(true); //赋予文件对象可写权限
            fileDir.mkdirs();   //创建文件目录
        }
        //创建目标文件对象
        File targetFile = new File(path, uploadFileName);
        try {
            //使用SpringMVC上传文件的对象将该目标文件对象上传至服务器
            file.transferTo(targetFile);
            //代码执行到此处，文件已经上传成功
            FTPUtil.uploadFile(Lists.newArrayList(targetFile));
            //代码执行到此处，已经将targetFile上传至我们的FTP服务器上
            //文件上传至FTP服务器之后，删除upload下的文件
            targetFile.delete();
        } catch (IOException e) {
            logger.error("文件上传异常",e);
            return null;
        }
        return targetFile.getName();
    }
}
