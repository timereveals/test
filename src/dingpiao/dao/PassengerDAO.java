package dingpiao.dao;

import dingpiao.model.Passenger;

import java.util.List;

public interface PassengerDAO {

    public void insertBean(Passenger bean);

    public void deleteBean(Passenger bean);

    public void updateBean(Passenger bean);

    public Passenger selectBean(String where);

    public List<Passenger> selectBeanList(final int start, final int limit, final String where);

    public int selectBeanCount(final String where);
}
