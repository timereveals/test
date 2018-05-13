package dingpiao.dao;

import java.util.List;

import dingpiao.model.Route;

public interface RouteDAO {

    public void insertBean(dingpiao.model.Route bean);

    public void deleteBean(dingpiao.model.Route bean);

    public void updateBean(dingpiao.model.Route bean);

    public dingpiao.model.Route selectBean(String where);

    public List<dingpiao.model.Route> selectBeanList(final int start, final int limit, final String where);

    public int selectBeanCount(final String where);

}
