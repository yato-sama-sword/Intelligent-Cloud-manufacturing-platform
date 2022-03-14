package edu.neu.service;

import edu.neu.dao.DeviceMapper;
import edu.neu.pojo.Device;
import edu.neu.pojo.DeviceType;

import java.util.List;

public class DeviceServiceImpl implements DeviceService{

    private DeviceMapper deviceMapper;

    public void setDeviceMapper(DeviceMapper deviceMapper) {
        this.deviceMapper = deviceMapper;
    }


    @Override
    public int addDevice(Device device) {
        return deviceMapper.addDevice(device);
    }

    @Override
    public int deleteDeviceById(long id) {
        return deviceMapper.deleteDeviceById(id);
    }

    @Override
    public int deleteDeviceByTypeId(long typeid) {
        return deviceMapper.deleteDeviceByTypeId(typeid);
    }

    @Override
    public int updateDevice(Device device) {
        return deviceMapper.updateDevice(device);
    }

    @Override
    public int updateDeviceStatus(Device device) {
        return deviceMapper.updateDeviceStatus(device);
    }

    @Override
    public int repairDeviceById(long id) {
        return deviceMapper.repairDeviceById(id);
    }

    @Override
    public List<Device> queryAllDevice() {
        return deviceMapper.queryAllDevice();
    }

    @Override
    public Device queryDeviceById(long id) {
        return deviceMapper.queryDeviceById(id);
    }

    @Override
    public List<Device> queryDeviceByFactoryId(long factoryid) {
        return deviceMapper.queryDeviceByFactoryId(factoryid);
    }
}
