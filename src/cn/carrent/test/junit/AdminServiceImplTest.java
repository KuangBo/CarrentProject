package cn.carrent.test.junit;

import org.junit.Test;

import cn.carrent.factory.ServiceFactory;
import cn.carrent.pojo.Admin;
import junit.framework.TestCase;

public class AdminServiceImplTest {

	@Test
	public void testLogin() {
		Admin vo = new Admin();
		vo.setAid("admin");
		vo.setPassword("hello");
		try {
			TestCase.assertTrue(ServiceFactory.getIAdminServiceInstance().login(vo));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
