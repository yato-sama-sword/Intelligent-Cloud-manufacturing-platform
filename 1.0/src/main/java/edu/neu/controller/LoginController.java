package edu.neu.controller;

import edu.neu.pojo.Factory;
import edu.neu.pojo.Userinfo;
import edu.neu.service.FactoryService;
import edu.neu.service.UserinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * 登录的控制器
 * 调用service完成注册登录的事务
 */
@Controller
@RequestMapping("/login")

public class LoginController {

    //controller调用service层
    @Autowired
    @Qualifier("UserinfoServiceImpl")
    private UserinfoService userinfoService;

    @Autowired
    @Qualifier("FactoryServiceImpl")
    private FactoryService factoryService;

    //登录
    @RequestMapping("/toView")
    public String toView(){
        return "view";
    }

    @RequestMapping("/view")
    //用@reauestparam标记是前端传回来的数据
    public String Login(Model model, HttpSession session, RedirectAttributes redirectAttributes, @RequestParam("account") String account, @RequestParam("password") String password) {
        Userinfo userinfo = userinfoService.login(account,password);
        if (userinfo!=null) {
            //依然可以使用session
            session.setAttribute("userinfo",userinfo);
            //不过推荐使用redirectAttributes，在重定向期间也不会丢失数据(重定向会丢失request区域的数据)
//            redirectAttributes.addFlashAttribute("userinfo",userinfo);
            switch ((int) userinfo.getRoleid()) {
                case 1: //跳转到超级管理员界面
                    return "superMainPage";

                case 2: //跳转到云工厂管理员界面
                    Factory factory = factoryService.queryFactoryByUserId(userinfo.getID());
                    session.setAttribute("factory",factory);
                    return "factoryMainPage";

                case 3: //跳转到经销商界面
                    return "dealerMainPage";
                default://错误信息，跳转到错误界面
                    break;
            }
        }
        model.addAttribute("err","登录失败,账号或密码错误");
        return "view";
    }
    //注销
    @RequestMapping("/out")
    //用@reauestparam标记是前端传回来的数据
    public String loginOut(HttpSession session) {
        session.invalidate();
        return "redirect:/login/toView";
    }

    //注册
    @RequestMapping("/toReg")
    public String toRegister() {
        return "reg";
    }
    //注册
    @RequestMapping("/reg")
    public String Register(Model model,
            @RequestParam("account") String account,@RequestParam("password") String password,@RequestParam("username") String username,
                           @RequestParam("mobile") String mobile,@RequestParam("roleid") long roleid,
                           @RequestParam(value = "factoryname" ,required = false) String factoryname,@RequestParam(value = "introduction", required = false) String introduction) throws IOException {
        List<Userinfo> userinfoList = userinfoService.queryAllUserinfo();
        for (Userinfo userinfo:userinfoList) {
            if (userinfo.getAccount().equals(account)) {
                //账号重复
                return "reg";
            }
        }
        userinfoService.addUserinfo(new Userinfo(-1,account,password,username,mobile,roleid,null));
        //获得数据库中的userinfo信息
        Userinfo userinfo = userinfoService.login(account,password);
        if (roleid == 2) {
            Factory factory = new Factory(-1,factoryname,introduction,userinfo.getID(),1,null);
            factoryService.addFactory(factory);
        }
        model.addAttribute("regSuccess","注册成功！");
        return "view";
    }

}
