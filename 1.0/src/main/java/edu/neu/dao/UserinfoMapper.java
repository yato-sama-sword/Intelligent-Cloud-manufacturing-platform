package edu.neu.dao;

import edu.neu.pojo.Userinfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 实现用户的crud操作
 */
public interface UserinfoMapper {

    //注册用户
    int addUserinfo(Userinfo userinfo);
    //注销用户
    int deleteUserinfoById(long id);
    //更新用户信息
    int updateUserinfo(Userinfo userinfo);
    //查询用户信息
    Userinfo queryUserinfoById(long id);
    //通过名字进行模糊查询
    List<Userinfo> queryUserinfoByUsername(String username);
    //通过账号密码获得用户信息
    Userinfo queryUserinfoByAccountAndPassword(@Param("account") String account,@Param("password") String password);
    //查询所有用户信息
    List<Userinfo> queryAllUserinfo();
}
