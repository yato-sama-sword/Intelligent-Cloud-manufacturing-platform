package edu.neu.dao;

import edu.neu.pojo.DeviceType;

import java.util.List;

/**
 * 实现设备类型的crud操作
 */
public interface DeviceTypeMapper {
    //添加设备类型
    int addDeviceType(DeviceType deviceType);
    //删除设备类型
    int deleteDeviceTypeById(long id);
    //更新设备类型信息
    int updateDeviceType(DeviceType deviceType);
    //查询设备类型信息
    DeviceType queryDeviceTypeById(long id);
    //查询所有设备类型信息
    List<DeviceType> queryAllDeviceType();
}
