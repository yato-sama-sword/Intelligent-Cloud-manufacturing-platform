package edu.neu.pojo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 对应数据库中的工厂
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor


public class Factory {
    private long ID;
    private String factoryname;
    private String introduction;
    private long userid;
    private int status;
    //存储对应用户
    private Userinfo userinfo;
}
