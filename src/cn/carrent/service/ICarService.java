package cn.carrent.service;

import java.util.List;
import java.util.Map;

import cn.carrent.pojo.Car;
import cn.carrent.pojo.PageBean;

public interface ICarService {
	public boolean insert(Car vo) throws Exception;

	public boolean update(Car vo) throws Exception;

	public boolean remove(Integer id) throws Exception;

	public Car findById(Integer id) throws Exception;

	public PageBean<Car> findByCarId(Integer id, Integer currentPage, Integer lineSize, String column, String keyWord)
			throws Exception;

	public List<Car> list() throws Exception;

	public Map<String, Object> list(String column, String keyWord, Integer currentPage, Integer lineSize)
			throws Exception;

	public PageBean<Car> listSplit(Integer currentPage, Integer lineSize, String column, String keyWord)
			throws Exception;
}
