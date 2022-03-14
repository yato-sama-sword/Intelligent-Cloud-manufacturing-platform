package edu.neu.controller;

import edu.neu.pojo.*;
import edu.neu.service.*;
import edu.neu.utils.getTimeStringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.jws.WebParam;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * 工厂管理员的控制器
 * 调用service完成工厂管理员的事务
 */

@Controller
@RequestMapping("/factory")

public class FactoryAdminController {

    @Autowired
    @Qualifier("FactoryServiceImpl")
    private FactoryService factoryService;

    @Autowired
    @Qualifier("UserinfoServiceImpl")
    private UserinfoService userinfoService;

    @Autowired
    @Qualifier("DeviceServiceImpl")
    private DeviceService deviceService;

    @Autowired
    @Qualifier("DeviceTypeServiceImpl")
    private DeviceTypeService deviceTypeService;

    @Autowired
    @Qualifier("OrderServiceImpl")
    private OrderService orderService;

    @Autowired
    @Qualifier("ProductServiceImpl")
    private ProductService productService;

    @Autowired
    @Qualifier("BidServiceImpl")
    private BidService bidService;

    @Autowired
    @Qualifier("ScheduleServiceImpl")
    private ScheduleService scheduleService;

    @Autowired
    @Qualifier("RentServiceImpl")
    private RentService rentService;

    @Autowired
    @Qualifier("CapacityServiceImpl")
    private CapacityService capacityService;

    @RequestMapping("/myDevice")
    public String myDevice(HttpSession session, Model model){
        Factory factory = (Factory) session.getAttribute("factory");
        List<Device> deviceList =  deviceService.queryDeviceByFactoryId(factory.getID());
        List<DeviceType> deviceTypeList = deviceTypeService.queryAllDeviceType();
        model.addAttribute("deviceList",deviceList);
        model.addAttribute("deviceTypeList",deviceTypeList);
        return "factoryDevice";
    }

    @RequestMapping("/myBid")
    public String myBid(HttpSession session, Model model){
        List<Order> allOrderList = orderService.queryAllOrder();
        List<Bid> bidList = bidService.queryAllBid();
        List<Order> orderList = new ArrayList<>();
        Factory factory = (Factory) session.getAttribute("factory");
        if (factory.getStatus() == 2) {
            model.addAttribute("error","工厂已经关停，无法进行订单投标");
            return "orderBid";
        }
        int flag;
        if (allOrderList!=null) {
            for (Order order : allOrderList) {
                flag = 1;
                if (bidList != null) {
                    for (Bid bid : bidList) {
                        //已经投标了
                        if (bid.getOrderid() == order.getID() && bid.getFactoryid() == factory.getID()) {
                            flag = 0;
                            break;
                        }
                    }
                }
                //订单为已发布状态，并且工厂还没有进行投标
                if (order.getOrderstatus() == 2 && flag == 1) {
                    order.setProduct(productService.queryProductById(order.getProductid()));
                    order.setUserinfo(userinfoService.queryUserinfoById(order.getPublisherid()));
                    orderList.add(order);
                }
            }
        }
        model.addAttribute("orderList",orderList);
        return "orderBid";
    }

    @RequestMapping("/mySchedule")
    public String mySchedule(HttpSession session, Model model){
        Factory factory = (Factory) session.getAttribute("factory");
        assert (factory!=null);

        if (factory.getStatus() == 2) {
            model.addAttribute("error","工厂已经关停，无法进行订单排产");
            return "orderSchedule";
        }
        List<Order> allOrderList = orderService.queryAllOrder();
        List<Schedule> scheduleList = scheduleService.queryAllSchedule();
        List<Device> allDeviceList = deviceService.queryAllDevice();
        List<Device> deviceList = new ArrayList<>();
        if (allDeviceList != null) {
            for (Device device:allDeviceList) {
                //只能由空闲的设备来进行排产
                if (device.getFactoryid()==factory.getID() && device.getDevicestatus() == 2) {
                    deviceList.add(device);
                }
            }
        }
        List<Order> orderList = new ArrayList<>();
        int flag;
        if (allOrderList != null) {
            for (Order order:allOrderList) {
                //订单为已投标状态，并且工厂已经中标 而且工厂还没有进行排产
                if (order.getFactoryid() == factory.getID() && order.getOrderstatus() == 3) {
                    order.setProduct(productService.queryProductById(order.getProductid()));
                    order.setUserinfo(userinfoService.queryUserinfoById(order.getPublisherid()));
                    orderList.add(order);
                }
            }
        }
        model.addAttribute("orderList",orderList);
        model.addAttribute("deviceList",deviceList);
        return "orderSchedule";
    }

    //展示所有的投标、产能、租用、排产
    @RequestMapping("/allBid")
    public String allBid(HttpSession session, Model model) {
        Factory factory = (Factory) session.getAttribute("factory");
        assert (factory!=null);
        List<Bid> allBidList = bidService.queryAllBid();
        List<Bid> bidList = new ArrayList<>();
        if (allBidList != null) {
            for (Bid bid:allBidList) {
                if(bid.getFactoryid() == factory.getID()) {
                    bidList.add(bid);
                }
            }
        }
        model.addAttribute("bidList",bidList);
        return "factoryBidList";
    }

    @RequestMapping("/allSchedule")
    public String allSchedule(HttpSession session, Model model) {
        Factory factory = (Factory) session.getAttribute("factory");
        assert (factory!=null);
        List<Schedule> allScheduleList = scheduleService.queryAllSchedule();
        List<Schedule> scheduleList = new ArrayList<>();
        if (allScheduleList != null) {
            for (Schedule schedule:allScheduleList) {
                if(deviceService.queryDeviceById(schedule.getDeviceid()).getFactoryid() == factory.getID()) {
                    scheduleList.add(schedule);
                }
            }
        }
        model.addAttribute("scheduleList",scheduleList);
        return "factoryScheduleList";
    }

