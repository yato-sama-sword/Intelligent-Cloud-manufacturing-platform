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

import java.util.List;

/**
 * 超级管理员的控制器
 * 完成超级管理员的事务
 */
@Controller
@RequestMapping("/super")

/*
   做增删改查，基本管理，基本上每一个service impl都会用到
 */

public class SuperAdminController {
    //controller调用service层，需要两种注解
    @Autowired
    @Qualifier("UserinfoServiceImpl")
    private UserinfoService userinfoService;

    @Autowired
    @Qualifier("RoleServiceImpl")
    private RoleService roleService;

    @Autowired
    @Qualifier("FactoryServiceImpl")
    private FactoryService factoryService;

    @Autowired
    @Qualifier("OrderServiceImpl")
    private OrderService orderService;

    @Autowired
    @Qualifier("DeviceServiceImpl")
    private DeviceService deviceService;

    @Autowired
    @Qualifier("DeviceTypeServiceImpl")
    private DeviceTypeService deviceTypeService;

    @Autowired
    @Qualifier("ProductServiceImpl")
    private ProductService productService;

    @Autowired
    @Qualifier("ProductTypeServiceImpl")
    private ProductTypeService productTypeService;

    //查询全部用户信息，并返回用户信息展示页面
    @RequestMapping("/allUserinfo")
    public String userinfoList(Model model){
        List<Userinfo> userinfoList = userinfoService.queryAllUserinfo();
        for (Userinfo userinfo:userinfoList) {
            userinfo.setRole(roleService.queryRoleById(userinfo.getRoleid()));
        }
        List<Role> roleList = roleService.queryAllRole();
        model.addAttribute("userinfoList",userinfoList);
        model.addAttribute("roleList",roleList);
        return "allUserinfo";
    }

    //添加用户信息

//    @RequestMapping("toAddUserinfo")
//    public String toAddUserinfo(Model model) {
//        return "addUserinfo";
//    }

    @RequestMapping("addUserinfo")
    public String addUserinfo(@RequestParam("account") String account,@RequestParam("password") String password,@RequestParam("username") String username,
                           @RequestParam("mobile") String mobile,@RequestParam("roleid") long roleid,
                              @RequestParam(value="factoryname",defaultValue = "") String factoryname, @RequestParam(value = "introduction", defaultValue = "") String introduction) {
        Userinfo userinfo = new Userinfo(-1,account,password,username,mobile,roleid,null);
        userinfoService.addUserinfo(userinfo);
        //获得数据库中的userinfo信息
        userinfo = userinfoService.login(account,password);
        if (roleid == 2) {
            Factory factory = new Factory(-1,factoryname,introduction,userinfo.getID(),1,null);
            factoryService.addFactory(factory);
        }
        return "redirect:/super/allUserinfo";
    }

//    更新用户信息
    @RequestMapping("toUpdateUserinfo/{Id}")
    public String toUpdateUserinfo(Model model, @PathVariable("Id") long id) {
        Userinfo userinfo = userinfoService.queryUserinfoById(id);
        model.addAttribute("userinfo",userinfo);
        return "updateUserinfo";
    }

    @RequestMapping("updateUserinfo")
    public String updateUserinfo(Model model, Userinfo userinfo) {
        if (userinfo != null) {
            userinfoService.updateUserinfo(userinfo);
            Userinfo userinfo_now = userinfoService.queryUserinfoById(userinfo.getID());
            model.addAttribute("userinfo_now",userinfo_now);
            return "redirect:/super/allUserinfo";
        }
        return "500.html";
    }

    //删除用户,restful风格
    @RequestMapping("/delUserinfo/{Id}")
    public String deleteUserinfo(@PathVariable("Id") long id) {
        Factory factory = factoryService.queryFactoryByUserId(id);
        if (factory!=null) {
            factoryService.deleteFactoryById(factory.getID());
        }
        userinfoService.deleteUserinfoById(id);
        return "redirect:/super/allUserinfo";
    }

