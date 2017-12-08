package cn.carrent.factory;

import cn.carrent.dao.IAdminDAO;
import cn.carrent.dao.ICarDAO;
import cn.carrent.dao.ICustomerDAO;
import cn.carrent.dao.ITradeDAO;
import cn.carrent.dao.impl.AdminDAOImpl;
import cn.carrent.dao.impl.CarDAOImpl;
import cn.carrent.dao.impl.CustomerDAOImpl;
import cn.carrent.dao.impl.TradeDAOImpl;

public class DAOFactory {
	public static IAdminDAO getIAdminDAOInstance() {
		return new AdminDAOImpl();
	}

	public static ICarDAO getICarDAOInstance() {
		return new CarDAOImpl();
	}

	public static ICustomerDAO getICustomerDAOInstance() {
		return new CustomerDAOImpl();
	}

	public static ITradeDAO getITradeDAOInstance() {
		return new TradeDAOImpl();
	}
}
