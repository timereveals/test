package dingpiao.dao;

import java.util.List;

import dingpiao.model.User;

public interface UserDAO {

    public void insertBean(User bean);

    public void deleteBean(User bean);

    public void updateBean(User bean);

    public User selectBean(String where);

    public List<User> selectBeanList(final int start, final int limit, final String where);

    public int selectBeanCount(final String where);

}