    @RequestMapping("/addBid")
    public String addBid(HttpSession session, @RequestParam("orderid") long orderid,
                         @RequestParam("bidprice") double bidprice) throws Error{
        Factory factory = (Factory) session.getAttribute("factory");
        Bid bid = new Bid(0,orderid,factory.getID(),bidprice,0,null,null);
        bid.setOrderid(orderid);
        bidService.addBid(bid);
        return "redirect:/factory/myBid";
    }

    @RequestMapping("/addSchedule")
    public String addSchedule(@RequestParam("orderid") long orderid, @RequestParam("deviceid") long deviceid, @RequestParam("begindate") String begindate, @RequestParam("enddate") String enddate){
        Order order= orderService.queryOrderById(orderid);
        Device device = deviceService.queryDeviceById(deviceid);
        device.setDevicestatus(1);
        order.setOrderstatus(4);
        orderService.updateOrder(order);
        //连带状态的更新
        deviceService.updateDeviceStatus(device);
        Schedule schedule = new Schedule(0,orderid,deviceid,begindate,enddate,null,null);
        scheduleService.addSchedule(schedule);
        return "redirect:/factory/mySchedule";
    }

    @RequestMapping("/toAddCapacity/{Id}")
    public String toAddCapacity(@PathVariable("Id") long deviceid, Model model) {
        List<Capacity> capacityList = capacityService.queryAllCapacityByDeviceId(deviceid);
        List<Product> productList = productService.queryAllProduct();
        for (Capacity capacity:capacityList) {
            capacity.setProduct(productService.queryProductById(capacity.getProductid()));
        }
        model.addAttribute("capacityList",capacityList);
        model.addAttribute("productList",productList);
        model.addAttribute("device",deviceService.queryDeviceById(deviceid));
        return "factoryCapacityList";
    }

    //factory自增设备
    @RequestMapping("addDevice")
    public String addDevice(HttpSession session,
            @RequestParam("typeid") long typeid,@RequestParam("devicename") String devicename,@RequestParam("norms") String norms,
                            @RequestParam("describe") String describe){
        Factory factory = (Factory) session.getAttribute("factory");
        assert (factory!=null);
        long factoryid = factory.getID();
        String deviceNo = "Dno"+ getTimeStringUtil.getTimeString();
        int devicestatus = 2 ,rentstatus = 0;
        Device device = new Device(-1,typeid,devicename,norms,describe,deviceNo,devicestatus,rentstatus,factoryid,null,null);
        deviceService.addDevice(device);

        return "redirect:/factory/myDevice";
    }

    @RequestMapping("updateDevice")
    public String updateDevice(Model model, Device device) {
        if (device != null) {
            deviceService.updateDevice(device);
            Device device_now = deviceService.queryDeviceById(device.getID());
            model.addAttribute("device_now",device_now);
            return "redirect:/factory/myDevice";
        }
        return "500.html";
    }

    @RequestMapping("/addCapacity")
    public String addCapacity(@RequestParam("deviceid") long deviceid, @RequestParam("productid") long productid,
                         @RequestParam("velocity") int velocity) {
        Capacity capacity = new Capacity(0,deviceid,productid,velocity,null,null);
        capacityService.addCapacity(capacity);
        return "redirect:/factory/myDevice";
    }

    @RequestMapping("/updateCapacity")
    public String addCapacity(@RequestParam("capacityid") long capacityid, @RequestParam("velocity") int velocity) {
        Capacity capacity = capacityService.queryCapacityById(capacityid);
        capacity.setVelocity(velocity);
        capacityService.updateCapacity(capacity);
        return "redirect:/factory/myDevice";
    }

    @RequestMapping("/toRentDevice")
    public String toRentDevice(Model model){
        List<Device> allDeviceList = deviceService.queryAllDevice();
        List<Device> deviceList = new ArrayList<>();
        if (allDeviceList!=null) {
            for (Device device:allDeviceList) {
                if (device.getFactoryid()==0 && device.getDevicestatus()==2 && device.getRentstatus()==2) {
                    deviceList.add(device);
                }
            }
        }
        model.addAttribute("deviceList",deviceList);
        return "rentDevice";
    }

    @RequestMapping("/rentDevice")
    //传进来的是设备id
    public String rentDevice(HttpSession session, @RequestParam("begindate") String begindate,
                             @RequestParam("enddate") String enddate, @RequestParam("length") int length, @RequestParam("deviceid") long deviceid){
        Factory factory = (Factory) session.getAttribute("factory");
        assert (factory!=null);
        Rent rent = new Rent(0,begindate,enddate,length,deviceid,factory.getID(),null,null);
        Device device = deviceService.queryDeviceById(deviceid);
        device.setFactoryid(factory.getID());
        device.setRentstatus(1);
        rentService.addRent(rent);
        deviceService.updateDeviceStatus(device);
        return "redirect:/factory/myDevice";
    }

    @RequestMapping("/delDevice/{ID}")
    public String delDevice(@PathVariable("ID") long id) {
        deviceService.deleteDeviceById(id);
        return "redirect:/factory/myDevice";
    }

    @RequestMapping("/ocDevice/{ID}")
    public String ocDevice(@PathVariable("ID") long id){
        Device device = deviceService.queryDeviceById(id);
        if (device.getDevicestatus()==0) {
            device.setDevicestatus(2);
        } else {
            device.setDevicestatus(0);
        }
        deviceService.updateDeviceStatus(device);
        return "redirect:/factory/myDevice";
    }

}
