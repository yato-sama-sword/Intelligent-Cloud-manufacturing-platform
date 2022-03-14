package edu.neu.service;

import edu.neu.pojo.Bid;

import java.util.List;

public interface BidService {
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