    @RequestMapping("/allFactory")
    public String factoyList(Model model) {
        //发用户和工厂信息
        List<Userinfo> userinfoList = userinfoService.queryAllUserinfo();
        for (Userinfo userinfo:userinfoList) {
            userinfo.setRole(roleService.queryRoleById(userinfo.getRoleid()));
        }
        List<Factory> factoryList = factoryService.queryAllFactory();
        for (Factory factory:factoryList) {
            factory.setUserinfo(userinfoService.queryUserinfoById(factory.getUserid()));
        }
        model.addAttribute("userinfoList",userinfoList);
        model.addAttribute("factoryList",factoryList);
        return "allFactory";
    }

    @RequestMapping("/updateFactory/{ID}")
    public String updateFactory(@PathVariable("ID") long id) {
        Factory factory = factoryService.queryFactoryById(id);
        if (factory != null) {
            System.out.println(factory);
            switch (factory.getStatus()) {
                case 1:
                    //开启
                    factory.setStatus(2);
                    break;
                case 2:
                    //关停
                    factory.setStatus(1);
                    break;
            }
            factoryService.updateFactory(factory);
        }
        return "redirect:/super/allFactory";
    }


    //
    @RequestMapping("/delFactory/{ID}")
    public String delFactory(@PathVariable("ID") long id) {
        factoryService.deleteFactoryById(id);
        return "redirect:/super/allFactory";
    }

    @RequestMapping("addProductType")
    public String addProductType(@RequestParam("typename") String typename,@RequestParam("describe") String describe) {
        ProductType productType = new ProductType(-1,typename,describe);
        productTypeService.addProductType(productType);
        return "redirect:/super/allProductType";
    }

    @RequestMapping("updateProductType")
    public String updateProductType(Model model, ProductType productType) {
        if (productType != null) {
            productTypeService.updateProductType(productType);
            ProductType productType_now = productTypeService.queryProductTypeById(productType.getID());
            model.addAttribute("productType_now",productType_now);
        }
        return "redirect:/super/allProductType";
    }

    @RequestMapping("addDeviceType")
    public String addDeviceType(@RequestParam("typename") String typename,@RequestParam("describe") String describe) {
        DeviceType deviceType = new DeviceType(-1,typename,describe);
        deviceTypeService.addDeviceType(deviceType);
        return "redirect:/super/allDeviceType";
    }

    @RequestMapping("updateDeviceType")
    public String updateDeviceType(Model model, DeviceType deviceType) {
        if (deviceType != null) {
            deviceTypeService.updateDeviceType(deviceType);
            DeviceType deviceType_now = deviceTypeService.queryDeviceTypeById(deviceType.getID());
            model.addAttribute("deviceType_now",deviceType_now);
        }
        return "redirect:/super/allDeviceType";
    }

    @RequestMapping("addProduct")
    public String addProduct(@RequestParam("typeid") long typeid,@RequestParam("productname") String productname,@RequestParam("norms") String norms,
                              @RequestParam("describe") String describe){
        String productNo = "Pno"+getTimeStringUtil.getTimeString();
        Product product = new Product(-1,typeid,productname,norms,describe,productNo,null);
        productService.addProduct(product);

        return "redirect:/super/allProduct";
    }

    @RequestMapping("addDevice")
    public String addDevice(@RequestParam("typeid") long typeid,@RequestParam("devicename") String devicename,@RequestParam("norms") String norms,
                              @RequestParam("describe") String describe,@RequestParam("factoryid") long factoryid){
        String deviceNo = "Dno"+getTimeStringUtil.getTimeString();
        int devicestatus = 2 ,rentstatus;
        if (factoryid==0){
            rentstatus = 2;
        } else  {
            rentstatus = 0;
        }
        Device device = new Device(-1,typeid,devicename,norms,describe,deviceNo,devicestatus,rentstatus,factoryid,null,null);
        deviceService.addDevice(device);

        return "redirect:/super/allDevice";
    }

