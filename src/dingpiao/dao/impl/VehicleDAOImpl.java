package dingpiao.dao.impl;

import java.sql.SQLException;
import java.util.List;


import dingpiao.dao.VehicleDAO;
import dingpiao.model.Bus;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class VehicleDAOImpl extends HibernateDaoSupport implements VehicleDAO {

    public void deleteBean(Bus bean) {
        this.getHibernateTemplate().delete(bean);

    }

    public void insertBean(Bus bean) {
        this.getHibernateTemplate().save(bean);

    }

    @SuppressWarnings("unchecked")
    public Bus selectBean(String where) {
        List<Bus> list = this.getHibernateTemplate().find("from Bus " + where);
        if (list.size() == 0) {
            return null;
        }
        return list.get(0);
    }

    public int selectBeanCount(String where) {
        long count = (Long) this.getHibernateTemplate().find("select count(*) from Bus " + where).get(0);
        return (int) count;
    }

    @SuppressWarnings("unchecked")
    public List<Bus> selectBeanList(final int start, final int limit, final String where) {
        return (List<Bus>) this.getHibernateTemplate().executeFind(new HibernateCallback() {
            public Object doInHibernate(final Session session) throws HibernateException, SQLException {
                List<Bus> list = session.createQuery("from Bus " + where)
                        .setFirstResult(start)
                        .setMaxResults(limit)
                        .list();
                return list;
            }
        });
    }

    public void updateBean(Bus bean) {
        this.getHibernateTemplate().update(bean);

    }

}
