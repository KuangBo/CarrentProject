package cn.carrent.dao;

import java.util.Set;

import cn.carrent.pojo.PageBean;
import cn.carrent.pojo.Trade;

public interface ITradeDAO extends IDAO<Integer, Trade> {

	public boolean doRemoveBatch(Set<Integer> ids) throws Exception;

	public PageBean<Trade> findByTradeId(Integer id) throws Exception;

	public Integer findTradeIdByCid(Integer cid) throws Exception;

	public PageBean<Trade> findAllTrades(String column, String keyWord, Integer currentPage, Integer lineSize);

	public PageBean<Trade> findAllSplits(Integer currentPage, Integer lineSize, String column, String keyWord)
			throws Exception;

}
