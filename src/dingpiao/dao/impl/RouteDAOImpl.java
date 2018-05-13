package dingpiao.dao.impl;

import java.sql.SQLException;
import java.util.List;


import dingpiao.dao.RouteDAO;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class RouteDAOImpl extends HibernateDaoSupport implements RouteDAO {


    public void deleteBean(dingpiao.model.Route bean) {
        this.getHibernateTemplate().delete(bean);

    }

    public void insertBean(dingpiao.model.Route bean) {
        this.getHibernateTemplate().save(bean);

    }

    @SuppressWarnings("unchecked")
    public dingpiao.model.Route selectBean(String where) {
        List<dingpiao.model.Route> list = this.getHibernateTemplate().find("from Route " + where);
        if (list.size() == 0) {
            return null;
        }
        return list.get(0);
    }

    public int selectBeanCount(String where) {
        long count = (Long) this.getHibernateTemplate().find("select count(*) from Route " + where).get(0);
        return (int) count;
    }

    @SuppressWarnings("unchecked")
    public List<dingpiao.model.Route> selectBeanList(final int start, final int limit, final String where) {
        return (List<dingpiao.model.Route>) this.getHibernateTemplate().executeFind(new HibernateCallback() {
            public Object doInHibernate(final Session session) throws HibernateException, SQLException {
                List<dingpiao.model.Route> list = session.createQuery("from Route " + where)
                        .setFirstResult(start)
                        .setMaxResults(limit)
                        .list();
                return list;
            }
        });
    }

    public void updateBean(dingpiao.model.Route bean) {
        this.getHibernateTemplate().update(bean);

    }


}
