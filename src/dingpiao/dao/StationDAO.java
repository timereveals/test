package dingpiao.dao;


import dingpiao.model.Station;

import java.util.List;

public interface StationDAO {

    public void insertBean(Station bean);

    public void deleteBean(Station bean);

    public void updateBean(Station bean);

    public Station selectBean(String where);

    public List<Station> selectBeanList(final int start, final int limit, final String where);

    public int selectBeanCount(final String where);
}
