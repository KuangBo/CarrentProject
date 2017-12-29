package cn.carrent.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.carrent.dao.ICarDAO;
import cn.carrent.dbc.HibernateSessionFactory;
import cn.carrent.factory.DAOFactory;
import cn.carrent.pojo.Car;
import cn.carrent.pojo.PageBean;
import cn.carrent.service.ICarService;

public class CarServiceImpl implements ICarService {
	@SuppressWarnings("unused")
	private ICarDAO carDAO;

	public void setCarDAO(ICarDAO carDAO) {
		this.carDAO = carDAO;
	}

	@Override
	public boolean insert(Car vo) throws Exception {
		boolean flag = DAOFactory.getICarDAOInstance().doCreate(vo);
		HibernateSessionFactory.getSession().beginTransaction().commit();
		HibernateSessionFactory.closeSession();
		return flag;
	}

	@Override
	public boolean update(Car vo) throws Exception {
		boolean flag = DAOFactory.getICarDAOInstance().doUpdate(vo);
		HibernateSessionFactory.getSession().beginTransaction().commit();
		HibernateSessionFactory.closeSession();
		return flag;
	}

	@Override
	public boolean remove(Integer id) throws Exception {
		boolean flag = DAOFactory.getICarDAOInstance().doRemove(id);
		HibernateSessionFactory.getSession().beginTransaction().commit();
		HibernateSessionFactory.closeSession();
		return flag;
	}

	@Override
	public List<Car> list() throws Exception {
		List<Car> all = DAOFactory.getICarDAOInstance().findAll();
		HibernateSessionFactory.closeSession();
		return all;
	}

	@Override
	public Map<String, Object> list(String column, String keyWord, Integer currentPage, Integer lineSize)
			throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("carCount", DAOFactory.getICarDAOInstance().getAllCount(column, keyWord));
		map.put("allCars", DAOFactory.getICarDAOInstance().findAll(column, keyWord, currentPage, lineSize));
		HibernateSessionFactory.closeSession();
		return map;
	}

	@Override
	public Car findById(Integer id) throws Exception {
		Car car = DAOFactory.getICarDAOInstance().findById(id);
		HibernateSessionFactory.getSession().beginTransaction().commit();
		HibernateSessionFactory.closeSession();
		return car;
	}

	@Override
	public PageBean<Car> listSplit(Integer currentPage, Integer lineSize, String column, String keyWord)
			throws Exception {
		PageBean<Car> all = DAOFactory.getICarDAOInstance().findAllSplits(currentPage, lineSize, column, keyWord);
		HibernateSessionFactory.closeSession();
		return all;
	}

	@Override
	public PageBean<Car> findByCarId(Integer id, Integer currentPage, Integer lineSize, String column, String keyWord)
			throws Exception {
		PageBean<Car> cars = DAOFactory.getICarDAOInstance().findByCarId(id, currentPage, lineSize, column, keyWord);
		HibernateSessionFactory.getSession().beginTransaction().commit();
		HibernateSessionFactory.closeSession();
		return cars;
	}
}
