package edu.neu.service;

import edu.neu.dao.UserinfoMapper;
import edu.neu.pojo.Userinfo;

import java.util.List;
import java.util.Map;

public class UserinfoServiceImpl implements UserinfoService {

    //设置一个set接口调用dao层的操作，方便Spring管理
    private UserinfoMapper userinfoMapper;
    public void setUserinfoMapper(UserinfoMapper userinfoMapper){
        this.userinfoMapper = userinfoMapper;
    }

    @Override
    public int addUserinfo(Userinfo userinfo) {
        return userinfoMapper.addUserinfo(userinfo);
    }

    @Override
    public int deleteUserinfoById(long id) {
        return userinfoMapper.deleteUserinfoById(id);
    }

    @Override
    public int updateUserinfo(Userinfo userinfo) {
        return userinfoMapper.updateUserinfo(userinfo);
    }

    @Override
    public Userinfo queryUserinfoById(long id) {
        return userinfoMapper.queryUserinfoById(id);
    }

    @Override
    public Userinfo login(String account, String password) {
        return userinfoMapper.queryUserinfoByAccountAndPassword(account,password);
    }

    @Override
    public List<Userinfo> queryUserinfoByUsername(String username) {
        return userinfoMapper.queryUserinfoByUsername("%"+username+"%");
    }

    @Override
    public List<Userinfo> queryAllUserinfo() { return userinfoMapper.queryAllUserinfo();}
}
