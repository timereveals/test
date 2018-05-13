package dingpiao.dao.impl;

import java.sql.SQLException;
import java.util.List;

import dingpiao.model.Station;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import dingpiao.dao.StationDAO;

public class StationDAOImpl extends HibernateDaoSupport implements StationDAO {

    public void deleteBean(Station bean) {
        this.getHibernateTemplate().delete(bean);

    }

    public void insertBean(Station bean) {
        this.getHibernateTemplate().save(bean);
    }

    @SuppressWarnings("unchecked")
    public Station selectBean(String where) {
        List<Station> list = this.getHibernateTemplate().find("from Station " + where);
        if (list.size() == 0) {
            return null;
        }
        return list.get(0);
    }

    public int selectBeanCount(String where) {
        long count = (Long) this.getHibernateTemplate().find("select count(*) from Station " + where).get(0);
        return (int) count;
    }

    @SuppressWarnings("unchecked")
    public List<Station> selectBeanList(final int start, final int limit, final String where) {
        return (List<Station>) this.getHibernateTemplate().executeFind(new HibernateCallback() {
            public Object doInHibernate(final Session session) throws HibernateException, SQLException {
                List<Station> list = session.createQuery("from Station " + where)
                        .setFirstResult(start)
                        .setMaxResults(limit)
                        .list();
                return list;
            }
        });
    }

    public void updateBean(Station bean) {
        this.getHibernateTemplate().update(bean);

    }
}
