package cn.carrent.dao;

import java.util.Set;

import cn.carrent.pojo.Trade;

public interface ITradeDAO extends IDAO<Integer, Trade> {

	public boolean doRemoveBatch(Set<Integer> ids) throws Exception;
}
