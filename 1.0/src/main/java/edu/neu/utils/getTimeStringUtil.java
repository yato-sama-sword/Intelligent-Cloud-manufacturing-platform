package edu.neu.utils;

import java.util.Calendar;

/**
 * 实现获取当前时间字符串的工具类
 */
public class getTimeStringUtil {
    /**
     * 获取当前时间的字符串的方法
     * @return String
     */
    public static final String getTimeString() {
        String TimeString = "";
        Calendar c = Calendar.getInstance();

        int yyyy = c.get(Calendar.YEAR);
        int mm = c.get(Calendar.MONTH) + 1;
        int dd = c.get(Calendar.DAY_OF_MONTH);
        int hh = c.get(Calendar.HOUR) + 8;//中国属于东八区，时间加8小时
        int MM = c.get(Calendar.MINUTE);
        int SS = c.get(Calendar.SECOND);

        String sMonth = mm < 10 ? "0" + mm : "" + mm;
        String sDay = dd < 10 ? "0" + dd : "" + dd;
        String sHour = hh < 10 ? "0" + hh : "" + hh;
        String sMinute = MM < 10 ? "0" + MM : "" + MM;
        String sSecond = SS < 10 ? "0" + SS : "" + SS;

        TimeString =yyyy+sMonth+sDay+sHour+sMinute+sSecond;

        return TimeString;
    }

}
