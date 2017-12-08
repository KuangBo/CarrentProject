package cn.carrent.service.impl;

import cn.carrent.dbc.HibernateSessionFactory;
import cn.carrent.factory.DAOFactory;
import cn.carrent.pojo.Admin;
import cn.carrent.service.IAdminService;

public class AdminServiceImpl implements IAdminService {
	@Override
	public boolean login(Admin vo) throws Exception {
		boolean flag = DAOFactory.getIAdminDAOInstance().findLogin(vo);
		HibernateSessionFactory.getSession().beginTransaction().commit();
		HibernateSessionFactory.closeSession();
		return flag;
	}

}
