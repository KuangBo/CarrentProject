package cn.carrent.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.tomcat.util.http.parser.Authorization;

import com.opensymphony.xwork2.ActionSupport;

import cn.carrent.pojo.Car;
import cn.carrent.pojo.PageBean;
import cn.carrent.service.ICarService;
import cn.carrent.service.ITradeService;
import cn.carrent.util.JsonValueProcessorImplTest;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

@SuppressWarnings("serial")
public class CarManageAction extends ActionSupport {
	private ICarService carService;
	private ITradeService tradeService;

	private Integer cid;
	private String brand;
	private String model;
	private boolean state;
	private double baseprice;
	private double carrent;

	private int pageCode;

	public void setPageCode(int pageCode) {
		this.pageCode = pageCode;
	}

	public void setTradeService(ITradeService tradeService) {
		this.tradeService = tradeService;
	}

	public void setCarService(ICarService carService) {
		this.carService = carService;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public void setState(boolean state) {
		this.state = state;
	}

	public void setBaseprice(double baseprice) {
		this.baseprice = baseprice;
	}

	public void setCarrent(double carrent) {
		this.carrent = carrent;
	}

	/**
	 * 添加车辆
	 * 
	 * @return
	 */
	public String addCar() {
		Car car = new Car(cid, brand, model, state, baseprice, carrent);
		boolean b = false;
		try {
			b = carService.insert(car);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		int success = 0;
		if (b) {
			success = 1;
		} else {
			success = 0;
		}
		try {
			ServletActionContext.getResponse().getWriter().print(success);
		} catch (IOException e) {
			throw new RuntimeException(e.getMessage());
		}
		return null;
	}

	/**
	 * 得到指定车辆编号的车辆信息 ajax请求该方法 返回该车辆信息的json对象
	 * 
	 * @return
	 * @throws Exception
	 */
	public String getCar() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json;charset=utf-8");
		Car car = new Car();
		car.setCid(cid);
		Car newCar = carService.findById(cid);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new JsonValueProcessorImplTest());
		JSONObject jsonFromBean = JSONObject.fromObject(new Car(newCar.getCid(), newCar.getBrand(), newCar.getModel(),
				newCar.getState(), newCar.getBaseprice(), newCar.getCarrent()));
		try {
			response.getWriter().print(jsonFromBean);
		} catch (IOException e) {
			throw new RuntimeException(e.getMessage());
		}
		return null;
	}

	public String findCarByPage() throws Exception {
		// 获取页面传递过来的当前页码数
		if (pageCode == 0) {
			pageCode = 1;
		}
		// 给pageSize,每页的记录数赋值
		int pageSize = 5;
		String column = "cid";
		String keyWord = "";
		PageBean<Car> pb = carService.listSplit(pageCode, pageSize, column, keyWord);
		if (pb != null) {
			pb.setUrl("findCarByPage.action?");
		}
		// 存入request域中
		ServletActionContext.getRequest().setAttribute("pb", pb);
		return "success";
	}

	public String getAllCar() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json;charset=utf-8");
		List<Car> newCar = carService.list();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setJsonPropertyFilter(new PropertyFilter() {
			public boolean apply(Object obj, String name, Object value) {
				if (obj instanceof Authorization || name.equals("authorization")) {
					return true;
				} else {
					return false;
				}
			}
		});

		JSONObject jsonObject = JSONObject.fromObject(newCar, jsonConfig);
		try {
			response.getWriter().print(jsonObject);
		} catch (IOException e) {
			throw new RuntimeException(e.getMessage());
		}
		return null;
	}

	/**
	 * 查询车辆
	 * 
	 * @return
	 * @throws Exception
	 */
	public String queryCar() throws Exception {
		if (cid != null) {
			PageBean<Car> pb = carService.findByCarId(cid);
			ServletActionContext.getRequest().setAttribute("pb", pb);
		} else {
			this.findCarByPage();
		}
		return "success";
	}

	/**
	 * 修改车辆
	 * 
	 * @return
	 * @throws Exception
	 */
	public String updateCar() throws Exception {
		Car car = new Car();
		car.setCid(cid);
		Car updateCar = new Car();
		updateCar.setCid(cid);
		updateCar.setBrand(brand);
		updateCar.setModel(model);
		updateCar.setBaseprice(baseprice);
		updateCar.setCarrent(carrent);
		updateCar.setState(state);
		Boolean flag = null;
		try {
			flag = carService.update(updateCar);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		int success = 0;
		if (flag) {
			success = 1;
			// 由于是转发并且js页面刷新,所以无需重查
		}
		try {
			ServletActionContext.getResponse().getWriter().print(success);
		} catch (IOException e) {
			throw new RuntimeException(e.getMessage());
		}
		return null;
	}

	/**
	 * 删除指定车辆
	 * 
	 * @return
	 */
	public String deleteCar() {
		boolean success = false;
		try {
			boolean flag = tradeService.remove(tradeService.findCarId(cid));
			if (flag) {
				success = carService.remove(cid);
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		} // 删除车辆
		int data = 0;
		if (success) {
			data = 1;
		}
		try {
			ServletActionContext.getResponse().getWriter().print(data);
		} catch (IOException e) {
			throw new RuntimeException(e.getMessage());
		}

		return null;
	}
}
