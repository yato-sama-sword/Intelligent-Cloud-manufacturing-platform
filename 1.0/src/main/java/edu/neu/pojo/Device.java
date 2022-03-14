package edu.neu.pojo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 对应数据库中的设备
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor


public class Device {
    private long ID;
    private long typeid;
    private String devicename;
    private String norms;
    private String describe;
    private String deviceno;
    //0-关闭 1-生产中 2-闲置中 3-故障
    private Integer devicestatus;
    //0-自用设备 1-租用 2-空闲
    private Integer rentstatus;
    //为0代表非自用，属于产能中心，
    private long factoryid;
    //顺便存储对应的产品类型信息
    private DeviceType deviceType;
    private Factory factory;
}