    @RequestMapping("updateDevice")
    public String updateDevice(Model model, Device device) {
        if (device != null) {
            deviceService.updateDevice(device);
            Device device_now = deviceService.queryDeviceById(device.getID());
            model.addAttribute("device_now",device_now);
            return "redirect:/super/allDevice";
        }
        return "500.html";
    }

    @RequestMapping("updateProduct")
    public String updateProduct(Model model, Product product) {
        if (product != null) {
            productService.updateProduct(product);
            Product product_now = productService.queryProductById(product.getID());
            model.addAttribute("product_now",product_now);
            return "redirect:/super/allProduct";
        }
        return "500.html";
    }

    @RequestMapping("/delProduct/{ID}")
    public String delProduct(@PathVariable("ID") long id) {
        productService.deleteProductById(id);
        return "redirect:/super/allProduct";
    }

    @RequestMapping("/delDevice/{ID}")
    public String delDevice(@PathVariable("ID") long id) {
        Device device = deviceService.queryDeviceById(id);
        if (device.getRentstatus()==1) {
            return "redirect:/super/allDevice";
        }
        deviceService.deleteDeviceById(id);
        return "redirect:/super/allDevice";
    }

    @RequestMapping("/repairDevice/{ID}")
    public String repairDevice(@PathVariable("ID") long id) {
        deviceService.repairDeviceById(id);
        return "redirect:/super/allDevice";
    }

    //级联删除
    @RequestMapping("/delProductType/{ID}")
    public String delProductType(@PathVariable("ID") long id) {
        productService.deleteProductByTypeId(id);
        productTypeService.deleteProductTypeById(id);
        return "redirect:/super/allProductType";
    }

    @RequestMapping("/delDeviceType/{ID}")
    public String delDeviceType(@PathVariable("ID") long id) {
        deviceService.deleteDeviceByTypeId(id);
        deviceTypeService.deleteDeviceTypeById(id);
        return "redirect:/super/allDeviceType";
    }

    @RequestMapping("/allDeviceType")
    public String DeviceTypeList(Model model){
        List<DeviceType> deviceTypeList = deviceTypeService.queryAllDeviceType();
        model.addAttribute("deviceTypeList",deviceTypeList);
        return "allDeviceType";
    }
    @RequestMapping("/allProductType")
    public String ProductTypeList(Model model){
        List<ProductType> productTypeList = productTypeService.queryAllProductType();
        model.addAttribute("productTypeList",productTypeList);
        return "allProductType";
    }

    @RequestMapping("/allProduct")
    public String productList(Model model){
        List<Product> productList = productService.queryAllProduct();
        List<ProductType> productTypeList = productTypeService.queryAllProductType();
        for (Product product:productList) {
            product.setProductType(productTypeService.queryProductTypeById(product.getTypeid()));
        }
        model.addAttribute("productList",productList);
        model.addAttribute("productTypeList",productTypeList);
        return "allProduct";
    }
    @RequestMapping("/allDevice")
    public String deviceList(Model model){
        List<Device> deviceList = deviceService.queryAllDevice();
        List<DeviceType> deviceTypeList = deviceTypeService.queryAllDeviceType();
        List<Factory> factoryList = factoryService.queryAllFactory();
        for (Device device:deviceList) {
            device.setDeviceType(deviceTypeService.queryDeviceTypeById(device.getTypeid()));
            device.setFactory(factoryService.queryFactoryById(device.getFactoryid()));
        }
        model.addAttribute("deviceList",deviceList);
        model.addAttribute("deviceTypeList",deviceTypeList);
        model.addAttribute("factoryList",factoryList);

        return "allDevice";
    }

    @RequestMapping("/allOrder")
    public String orderList(Model model){

        List<Order> orderList = orderService.queryAllOrder();
        for (Order order:orderList) {
            order.setProduct(productService.queryProductById(order.getProductid()));
            order.setFactory(factoryService.queryFactoryById(order.getFactoryid()));
            order.setUserinfo(userinfoService.queryUserinfoById(order.getPublisherid()));
        }
        model.addAttribute("orderList",orderList);
        return "allOrder";
    }
}
