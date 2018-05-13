package dingpiao.dao;

import java.util.List;

import dingpiao.model.Order;

public interface OrderDAO {

    public void insertBean(Order bean);

    public void deleteBean(Order bean);

    public void updateBean(Order bean);

    public Order selectBean(String where);

    public List<Order> selectBeanList(final int start, final int limit, final String where);

    public int selectBeanCount(final String where);

}
