package cn.carrent.service;

import java.util.List;
import java.util.Map;

import cn.carrent.pojo.PageBean;
import cn.carrent.pojo.Trade;

public interface ITradeService {
	public boolean insert(Trade vo) throws Exception;

	public boolean update(Trade vo) throws Exception;

	public boolean remove(Integer id) throws Exception;

	public Trade findById(Integer id) throws Exception;

	public Integer findCarId(Integer id) throws Exception;

	public Integer findCusId(Integer id) throws Exception;

	public PageBean<Trade> findByTradeId(Integer id) throws Exception;

	public PageBean<Trade> findTradeByPage(String column, String keyWord, int pageCode, int pageSize);

	public List<Trade> list() throws Exception;

	public PageBean<Trade> listSplit(Integer currentPage, Integer lineSize, String column, String keyWord)
			throws Exception;

	public Map<String, Object> list(String column, String keyWord, Integer currentPage, Integer lineSize)
			throws Exception;
}