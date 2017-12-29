package cn.carrent.dao;

import cn.carrent.pojo.Customer;
import cn.carrent.pojo.PageBean;

public interface ICustomerDAO extends IDAO<Integer, Customer> {
	/**
	 * 实现登录的验证操作
	 * 
	 * @param vo
	 * @return 如果输入的用户名和密码正确，则返回true，否则返回false
	 * @throws Exception
	 */
	public boolean findLogin(Customer vo) throws Exception;

	public PageBean<Customer> findAllSplits(Integer currentPage, Integer lineSize, String column, String keyWord)
			throws Exception;

	public PageBean<Customer> findByCusId(Integer id, Integer currentPage, Integer lineSize, String column,
			String keyWord) throws Exception;
}
