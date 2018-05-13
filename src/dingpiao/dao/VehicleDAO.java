package dingpiao.dao;

import java.util.List;

import dingpiao.model.Bus;

public interface VehicleDAO {

    public void insertBean(Bus bean);

    public void deleteBean(Bus bean);

    public void updateBean(Bus bean);

    public Bus selectBean(String where);

    public List<Bus> selectBeanList(final int start, final int limit, final String where);

    public int selectBeanCount(final String where);

}
