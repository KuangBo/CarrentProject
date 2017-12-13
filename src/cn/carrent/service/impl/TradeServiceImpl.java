package cn.carrent.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.carrent.dao.ITradeDAO;
import cn.carrent.dbc.HibernateSessionFactory;
import cn.carrent.factory.DAOFactory;
import cn.carrent.pojo.Trade;
import cn.carrent.service.ITradeService;

public class TradeServiceImpl implements ITradeService {
	@SuppressWarnings("unused")
	private ITradeDAO tradeDAO;

	public void setTradeDAO(ITradeDAO tradeDAO) {
		this.tradeDAO = tradeDAO;
	}

	@Override
	public boolean insert(Trade vo) throws Exception {
		boolean flag = DAOFactory.getITradeDAOInstance().doCreate(vo);
		HibernateSessionFactory.getSession().beginTransaction().commit();
		HibernateSessionFactory.closeSession();
		return flag;
	}

	@Override
	public boolean update(Trade vo) throws Exception {
		boolean flag = DAOFactory.getITradeDAOInstance().doUpdate(vo);
		HibernateSessionFactory.getSession().beginTransaction().commit();
		HibernateSessionFactory.closeSession();
		return flag;
	}

	@Override
	public boolean remove(Integer id) throws Exception {
		boolean flag = DAOFactory.getITradeDAOInstance().doRemove(id);
		HibernateSessionFactory.getSession().beginTransaction().commit();
		HibernateSessionFactory.closeSession();
		return flag;
	}

	@Override
	public List<Trade> list() throws Exception {
		List<Trade> all = DAOFactory.getITradeDAOInstance().findAll();
		HibernateSessionFactory.closeSession();
		return all;
	}

	@Override
	public Map<String, Object> list(String column, String keyWord, Integer currentPage, Integer lineSize)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tradeCount", DAOFactory.getITradeDAOInstance().getAllCount(column, keyWord));
		map.put("allTrades", DAOFactory.getITradeDAOInstance().findAll(column, keyWord, currentPage, lineSize));
		HibernateSessionFactory.closeSession();
		return map;
	}

}
