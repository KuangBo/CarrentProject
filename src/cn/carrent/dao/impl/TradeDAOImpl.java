package cn.carrent.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;

import cn.carrent.dao.ITradeDAO;
import cn.carrent.dao.util.AbstractDAOImpl;
import cn.carrent.dbc.HibernateSessionFactory;
import cn.carrent.pojo.PageBean;
import cn.carrent.pojo.Trade;

public class TradeDAOImpl extends AbstractDAOImpl implements ITradeDAO {
	@Override
	public boolean doCreate(Trade vo) throws Exception {
		HibernateSessionFactory.getSession().save(vo);
		return true;
	}

	@Override
	public boolean doUpdate(Trade vo) throws Exception {
		HibernateSessionFactory.getSession().update(vo);
		return true;
	}

	@Override
	public boolean doRemove(Integer id) throws Exception {
		HibernateSessionFactory.getSession().delete(this.findById(id));
		return true;
	}

	@Override
	public Trade findById(Integer id) throws Exception {
		return (Trade) HibernateSessionFactory.getSession().get(Trade.class, id);
	}

	@Override
	public PageBean<Trade> findByTradeId(Integer id, Integer currentPage, Integer lineSize, String column,
			String keyWord) throws Exception {
		PageBean<Trade> pb = new PageBean<Trade>();
		pb.setPageCode(currentPage);// 设置当前页码
		pb.setPageSize(lineSize);// 设置页面记录数
		pb.setTotalRecord(1);
		List<Trade> tradeList = new ArrayList<Trade>();
		Trade trade = (Trade) HibernateSessionFactory.getSession().get(Trade.class, id);
		tradeList.add(trade);
		if (tradeList != null && tradeList.size() > 0) {
			pb.setBeanList(tradeList);
			return pb;
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Trade> findAll() throws Exception {
		String hql = "FROM Trade AS t ";
		Query query = HibernateSessionFactory.getSession().createQuery(hql);
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Trade> findAll(String column, String keyWord, Integer currentPage, Integer lineSize) throws Exception {
		String hql = "FROM Trade AS t WHERE t." + column + " LIKE ?";
		Query query = HibernateSessionFactory.getSession().createQuery(hql);
		query.setString(0, "%" + keyWord + "%");
		query.setFirstResult((currentPage - 1) * lineSize);
		query.setMaxResults(lineSize);
		return query.list();
	}

	@Override
	public Integer getAllCount(String column, String keyWord) throws Exception {
		return super.countHandle("Trade", column, keyWord);
	}

	@Override
	public boolean doRemoveBatch(Set<Integer> ids) throws Exception {
		return false;
		// return super.removeHandle(ids, "trade", "id");
	}

	@SuppressWarnings("unchecked")
	@Override
	public PageBean<Trade> findAllSplits(Integer currentPage, Integer lineSize, String column, String keyWord)
			throws Exception {
		PageBean<Trade> pb = new PageBean<Trade>(); // pageBean对象，用于分页
		pb.setPageCode(currentPage);// 设置当前页码
		pb.setPageSize(lineSize);// 设置页面记录数
		pb.setTotalRecord(this.getAllCount(column, keyWord));
		String sql = "FROM Trade AS t WHERE t." + column + " LIKE ?";
		Query query = HibernateSessionFactory.getSession().createQuery(sql);
		query.setString(0, "%" + keyWord + "%");
		query.setFirstResult((currentPage - 1) * lineSize);
		query.setMaxResults(lineSize);
		List<Trade> tradeList = query.list();
		if (tradeList != null && tradeList.size() > 0) {
			pb.setBeanList(tradeList);
			return pb;
		}
		return null;
	}

	@Override
	@SuppressWarnings("unchecked")
	public PageBean<Trade> findAllTrades(String column, String keyWord, Integer currentPage, Integer lineSize) {
		PageBean<Trade> pb = new PageBean<Trade>(); // pageBean对象，用于分页
		String hql = "FROM Trade AS t WHERE t." + column + " LIKE ?";
		Query query = HibernateSessionFactory.getSession().createQuery(hql);
		query.setString(0, "%" + keyWord + "%");
		query.setFirstResult((currentPage - 1) * lineSize);
		query.setMaxResults(lineSize);
		List<Trade> tradeList = query.list();
		if (tradeList != null && tradeList.size() > 0) {
			pb.setBeanList(tradeList);
			return pb;
		}
		return null;
	}

	@Override
	public List<Trade> findAllSplit(Integer currentPage, Integer lineSize, String column, String keyWord)
			throws Exception {
		return null;
	}

	@Override
	public Integer findTradeIdByCid(Integer cid) throws Exception {
		String hql = "SELECT t.id FROM Trade AS t WHERE cid= " + cid;
		Query query = HibernateSessionFactory.getSession().createQuery(hql);
		return (Integer) query.uniqueResult();
	}

	@Override
	public Integer findTradeIdByCusid(Integer cusid) throws Exception {
		String hql = "SELECT t.id FROM Trade AS t WHERE cusid= " + cusid;
		Query query = HibernateSessionFactory.getSession().createQuery(hql);
		return (Integer) query.uniqueResult();
	}

}
