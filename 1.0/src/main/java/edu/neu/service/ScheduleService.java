package edu.neu.service;

import edu.neu.pojo.Schedule;

import java.util.List;

public interface ScheduleService {
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
