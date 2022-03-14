package edu.neu.service;

import edu.neu.dao.OrderMapper;
import edu.neu.pojo.Order;

import java.util.List;

public class OrderServiceImpl implements OrderService {

    private OrderMapper orderMapper;

    public void setOrderMapper(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    @Override
    public int addOrder(Order order) {
        return orderMapper.addOrder(order);
    }

    @Override
    public int deleteOrderById(long id) {
        return orderMapper.deleteOrderById(id);
    }

    @Override
    public int updateOrder(Order order) {
        return orderMapper.updateOrder(order);
    }

    @Override
    public int updateOrderInfo(Order order) {
        return orderMapper.updateOrderInfo(order);
    }

    @Override
    public List<Order> queryAllOrder() {
        return orderMapper.queryAllOrder();
    }

    @Override
    public Order queryOrderById(long id) {
        return orderMapper.queryOrderById(id);
    }
}
