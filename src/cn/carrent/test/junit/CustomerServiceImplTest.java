package cn.carrent.test.junit;

import java.util.List;

import org.junit.Test;

import cn.carrent.factory.ServiceFactory;
import cn.carrent.pojo.Customer;
import junit.framework.TestCase;

public class CustomerServiceImplTest {

	@Test
	public void testInsert() {
		Customer vo = new Customer();
		vo.setCusid(3699);
		vo.setCusname("闵维潇");
		vo.setIdcard("123456789987456321");
		vo.setPassword("1253");
		vo.setCusphone("14789632541");
		vo.setBalance(100);
		try {
			TestCase.assertTrue(ServiceFactory.getICustomerServiceInstance().insert(vo));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testUpdate() {
		Customer vo = new Customer();
		vo.setCusid(3699);
		vo.setCusname("胡立阳");
		vo.setIdcard("123456789987456321");
		vo.setPassword("1253");
		vo.setCusphone("14789632541");
		vo.setBalance(100);
		try {
			TestCase.assertTrue(ServiceFactory.getICustomerServiceInstance().update(vo));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testList() {
		try {
			List<Customer> all = ServiceFactory.getICustomerServiceInstance().list();
			TestCase.assertEquals(all.size(), 6);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testLogin() {
		Customer vo = new Customer();
		vo.setCusid(8000);
		vo.setPassword("1232");
		try {
			TestCase.assertTrue(ServiceFactory.getICustomerServiceInstance().login(vo));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
