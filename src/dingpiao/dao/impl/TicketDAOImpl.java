package dingpiao.dao.impl;

import java.sql.SQLException;
import java.util.List;


import dingpiao.model.Ticket;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import dingpiao.dao.TicketDAO;

public class TicketDAOImpl extends HibernateDaoSupport implements TicketDAO {

    public void deleteBean(Ticket bean) {
        this.getHibernateTemplate().delete(bean);

    }

    public void insertBean(Ticket bean) {
        this.getHibernateTemplate().save(bean);
    }

    @SuppressWarnings("unchecked")
    public Ticket selectBean(String where) {
        List<Ticket> list = this.getHibernateTemplate().find("from Ticket " + where);
        if (list.size() == 0) {
            return null;
        }
        return list.get(0);
    }

    public int selectBeanCount(String where) {
        long count = (Long) this.getHibernateTemplate().find("select count(*) from Ticket " + where).get(0);
        return (int) count;
    }

    @SuppressWarnings("unchecked")
    public List<Ticket> selectBeanList(final int start, final int limit, final String where) {
        return (List<Ticket>) this.getHibernateTemplate().executeFind(new HibernateCallback() {
            public Object doInHibernate(final Session session) throws HibernateException, SQLException {
                List<Ticket> list = session.createQuery("from Ticket " + where)
                        .setFirstResult(start)
                        .setMaxResults(limit)
                        .list();
                return list;
            }
        });
    }

    public void updateBean(Ticket bean) {
        this.getHibernateTemplate().update(bean);

    }

}
