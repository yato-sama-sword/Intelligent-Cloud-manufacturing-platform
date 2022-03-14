package edu.neu.pojo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 设备租用
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor

public class Rent {
    private long ID;
    private String begindate;
    private String enddate;
    //租用时长，单位是天
    private int length;
    private long deviceid;
    private long factoryid;
    //形成实体
    private Device device;
    private Factory factory;
}
