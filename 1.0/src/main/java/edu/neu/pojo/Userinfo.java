package edu.neu.pojo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 对应数据库中的用户
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor


public class Userinfo {

    private long ID;
    private String account;
    private String password;
    private String username;
    private String mobile;
    private long roleid;
    //读取时获取关联实体信息
    private Role role;
}
