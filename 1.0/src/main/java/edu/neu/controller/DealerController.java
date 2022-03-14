package edu.neu.controller;

import edu.neu.pojo.*;
import edu.neu.service.BidService;
import edu.neu.service.FactoryService;
import edu.neu.service.OrderService;
import edu.neu.service.ProductService;
import edu.neu.utils.getTimeStringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * 经销商的控制器
 * 调用service层的方法完成经销商的事务
 */

@Controller
@RequestMapping("/dealer")



public class DealerController {

    @Autowired
    @Qualifier("OrderServiceImpl")
    private OrderService orderService;

    @Autowired
    @Qualifier("ProductServiceImpl")
    private ProductService productService;

    @Autowired
    @Qualifier("FactoryServiceImpl")
    private FactoryService factoryService;

    @Autowired
    @Qualifier("BidServiceImpl")
    private BidService bidService;

    @RequestMapping("/dealerOrder")
    public String dealerOrder(Model model, HttpSession session) {
        List<Order> allOrderList = orderService.queryAllOrder();
        List<Bid> bidList = bidService.queryAllBid();
        List<Product> productList = productService.queryAllProduct();
        List<Order> orderList = new ArrayList<>();
        Userinfo userinfo = (Userinfo)session.getAttribute("userinfo");
        for (Order order:allOrderList) {
            if(order.getPublisherid() == userinfo.getID()) {
                order.setProduct(productService.queryProductById(order.getProductid()));
                order.setFactory(factoryService.queryFactoryById(order.getFactoryid()));
                orderList.add(order);
            }
        }
        model.addAttribute("bidList",bidList);
        model.addAttribute("orderList",orderList);
        model.addAttribute("productList",productList);
        return "dealerOrder";
    }

    @RequestMapping("/createOrder")
    public String createOrder(@RequestParam("productid") long productid, @RequestParam("ordernum") int ordernum,
                              @RequestParam("deaddate") String deaddate, @RequestParam("deliverdate") String deliverdate, HttpSession session){
        String Ono = "Ono"+getTimeStringUtil.getTimeString();
        Userinfo userinfo =(Userinfo)session.getAttribute("userinfo");
        Order order = new Order(0,Ono,productid,ordernum,deaddate,deliverdate,1,0,userinfo.getID(),null,null,null);
        orderService.addOrder(order);
        return "redirect:/dealer/dealerOrder";
    }

    @RequestMapping("/toChooseBid/{Id}")
    public String toChooseBid(Model model, @PathVariable("Id") long id){
        List<Bid> allBidList = bidService.queryAllBid();
        List<Bid> bidList = new ArrayList<>();
        for (Bid bid:allBidList){
            if (bid.getOrderid()==id && bid.getBidstatus()!=1) {
                Order order = orderService.queryOrderById(id);
                //更新bid+order的工厂id
                order.setFactoryid(factoryService.queryFactoryById(bid.getFactoryid()).getID());
                bid.setFactory(factoryService.queryFactoryById(bid.getFactoryid()));
                bidList.add(bid);
            }
        }
        model.addAttribute("bidList",bidList);
        return "chooseBid";
    }

    @RequestMapping("/chooseBid/{Id}")
    public String createOrder(@PathVariable("Id") long id){
        Bid bid = bidService.queryBidById(id);
        bid.setBidstatus(1);
        Order order = orderService.queryOrderById(bid.getOrderid());
        order.setOrderstatus(3);
        //选中投标的工厂的id
        order.setFactoryid(bid.getFactoryid());
        bidService.updateBid(bid);
        orderService.updateOrder(order);
        return "redirect:/dealer/dealerOrder";
    }

    @RequestMapping("/updateOrder")
    public String updateOrder(@RequestParam("ID") long ID,@RequestParam("ordernum") int ordernum, @RequestParam("deaddate") String deaddate, @RequestParam("deliverdate") String deliverdate) {
        Order order = orderService.queryOrderById(ID);
        order.setOrdernum(ordernum);
        order.setDeaddate(deaddate);
        order.setDeliverdate(deliverdate);
        orderService.updateOrderInfo(order);
        return "redirect:/dealer/dealerOrder";
    }

    @RequestMapping("/delOrder/{Id}")
    public String updateOrder(@PathVariable("Id") long id) {
        orderService.deleteOrderById(id);
        return "redirect:/dealer/dealerOrder";
    }

    @RequestMapping("/updateOrderStatus/{Id}")
    public String updateOrderStatus(@PathVariable("Id") long id){
        Order order = orderService.queryOrderById(id);
        int orderStatus = order.getOrderstatus();
        switch (orderStatus) {
            case 1:
                order.setOrderstatus(2);
                break;
            case 2:
                order.setOrderstatus(3);
                break;
            case 6:
                order.setOrderstatus(7);
                break;
        }
        orderService.updateOrder(order);
        return "redirect:/dealer/dealerOrder";
    }


}
