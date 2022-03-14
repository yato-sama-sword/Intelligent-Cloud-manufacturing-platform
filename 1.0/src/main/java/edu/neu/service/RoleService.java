package edu.neu.service;


import edu.neu.pojo.Role;

import java.util.List;

public interface RoleService {
    //查询用户信息
    Role queryRoleById(long id);
    //查询所有用户信息
    List<Role> queryAllRole();
}
