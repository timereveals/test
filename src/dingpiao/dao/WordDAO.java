package dingpiao.dao;

import dingpiao.model.Word;

import java.util.List;

public interface WordDAO {
    public void insertBean(Word bean);

    public void deleteBean(Word bean);

    public void updateBean(Word bean);

    public Word selectBean(String where);

    public List<Word> selectBeanList(final int start, final int limit, final String where);

    public int selectBeanCount(final String where);
}
