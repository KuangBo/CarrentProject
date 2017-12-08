package cn.carrent.dao.impl;

import java.util.List;

import org.hibernate.Query;

import cn.carrent.dao.IAdminDAO;
import cn.carrent.dao.util.AbstractDAOImpl;
import cn.carrent.dbc.HibernateSessionFactory;
import cn.carrent.pojo.Admin;

public class AdminDAOImpl extends AbstractDAOImpl implements IAdminDAO {

	@Override
	public boolean doCreate(Admin vo) throws Exception {
		return false;
	}

	@Override
	public boolean doUpdate(Admin vo) throws Exception {
		return false;
	}

	@Override
	public Admin findById(String id) throws Exception {
		return null;
	}

	@Override
	public List<Admin> findAll() throws Exception {
		return null;
	}

	@Override
	public Integer getAllCount(String column, String keyWord) throws Exception {
		return null;
	}

	@Override
	public boolean findLogin(Admin vo) throws Exception {
		String hql = "SELECT COUNT(*) FROM Admin AS a WHERE a.aid=? AND a.password=?";
		System.out.println(HibernateSessionFactory.getSession().createQuery(hql));
		Query query = HibernateSessionFactory.getSession().createQuery(hql);
		System.out.println("***************************");
		query.setString(0, "admin");
		query.setString(1, "hello");
		System.out.println(((Admin) query.uniqueResult()));
		return (query.uniqueResult()) != null;
	}

	@Override
	public List<Admin> findAllSplit(Integer currentPage, Integer lineSize, String column, String keyWord)
			throws Exception {
		return null;
	}

	@Override
	public boolean doRemove(String id) throws Exception {
		return false;
	}

	@Override
	public List<Admin> findAll(String column, String keyWord, Integer currentPage, Integer lineSize) throws Exception {
		return null;
	}

}
