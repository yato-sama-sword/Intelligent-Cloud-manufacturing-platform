import edu.neu.dao.ProductTypeMapper;
import edu.neu.pojo.Device;
import edu.neu.pojo.DeviceType;
import edu.neu.pojo.Role;
import edu.neu.pojo.Userinfo;
import edu.neu.service.*;
import edu.neu.utils.getTimeStringUtil;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MyTest {
    @Test
    public void test(){
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//        UserinfoService userinfoServiceImpl = (UserinfoService) context.getBean("UserinfoServiceImpl");
//        RoleService roleServiceImpl = (RoleService) context.getBean("RoleServiceImpl");
//        DeviceTypeService deviceTypeServiceImpl = (DeviceTypeService) context.getBean("DeviceTypeServiceImpl");
//        ProductTypeService productTypeServiceImpl = (ProductTypeService) context.getBean("ProductTypeServiceImpl");
//        CapacityService capacityServiceImpl = (CapacityService) context.getBean("CapacityServiceImpl");
//        DeviceService deviceServiceImpl = (DeviceService) context.getBean("DeviceServiceImpl");
//        FactoryService factoryServiceImpl = (FactoryService) context.getBean("FactoryServiceImpl");
//        System.out.println(factoryServiceImpl.queryFactoryByUserId(4));
//        List<Device> devices = deviceServiceImpl.queryAllDevice();
//        for (Device device:devices
//             ) {
//            System.out.println(device);
//
//        }
//        List<Userinfo> userinfoList =  userinfoServiceImpl.queryAllUserinfo();
//        for (Userinfo userinfo:userinfoList) {
//            userinfo.setRole(roleServiceImpl.queryRoleById(userinfo.getRoleid()));
//            System.out.println(userinfo);
//        }
//        System.out.println(capacityServiceImpl.queryAllCapacity(1));
//        System.out.println(productTypeServiceImpl.queryAllProductType());
//        deviceTypeServiceImpl.updateDeviceType(new DeviceType(2,"havana",""));
//        Userinfo userinfo = new Userinfo(0,"s","s","s","s",2,null);
//        userinfoServiceImpl.addUserinfo(userinfo);
//        System.out.println(userinfoServiceImpl.login("admin", "admin"));
//        for (Userinfo userinfo:userinfoServiceImpl.queryAllUserinfo()) {
//            System.out.println(userinfo);
//        }
//        System.out.println(userinfoServiceImpl.queryUserinfoByUsername("a"));
//        for (Role role:roleServiceImpl.queryAllRole()) {
//            System.out.println(role);
//        }
        System.out.println(getTimeStringUtil.getTimeString());
    }
}
