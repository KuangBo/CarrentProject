package cn.carrent.service;

import java.util.List;
import java.util.Map;

import cn.carrent.pojo.Trade;

public interface ITradeService {
	public boolean insert(Trade vo) throws Exception;

	public boolean update(Trade vo) throws Exception;

	public boolean remove(Integer id) throws Exception;

	public Trade findByTradeId(Integer id) throws Exception;

	public List<Trade> list() throws Exception;

	public Map<String, Object> list(String column, String keyWord, Integer currentPage, Integer lineSize)
			throws Exception;
}