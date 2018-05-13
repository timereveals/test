package dingpiao.dao;


import java.util.List;

import dingpiao.model.Admin;
import dingpiao.model.User;

public interface AdminDAO {

    public void insertBean(Admin bean);

    public void deleteBean(Admin bean);

    public void updateBean(Admin bean);

    public Admin selectBean(String where);

    public List<Admin> selectBeanList(final int start, final int limit, final String where);

    public int selectBeanCount(final String where);

}
