package edu.neu.service;

import edu.neu.dao.RentMapper;
import edu.neu.pojo.Rent;

import java.util.List;

public class RentServiceImpl implements RentService {
    private RentMapper rentMapper;

    public void setRentMapper(RentMapper rentMapper) {
        this.rentMapper = rentMapper;
    }


    @Override
    public int addRent(Rent rent) {
        return rentMapper.addRent(rent);
    }

    @Override
    public int deleteRent(long id) {
        return rentMapper.deleteRent(id);
    }

    @Override
    public List<Rent> queryAllRent() {
        return rentMapper.queryAllRent();
    }

    @Override
    public Rent queryRentById(long id) {
        return rentMapper.queryRentById(id);
    }
}
