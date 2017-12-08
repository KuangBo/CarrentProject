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
		return (Admin) HibernateSessionFactory.getSession().get(Admin.class, id);
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
		String hql = "SELECT COUNT(*) FROM Admin AS a WHERE a.aid=:id AND a.password=:psw";
		Query query = HibernateSessionFactory.getSession().createQuery(hql);
		query.setString("id", vo.getAid());
		query.setString("psw", vo.getPassword());
		Number num = (Number) query.uniqueResult();
		return num.intValue() == 1;
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
