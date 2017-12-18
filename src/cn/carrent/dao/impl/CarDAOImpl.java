package cn.carrent.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;

import cn.carrent.dao.ICarDAO;
import cn.carrent.dao.util.AbstractDAOImpl;
import cn.carrent.dbc.HibernateSessionFactory;
import cn.carrent.pojo.Car;
import cn.carrent.pojo.PageBean;

public class CarDAOImpl extends AbstractDAOImpl implements ICarDAO {

	@Override
	public boolean doCreate(Car vo) throws Exception {
		HibernateSessionFactory.getSession().save(vo);
		return true;
	}

	@Override
	public boolean doUpdate(Car vo) throws Exception {
		HibernateSessionFactory.getSession().update(vo);
		return true;
	}

	@Override
	public boolean doRemove(Integer id) throws Exception {
		HibernateSessionFactory.getSession().delete(this.findById(id));
		return true;
	}

	@Override
	public Car findById(Integer id) throws Exception {
		return (Car) HibernateSessionFactory.getSession().get(Car.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Car> findAll() throws Exception {
		String hql = "FROM Car AS c ";
		Query query = HibernateSessionFactory.getSession().createQuery(hql);
		return query.list();
	}

	@Override
	public Integer getAllCount(String column, String keyWord) throws Exception {
		return super.countHandle("Car", column, keyWord);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Car> findAll(String column, String keyWord, Integer currentPage, Integer lineSize) throws Exception {
		String hql = "FROM Car AS c WHERE c." + column + " LIKE ?";
		Query query = HibernateSessionFactory.getSession().createQuery(hql);
		query.setString(0, "%" + keyWord + "%");
		query.setFirstResult((currentPage - 1) * lineSize);
		query.setMaxResults(lineSize);
		return query.list();
	}

	@Override
	public List<Car> findAllSplit(Integer currentPage, Integer lineSize, String column, String keyWord)
			throws Exception {
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public PageBean<Car> findAllSplits(Integer currentPage, Integer lineSize, String column, String keyWord)
			throws Exception {
		PageBean<Car> pb = new PageBean<Car>(); // pageBean对象，用于分页
		column = "id";
		String sql = "FROM Car AS c WHERE c." + column + " LIKE ?";
		Query query = HibernateSessionFactory.getSession().createQuery(sql);
		query.setString(0, "%" + keyWord + "%");
		query.setFirstResult((currentPage - 1) * lineSize);
		query.setMaxResults(lineSize);
		List<Car> carList = query.list();
		if (carList != null && carList.size() > 0) {
			pb.setBeanList(carList);
			return pb;
		}
		return null;
	}

	@Override
	public PageBean<Car> findByCarId(Integer id) throws Exception {
		PageBean<Car> pb = new PageBean<Car>();
		List<Car> carList = new ArrayList<Car>();
		Car car = (Car) HibernateSessionFactory.getSession().get(Car.class, id);
		carList.add(car);
		if (carList != null && carList.size() > 0) {
			pb.setBeanList(carList);
			return pb;
		}
		return null;
	}

}
