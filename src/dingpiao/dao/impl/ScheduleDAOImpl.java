package dingpiao.dao.impl;

import java.sql.SQLException;
import java.util.List;


import dingpiao.dao.ScheduleDAO;
import dingpiao.model.Schedule;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class ScheduleDAOImpl extends HibernateDaoSupport implements ScheduleDAO {

    public void deleteBean(Schedule bean) {
        this.getHibernateTemplate().delete(bean);

    }

    public void insertBean(Schedule bean) {
        this.getHibernateTemplate().save(bean);

    }

    @SuppressWarnings("unchecked")
    public Schedule selectBean(String where) {
        List<Schedule> list = this.getHibernateTemplate().find("from Schedule " + where);
        if (list.size() == 0) {
            return null;
        }
        return list.get(0);
    }

    public int selectBeanCount(String where) {
        long count = (Long) this.getHibernateTemplate().find("select count(*) from Schedule " + where).get(0);
        return (int) count;
    }

    @SuppressWarnings("unchecked")
    public List<Schedule> selectBeanList(final int start, final int limit, final String where) {
        return (List<Schedule>) this.getHibernateTemplate().executeFind(new HibernateCallback() {
            public Object doInHibernate(final Session session) throws HibernateException, SQLException {
                List<Schedule> list = session.createQuery("from Schedule " + where)
                        .setFirstResult(start)
                        .setMaxResults(limit)
                        .list();
                return list;
            }
        });
    }

    public void updateBean(Schedule bean) {
        this.getHibernateTemplate().update(bean);

    }

}
