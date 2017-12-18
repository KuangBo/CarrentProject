package cn.carrent.action;

import com.opensymphony.xwork2.ActionSupport;

import cn.carrent.service.ICarService;

@SuppressWarnings("serial")
public class CarManageAction extends ActionSupport {
	private ICarService carService;
	private Integer cid;
	private String brand;
	private String model;
	private boolean state;
	private double baseprice;
	private double carrent;

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
}
