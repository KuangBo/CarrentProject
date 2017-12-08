package cn.carrent.factory;


import cn.carrent.service.IAdminService;
import cn.carrent.service.ICarService;
import cn.carrent.service.ICustomerService;
import cn.carrent.service.ITradeService;
import cn.carrent.service.impl.AdminServiceImpl;
import cn.carrent.service.impl.CarServiceImpl;
import cn.carrent.service.impl.CustomerServiceImpl;
import cn.carrent.service.impl.TradeServiceImpl;

public class ServiceFactory {
	public static IAdminService getIAdminServiceInstance() {
		return new AdminServiceImpl();
	}

	public static ICarService getICarServiceInstance() {
		return new CarServiceImpl();
	}

	public static ICustomerService getICustomerServiceInstance() {
		return new CustomerServiceImpl();
	}

	public static ITradeService getITradeServiceInstance() {
		return new TradeServiceImpl();
	}
}
