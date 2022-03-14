package edu.neu.service;

import edu.neu.dao.RoleMapper;
import edu.neu.pojo.Role;

import java.util.List;

public class RoleServiceImpl implements RoleService{

    //设置一个set接口调用dao层的操作，方便Spring管理
    private RoleMapper roleMapper;

    public void setRoleMapper(RoleMapper roleMapper){
        this.roleMapper = roleMapper;
    }

    @Override
    public Role queryRoleById(long id) {
        return roleMapper.queryRoleById(id);
    }

    @Override
    public List<Role> queryAllRole() {
        return roleMapper.queryAllRole();
    }
}
