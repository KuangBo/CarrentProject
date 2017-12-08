package cn.carrent.dao;

import cn.carrent.pojo.Admin;

public interface IAdminDAO extends IDAO<String, Admin> {
	/**
	 * 实现登录的验证操作
	 * 
	 * @param vo
	 * @return 如果输入的用户名和密码正确，则返回true，否则返回false
	 * @throws Exception
	 */
	public boolean findLogin(Admin vo) throws Exception;
}
