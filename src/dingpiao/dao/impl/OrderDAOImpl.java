package dingpiao.dao.impl;

import java.sql.SQLException;
import java.util.List;


import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import dingpiao.dao.OrderDAO;
import dingpiao.model.Order;

public class OrderDAOImpl extends HibernateDaoSupport implements OrderDAO {


    public void deleteBean(Order bean) {
        this.getHibernateTemplate().delete(bean);

    }

    public void insertBean(Order bean) {
        this.getHibernateTemplate().save(bean);

    }

    @SuppressWarnings("unchecked")
    public Order selectBean(String where) {
        List<Order> list = this.getHibernateTemplate().find("from Order " + where);
        if (list.size() == 0) {
            return null;
        }
        return list.get(0);
    }

    public int selectBeanCount(String where) {
        long count = (Long) this.getHibernateTemplate().find("select count(*) from Order " + where).get(0);
        return (int) count;
    }

    @SuppressWarnings("unchecked")
    public List<Order> selectBeanList(final int start, final int limit, final String where) {
        return (List<Order>) this.getHibernateTemplate().executeFind(new HibernateCallback() {
            public Object doInHibernate(final Session session) throws HibernateException, SQLException {
                List<Order> list = session.createQuery("from Order " + where)
                        .setFirstResult(start)
                        .setMaxResults(limit)
                        .list();
                return list;
            }
        });
    }

    public void updateBean(Order bean) {
        this.getHibernateTemplate().update(bean);

    }


}
