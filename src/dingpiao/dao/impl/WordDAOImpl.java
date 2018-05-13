package dingpiao.dao.impl;

import java.sql.SQLException;
import java.util.List;


import dingpiao.dao.WordDAO;
import dingpiao.model.Word;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;


public class WordDAOImpl extends HibernateDaoSupport implements WordDAO {

    public void deleteBean(Word bean) {
        this.getHibernateTemplate().delete(bean);

    }

    public void insertBean(Word bean) {
        this.getHibernateTemplate().save(bean);

    }

    @SuppressWarnings("unchecked")
    public Word selectBean(String where) {
        List<Word> list = this.getHibernateTemplate().find("from Word " + where);
        if (list.size() == 0) {
            return null;
        }
        return list.get(0);
    }

    public int selectBeanCount(String where) {
        long count = (Long) this.getHibernateTemplate().find("select count(*) from Word " + where).get(0);
        return (int) count;
    }

    @SuppressWarnings("unchecked")
    public List<Word> selectBeanList(final int start, final int limit, final String where) {
        return (List<Word>) this.getHibernateTemplate().executeFind(new HibernateCallback() {
            public Object doInHibernate(final Session session) throws HibernateException, SQLException {
                List<Word> list = session.createQuery("from Word " + where)
                        .setFirstResult(start)
                        .setMaxResults(limit)
                        .list();
                return list;
            }
        });
    }

    public void updateBean(Word bean) {
        this.getHibernateTemplate().update(bean);

    }
}
