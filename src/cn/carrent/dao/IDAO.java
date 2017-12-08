package cn.carrent.dao;

import java.util.List;

public interface IDAO<K, V> {

	public boolean doCreate(V vo) throws Exception;

	public boolean doUpdate(V vo) throws Exception;

	public boolean doRemove(K id) throws Exception;

	public V findById(K id) throws Exception;

	public List<V> findAll() throws Exception;

	public List<V> findAll(String column, String keyWord, Integer currentPage, Integer lineSize) throws Exception;

	public List<V> findAllSplit(Integer currentPage, Integer lineSize, String column, String keyWord) throws Exception;

	public Integer getAllCount(String column, String keyWord) throws Exception;
}
