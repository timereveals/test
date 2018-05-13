package dingpiao.dao.impl;

import dingpiao.model.BusType;
import dingpiao.dao.BusTypeDAO;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.sql.SQLException;
import java.util.List;

public class BusTypeDAOImpl extends HibernateDaoSupport implements BusTypeDAO {

    public void deleteBean(BusType bean) {
        this.getHibernateTemplate().delete(bean);

    }

    public void insertBean(BusType bean) {
        this.getHibernateTemplate().save(bean);

    }

    @SuppressWarnings("unchecked")
    public BusType selectBean(String where) {
        List<BusType> list = this.getHibernateTemplate().find("from BusType " + where);
        if (list.size() == 0) {
            return null;
        }
        return list.get(0);
    }

    public int selectBeanCount(String where) {
        long count = (Long) this.getHibernateTemplate().find("select count(*) from BusType " + where).get(0);
        return (int) count;
    }

    @SuppressWarnings("unchecked")
    public List<BusType> selectBeanList(final int start, final int limit, final String where) {
        return (List<BusType>) this.getHibernateTemplate().executeFind(new HibernateCallback() {
            public Object doInHibernate(final Session session) throws HibernateException, SQLException {
                List<BusType> list = session.createQuery("from BusType " + where)
                        .setFirstResult(start)
                        .setMaxResults(limit)
                        .list();
                return list;
            }
        });
    }

    public void updateBean(BusType bean) {
        this.getHibernateTemplate().update(bean);

    }

}
