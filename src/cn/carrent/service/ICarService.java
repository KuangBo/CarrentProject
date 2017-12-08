package cn.carrent.service;

import java.util.List;
import java.util.Map;

import cn.carrent.pojo.Car;

public interface ICarService {
	public boolean insert(Car vo) throws Exception;

	public boolean update(Car vo) throws Exception;

	public boolean remove(Integer id) throws Exception;

	public List<Car> list() throws Exception;

	public Map<String, Object> list(String column, String keyWord, Integer currentPage, Integer lineSize)
			throws Exception;
}
