package cn.carrent.service.impl;

import cn.carrent.dao.IAdminDAO;
import cn.carrent.dbc.HibernateSessionFactory;
import cn.carrent.factory.DAOFactory;
import cn.carrent.pojo.Admin;
import cn.carrent.service.IAdminService;

public class AdminServiceImpl implements IAdminService {
	@SuppressWarnings("unused")
	private IAdminDAO adminDAO;

	public void setAdminDAO(IAdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}

	@Override
	public boolean login(Admin vo) throws Exception {
		boolean flag = DAOFactory.getIAdminDAOInstance().findLogin(vo);
		HibernateSessionFactory.getSession().beginTransaction().commit();
		HibernateSessionFactory.closeSession();
		return flag;
	}

	@Override
	public Admin getAdminByAid(String aid) throws Exception {
		Admin admin = DAOFactory.getIAdminDAOInstance().findById(aid);
		HibernateSessionFactory.getSession().beginTransaction().commit();
		HibernateSessionFactory.closeSession();
		return admin;
	}

}
