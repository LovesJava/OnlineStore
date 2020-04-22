package com.jsu.service;

import org.springframework.web.multipart.MultipartFile;

//文件上传处理的接口
public interface IFileService {

    String upload(MultipartFile file, String path);
}
