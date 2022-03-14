package edu.neu.service;

import edu.neu.dao.ScheduleMapper;
import edu.neu.pojo.Schedule;

import java.util.List;

public class ScheduleServiceImpl implements ScheduleService{
    private ScheduleMapper scheduleMapper;

    public void setScheduleMapper(ScheduleMapper scheduleMapper) {
        this.scheduleMapper = scheduleMapper;
    }


    @Override
    public int addSchedule(Schedule schedule) {
        return scheduleMapper.addSchedule(schedule);
    }

    @Override
    public int deleteScheduleById(long id) {
        return scheduleMapper.deleteScheduleById(id);
    }

    @Override
    public int updateSchedule(Schedule schedule) {
        return scheduleMapper.updateSchedule(schedule);
    }

    @Override
    public List<Schedule> queryAllSchedule() {
        return scheduleMapper.queryAllSchedule();
    }

    @Override
    public Schedule queryScheduleById(long id) {
        return scheduleMapper.queryScheduleById(id);
    }
}
