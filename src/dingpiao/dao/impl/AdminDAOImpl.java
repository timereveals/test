package dingpiao.dao.impl;


import java.sql.SQLException;
import java.util.List;


import dingpiao.dao.AdminDAO;
import dingpiao.model.Admin;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import dingpiao.model.User;

public class AdminDAOImpl extends HibernateDaoSupport implements AdminDAO {

    public void deleteBean(Admin bean) {
        this.getHibernateTemplate().delete(bean);

    }

    public void insertBean(Admin bean) {
        this.getHibernateTemplate().save(bean);

    }

    @SuppressWarnings("unchecked")
    public Admin selectBean(String where) {
        List<Admin> list = this.getHibernateTemplate().find("from Admin " + where);
        if (list.size() == 0) {
            return null;
        }
        return list.get(0);
    }

    public int selectBeanCount(String where) {
        long count = (Long) this.getHibernateTemplate().find("select count(*) from Admin " + where).get(0);
        return (int) count;
    }

    @SuppressWarnings("unchecked")
    public List<Admin> selectBeanList(final int start, final int limit, final String where) {
        return (List<Admin>) this.getHibernateTemplate().executeFind(new HibernateCallback() {
            public Object doInHibernate(final Session session) throws HibernateException, SQLException {
                List<Admin> list = session.createQuery("from Admin " + where)
                        .setFirstResult(start)
                        .setMaxResults(limit)
                        .list();
                return list;
            }
        });
    }

    public void updateBean(Admin bean) {
        this.getHibernateTemplate().update(bean);

    }

}
