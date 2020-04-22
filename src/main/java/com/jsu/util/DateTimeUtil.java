package com.jsu.util;

import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import java.util.Date;

public class DateTimeUtil {

    public static final String STANDARD_FORMAT = "yyyy-MM-dd HH:mm:ss";

    /**
     * str->Date
     * @param dateTimeStr 需要转化为Date类型的字符串
     * @param formatStr Date类型的格式
     * @return 日期类型
     */
    public static Date strToDate(String dateTimeStr, String formatStr){
        //日期格式对象
        DateTimeFormatter dateTimeFormatter = DateTimeFormat.forPattern(formatStr);
        //日期对象
        DateTime dateTime = dateTimeFormatter.parseDateTime(dateTimeStr);
        return dateTime.toDate();
    }

    /**
     * str->Date
     * @param dateTimeStr 需要转化为Date类型的字符串
     * @return 日期类型
     */
    public static Date strToDate(String dateTimeStr){
        //日期格式对象
        DateTimeFormatter dateTimeFormatter = DateTimeFormat.forPattern(STANDARD_FORMAT);
        //日期对象
        DateTime dateTime = dateTimeFormatter.parseDateTime(dateTimeStr);
        return dateTime.toDate();
    }

    /**
     * Date->str
     * @param date 日期对象
     * @param formatStr 转化为字符串之后的格式
     * @return 字符串
     */
    public static String dateToStr(Date date, String formatStr){
        if (date == null){
            return StringUtils.EMPTY;
        }
        //创建日期对象
        DateTime dateTime = new DateTime(date);
        return dateTime.toString(formatStr);
    }

    /**
     * Date->str
     * @param date 日期对象
     * @return 字符串
     */
    public static String dateToStr(Date date){
        if (date == null){
            return StringUtils.EMPTY;
        }
        //创建日期对象
        DateTime dateTime = new DateTime(date);
        return dateTime.toString(STANDARD_FORMAT);
    }
}
