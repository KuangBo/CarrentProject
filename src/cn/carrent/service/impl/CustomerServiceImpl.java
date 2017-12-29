package cn.carrent.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.carrent.dao.ICustomerDAO;
import cn.carrent.dbc.HibernateSessionFactory;
import cn.carrent.factory.DAOFactory;
import cn.carrent.pojo.Customer;
import cn.carrent.pojo.PageBean;
import cn.carrent.service.ICustomerService;

public class CustomerServiceImpl implements ICustomerService {
	@SuppressWarnings("unused")
	private ICustomerDAO customerDAO;

	public void setCustomerDAO(ICustomerDAO customerDAO) {
		this.customerDAO = customerDAO;
	}

	@Override
	public boolean insert(Customer vo) throws Exception {
		boolean flag = DAOFactory.getICustomerDAOInstance().doCreate(vo);
		HibernateSessionFactory.getSession().beginTransaction().commit();
		HibernateSessionFactory.closeSession();
		return flag;
	}

	@Override
	public boolean update(Customer vo) throws Exception {
		boolean flag = DAOFactory.getICustomerDAOInstance().doUpdate(vo);
		HibernateSessionFactory.getSession().beginTransaction().commit();
		HibernateSessionFactory.closeSession();
		return flag;
	}

	@Override
	public boolean remove(Integer id) throws Exception {
		boolean flag = DAOFactory.getICustomerDAOInstance().doRemove(id);
		HibernateSessionFactory.getSession().beginTransaction().commit();
		HibernateSessionFactory.closeSession();
		return flag;
	}

	@Override
	public List<Customer> list() throws Exception {
		List<Customer> all = DAOFactory.getICustomerDAOInstance().findAll();
		HibernateSessionFactory.closeSession();
		return all;
	}

	@Override
	public Map<String, Object> list(String column, String keyWord, Integer currentPage, Integer lineSize)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerCount", DAOFactory.getICustomerDAOInstance().getAllCount(column, keyWord));
		map.put("allCustomers", DAOFactory.getICustomerDAOInstance().findAll(column, keyWord, currentPage, lineSize));
		HibernateSessionFactory.closeSession();
		return map;
	}

	@Override
	public boolean login(Customer vo) throws Exception {
		boolean flag = DAOFactory.getICustomerDAOInstance().findLogin(vo);
		HibernateSessionFactory.getSession().beginTransaction().commit();
		HibernateSessionFactory.closeSession();
		return flag;
	}

	@Override
	public Customer findById(Integer id) throws Exception {
		Customer cus = DAOFactory.getICustomerDAOInstance().findById(id);
		HibernateSessionFactory.getSession().beginTransaction().commit();
		HibernateSessionFactory.closeSession();
		return cus;
	}

	@Override
	public PageBean<Customer> listSplit(Integer currentPage, Integer lineSize, String column, String keyWord)
			throws Exception {
		PageBean<Customer> all = DAOFactory.getICustomerDAOInstance().findAllSplits(currentPage, lineSize, column,
				keyWord);
		HibernateSessionFactory.getSession().beginTransaction().commit();
		HibernateSessionFactory.closeSession();
		return all;
	}

	@Override
	public PageBean<Customer> findByCusId(Integer id, Integer currentPage, Integer lineSize, String column,
			String keyWord) throws Exception {
		PageBean<Customer> trades = DAOFactory.getICustomerDAOInstance().findByCusId(id, currentPage, lineSize, column,
				keyWord);
		HibernateSessionFactory.getSession().beginTransaction().commit();
		HibernateSessionFactory.closeSession();
		return trades;
	}

}
