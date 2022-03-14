package edu.neu.service;

import edu.neu.dao.CapacityMapper;
import edu.neu.pojo.Capacity;
import edu.neu.pojo.DeviceType;

import java.util.List;

public class CapacityServiceImpl implements CapacityService {
    private CapacityMapper capacityMapper;
    public void setCapacityMapper(CapacityMapper capacityMapper){this.capacityMapper=capacityMapper;}

    @Override
    public int addCapacity(Capacity capacity) {
        return capacityMapper.addCapacity(capacity);
    }

    @Override
    public int deleteCapacityById(long id) {
        return capacityMapper.deleteCapacityById(id);
    }

    @Override
    public int updateCapacity(Capacity capacity) {
        return capacityMapper.updateCapacity(capacity);
    }

    @Override
    public Capacity queryCapacityById(long id) {
        return capacityMapper.queryCapacityById(id);
    }

    @Override
    public List<Capacity> queryAllCapacity() {
        return capacityMapper.queryAllCapacity();
    }

    @Override
    public List<Capacity> queryAllCapacityByDeviceId(long deviceid) {
        return capacityMapper.queryAllCapacityByDeviceId(deviceid);
    }


}
