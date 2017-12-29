package cn.carrent.dao;

import cn.carrent.pojo.Car;
import cn.carrent.pojo.PageBean;

public interface ICarDAO extends IDAO<Integer, Car> {
	public PageBean<Car> findByCarId(Integer id, Integer currentPage, Integer lineSize, String column, String keyWord)
			throws Exception;

	public PageBean<Car> findAllSplits(Integer currentPage, Integer lineSize, String column, String keyWord)
			throws Exception;
}
