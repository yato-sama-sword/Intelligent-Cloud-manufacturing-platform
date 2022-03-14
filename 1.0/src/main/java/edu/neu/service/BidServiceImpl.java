package edu.neu.service;

import edu.neu.dao.BidMapper;
import edu.neu.pojo.Bid;

import java.util.List;

public class BidServiceImpl implements BidService{
    private BidMapper bidMapper;

    public void setBidMapper(BidMapper bidMapper) {
        this.bidMapper = bidMapper;
    }

    @Override
    public int addBid(Bid bid) {
        return bidMapper.addBid(bid);
    }

    @Override
    public int deleteBidById(long id) {
        return bidMapper.deleteBidById(id);
    }

    @Override
    public int updateBid(Bid bid) {
        return bidMapper.updateBid(bid);
    }

    @Override
    public List<Bid> queryAllBid() {
        return bidMapper.queryAllBid();
    }

    @Override
    public Bid queryBidById(long id) {
        return bidMapper.queryBidById(id);
    }
}
