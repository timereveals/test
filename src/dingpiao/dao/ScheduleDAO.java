package dingpiao.dao;

import java.util.List;

import dingpiao.model.Schedule;

public interface ScheduleDAO {

    public void insertBean(Schedule bean);

    public void deleteBean(Schedule bean);

    public void updateBean(Schedule bean);

    public Schedule selectBean(String where);

    public List<Schedule> selectBeanList(final int start, final int limit, final String where);

    public int selectBeanCount(final String where);

}
