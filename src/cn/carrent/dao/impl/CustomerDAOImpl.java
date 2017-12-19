package cn.carrent.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;

import cn.carrent.dao.ICustomerDAO;
import cn.carrent.dao.util.AbstractDAOImpl;
import cn.carrent.dbc.HibernateSessionFactory;
import cn.carrent.pojo.Customer;
import cn.carrent.pojo.PageBean;

public class CustomerDAOImpl extends AbstractDAOImpl implements ICustomerDAO {

	@Override
	public boolean doCreate(Customer vo) throws Exception {
		HibernateSessionFactory.getSession().save(vo);
		return true;
	}

	@Override
	public boolean doUpdate(Customer vo) throws Exception {
		HibernateSessionFactory.getSession().update(vo);
		return true;
	}

	@Override
	public boolean doRemove(Integer id) throws Exception {
		HibernateSessionFactory.getSession().delete(this.findById(id));
		return true;
	}

	@Override
	public Customer findById(Integer id) throws Exception {
		return (Customer) HibernateSessionFactory.getSession().get(Customer.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Customer> findAll() throws Exception {
		String hql = "FROM Customer AS cu ";
		Query query = HibernateSessionFactory.getSession().createQuery(hql);
		return query.list();
	}

	@Override
	public Integer getAllCount(String column, String keyWord) throws Exception {
		return super.countHandle("Customer", column, keyWord);
	}

	@Override
	public boolean findLogin(Customer vo) throws Exception {
		String hql = "SELECT COUNT(*) FROM Customer AS cu WHERE cu.cusid=:id AND cu.password=:psw";
		Query query = HibernateSessionFactory.getSession().createQuery(hql);
		query.setInteger("id", vo.getCusid());
		query.setString("psw", vo.getPassword());
		Number num = (Number) query.uniqueResult();
		return num.intValue() == 1;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Customer> findAll(String column, String keyWord, Integer currentPage, Integer lineSize)
			throws Exception {
		String hql = "FROM Customer AS cu WHERE cu." + column + " LIKE ?";
		Query query = HibernateSessionFactory.getSession().createQuery(hql);
		query.setString(0, "%" + keyWord + "%");
		query.setFirstResult((currentPage - 1) * lineSize);
		query.setMaxResults(lineSize);
		return query.list();
	}

	@Override
	public List<Customer> findAllSplit(Integer currentPage, Integer lineSize, String column, String keyWord)
			throws Exception {
		return null;
	}

	@SuppressWarnings({ "unchecked" })
	@Override
	public PageBean<Customer> findAllSplits(Integer currentPage, Integer lineSize, String column, String keyWord)
			throws Exception {
		PageBean<Customer> pb = new PageBean<Customer>(); // pageBean对象，用于分页
		pb.setPageCode(currentPage);// 设置当前页码
		pb.setPageSize(lineSize);// 设置页面记录数
		String sql = "FROM Customer AS cu WHERE cu." + column + " LIKE ?";
		Query query = HibernateSessionFactory.getSession().createQuery(sql);
		query.setString(0, "%" + keyWord + "%");
		query.setFirstResult((currentPage - 1) * lineSize);
		query.setMaxResults(lineSize);
		List<Customer> customerList = query.list();
		if (customerList != null && customerList.size() > 0) {
			pb.setBeanList(customerList);
			return pb;
		}
		return null;
	}

	@Override
	public PageBean<Customer> findByCusId(Integer id) throws Exception {
		PageBean<Customer> pb = new PageBean<Customer>();
		List<Customer> customerList = new ArrayList<Customer>();
		Customer customer = (Customer) HibernateSessionFactory.getSession().get(Customer.class, id);
		customerList.add(customer);
		if (customerList != null && customerList.size() > 0) {
			pb.setBeanList(customerList);
			return pb;
		}
		return null;
	}

	/**
	 * 
	 * @param hql传入的hql语句
	 * @param pageCode当前页
	 * @param pageSize每页显示大小
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List doSplitPage(final String hql, final int pageCode, final int pageSize) {
		System.out.println("11111111111111111111");
		// 调用模板的execute方法，参数是实现了HibernateCallback接口的匿名类，
		return (List) super.getHibernateTemplate().execute(new HibernateCallback() {
			// 重写其doInHibernate方法返回一个object对象，
			public Object doInHibernate(Session session) throws HibernateException, SQLException {
				System.out.println("22222222222222222");
				// 创建query对象
				System.out.println((pageCode - 1) * pageSize + "****" + "pageSize");
				System.out.println("33333333333333");
				Query query = session.createQuery(hql);
				System.out.println("444444444444444444444444444");
				query.setFirstResult((pageCode - 1) * pageSize);
				query.setMaxResults(pageSize);
				// 返回其执行了分布方法的list
				return query.list();
			}
		});
	}

}
