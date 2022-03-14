package edu.neu.service;

import edu.neu.pojo.Userinfo;

import java.util.List;
import java.util.Map;

public interface UserinfoService {
    //注册用户
    int addUserinfo(Userinfo userinfo);
    //注销用户
    int deleteUserinfoById(long id);
    //更新用户信息
    int updateUserinfo(Userinfo userinfo);
    //查询用户信息
    Userinfo queryUserinfoById(long id);
    //登录语句
    Userinfo login(String account, String password);
    //通过模糊查询识别用户信息
    List<Userinfo> queryUserinfoByUsername(String username);
    //查询所有不带角色信息的用户信息
    List<Userinfo> queryAllUserinfo();

}
