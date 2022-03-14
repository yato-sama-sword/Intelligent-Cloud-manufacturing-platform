package edu.neu.dao;

import edu.neu.pojo.Bid;

import java.util.List;

/**
 * 实现投标的crud操作
 */
public interface BidMapper {
    //添加
    int addBid(Bid bid);
    //删除
    int deleteBidById(long id);
    //更新
    int updateBid(Bid bid);
    //查询
    List<Bid> queryAllBid();
    Bid queryBidById(long id);
}
