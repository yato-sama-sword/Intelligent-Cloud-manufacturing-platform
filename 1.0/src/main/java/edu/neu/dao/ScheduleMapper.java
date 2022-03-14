package edu.neu.dao;

import edu.neu.pojo.Schedule;

import java.util.List;

/**
 * 实现排产的crud操作
 */
public interface ScheduleMapper {
    //添加
    int addSchedule(Schedule schedule);
    //删除
    int deleteScheduleById(long id);
    //更新
    int updateSchedule(Schedule schedule);
    //查询
    List<Schedule> queryAllSchedule();
    Schedule queryScheduleById(long id);
}
