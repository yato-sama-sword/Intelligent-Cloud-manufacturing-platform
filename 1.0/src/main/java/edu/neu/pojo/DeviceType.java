package edu.neu.pojo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 对应数据库中的设备类型
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor


public class DeviceType {
    private long ID;
    private String typename;
    private String describe;
}
