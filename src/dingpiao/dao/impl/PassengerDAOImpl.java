package dingpiao.dao.impl;

import java.sql.SQLException;
import java.util.List;

import dingpiao.dao.PassengerDAO;
import dingpiao.model.Passenger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class PassengerDAOImpl extends HibernateDaoSupport implements PassengerDAO {

    public void deleteBean(Passenger bean) {
        this.getHibernateTemplate().delete(bean);

    }

    public void insertBean(Passenger bean) {
        this.getHibernateTemplate().save(bean);

    }

    @SuppressWarnings("unchecked")
    public Passenger selectBean(String where) {
        List<Passenger> list = this.getHibernateTemplate().find("from Passenger " + where);
        if (list.size() == 0) {
            return null;
        }
        return list.get(0);
    }

    public int selectBeanCount(String where) {
        long count = (Long) this.getHibernateTemplate().find("select count(*) from Passenger " + where).get(0);
        return (int) count;
    }

    @SuppressWarnings("unchecked")
    public List<Passenger> selectBeanList(final int start, final int limit, final String where) {
        return (List<Passenger>) this.getHibernateTemplate().executeFind(new HibernateCallback() {
            public Object doInHibernate(final Session session) throws HibernateException, SQLException {
                List<Passenger> list = session.createQuery("from Passenger " + where)
                        .setFirstResult(start)
                        .setMaxResults(limit)
                        .list();
                return list;
            }
        });
    }

    public void updateBean(Passenger bean) {
        this.getHibernateTemplate().update(bean);

    }

}
