package dingpiao.dao.impl;

import java.sql.SQLException;
import java.util.List;


import dingpiao.model.Announcement;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import dingpiao.dao.AnnouncementDAO;

public class AnnouncementDAOImpl extends HibernateDaoSupport implements AnnouncementDAO {


    public void deleteBean(Announcement bean) {
        this.getHibernateTemplate().delete(bean);

    }

    public void insertBean(Announcement bean) {
        this.getHibernateTemplate().save(bean);

    }

    @SuppressWarnings("unchecked")
    public Announcement selectBean(String where) {
        List<Announcement> list = this.getHibernateTemplate().find("from Announcement " + where);
        if (list.size() == 0) {
            return null;
        }
        return list.get(0);
    }

    public int selectBeanCount(String where) {
        long count = (Long) this.getHibernateTemplate().find("select count(*) from Announcement " + where).get(0);
        return (int) count;
    }

    @SuppressWarnings("unchecked")
    public List<Announcement> selectBeanList(final int start, final int limit, final String where) {
        return (List<Announcement>) this.getHibernateTemplate().executeFind(new HibernateCallback() {
            public Object doInHibernate(final Session session) throws HibernateException, SQLException {
                List<Announcement> list = session.createQuery("from Announcement " + where)
                        .setFirstResult(start)
                        .setMaxResults(limit)
                        .list();
                return list;
            }
        });
    }

    public void updateBean(Announcement bean) {
        this.getHibernateTemplate().update(bean);

    }


}
