package edu.neu.dao;

import edu.neu.pojo.Role;

import java.util.List;

/**
 * 实现角色的crud操作
 */
public interface RoleMapper {

    //查询角色信息
    Role queryRoleById(long id);
    //查询所有角色信息
    List<Role> queryAllRole();
}
