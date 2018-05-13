package dingpiao.dao;

import java.util.List;

import dingpiao.model.BusType;

public interface BusTypeDAO {
    public void insertBean(BusType bean);

    public void deleteBean(BusType bean);

    public void updateBean(BusType bean);

    public BusType selectBean(String where);

    public List<BusType> selectBeanList(final int start, final int limit, final String where);

    public int selectBeanCount(final String where);
}
