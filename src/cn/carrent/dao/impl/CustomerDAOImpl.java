package cn.carrent.dao.impl;

import java.util.List;

import org.hibernate.Query;

import cn.carrent.dao.ICustomerDAO;
import cn.carrent.dao.util.AbstractDAOImpl;
import cn.carrent.dbc.HibernateSessionFactory;
import cn.carrent.pojo.Customer;

public class CustomerDAOImpl extends AbstractDAOImpl implements ICustomerDAO {

	@Override
	public boolean doCreate(Customer vo) throws Exception {
		HibernateSessionFactory.getSession().save(vo);
		return true;
	}

	@Override
	public boolean doUpdate(Customer vo) throws Exception {
		HibernateSessionFactory.getSession().update(vo);
		return true;
	}

	@Override
	public boolean doRemove(Integer id) throws Exception {
		HibernateSessionFactory.getSession().delete(this.findById(id));
		return true;
	}

	@Override
	public Customer findById(Integer id) throws Exception {
		return (Customer) HibernateSessionFactory.getSession().get(Customer.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Customer> findAll() throws Exception {
		String hql = "FROM Customer AS c ";
		Query query = HibernateSessionFactory.getSession().createQuery(hql);
		return query.list();
	}

	@Override
	public Integer getAllCount(String column, String keyWord) throws Exception {
		return super.countHandle("Customer", column, keyWord);
	}

	@Override
	public boolean findLogin(Customer vo) throws Exception {
		String hql = "SELECT COUNT(*) FROM Customer AS c WHERE c.cusid=:id AND c.password=:psw";
		Query query = HibernateSessionFactory.getSession().createQuery(hql);
		query.setInteger("id", vo.getCusid());
		query.setString("psw", vo.getPassword());
		return (query.uniqueResult()) != null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Customer> findAll(String column, String keyWord, Integer currentPage, Integer lineSize)
			throws Exception {
		String hql = "FROM Customer AS c WHERE c." + column + " LIKE ?";
		Query query = HibernateSessionFactory.getSession().createQuery(hql);
		query.setString(0, "%" + keyWord + "%");
		query.setFirstResult((currentPage - 1) * lineSize);
		query.setMaxResults(lineSize);
		return query.list();
	}

	@Override
	public List<Customer> findAllSplit(Integer currentPage, Integer lineSize, String column, String keyWord)
			throws Exception {
		return null;
	}

}
