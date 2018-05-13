package dingpiao.dao;

import java.util.List;

import dingpiao.model.Ticket;

public interface TicketDAO {

    public void insertBean(Ticket bean);

    public void deleteBean(Ticket bean);

    public void updateBean(Ticket bean);

    public Ticket selectBean(String where);

    public List<Ticket> selectBeanList(final int start, final int limit, final String where);

    public int selectBeanCount(final String where);

}
