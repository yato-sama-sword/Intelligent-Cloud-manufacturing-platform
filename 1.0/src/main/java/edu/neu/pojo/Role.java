package edu.neu.pojo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 对应数据库中的角色
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor


public class Role {
    private long ID;
    private String rolename;
    private String remark;
}
