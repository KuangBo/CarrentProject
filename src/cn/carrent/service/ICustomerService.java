package cn.carrent.service;

import java.util.List;
import java.util.Map;

import cn.carrent.pojo.Customer;
import cn.carrent.pojo.PageBean;

public interface ICustomerService {
	public boolean insert(Customer vo) throws Exception;

	public boolean update(Customer vo) throws Exception;

	public boolean remove(Integer id) throws Exception;

	public Customer findById(Integer id) throws Exception;

	public PageBean<Customer> findByCusId(Integer id) throws Exception;

	public List<Customer> list() throws Exception;

	public Map<String, Object> list(String column, String keyWord, Integer currentPage, Integer lineSize)
			throws Exception;

	public PageBean<Customer> listSplit(Integer currentPage, Integer lineSize, String column, String keyWord)
			throws Exception;

	public boolean login(Customer vo) throws Exception;
}
