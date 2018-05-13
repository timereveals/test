package dingpiao.dao;

import java.util.List;

import dingpiao.model.Announcement;

public interface AnnouncementDAO {

    public void insertBean(Announcement bean);

    public void deleteBean(Announcement bean);

    public void updateBean(Announcement bean);

    public Announcement selectBean(String where);

    public List<Announcement> selectBeanList(final int start, final int limit, final String where);

    public int selectBeanCount(final String where);

}
