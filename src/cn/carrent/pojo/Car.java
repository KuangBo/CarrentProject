package cn.carrent.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * Car entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public class Car implements java.io.Serializable {

	// Fields

	private Integer cid;
	private String brand;
	private String model;
	private boolean state;
	private double baseprice;
	private double carrent;
	@SuppressWarnings("rawtypes")
	private Set trades = new HashSet(0);

	// Constructors

	/** default constructor */
	public Car() {
	}

	/** minimal constructor */
	public Car(Integer cid, boolean state) {
		this.cid = cid;
		this.state = state;
	}

	/** full constructor */
	@SuppressWarnings("rawtypes")
	public Car(Integer cid, String brand, String model, boolean state, double baseprice, double carrent, Set trades) {
		this.cid = cid;
		this.brand = brand;
		this.model = model;
		this.state = state;
		this.baseprice = baseprice;
		this.carrent = carrent;
		this.trades = trades;
	}

	// Property accessors

	public Integer getCid() {
		return this.cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getBrand() {
		return this.brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getModel() {
		return this.model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public boolean getState() {
		return this.state;
	}

	public void setState(boolean state) {
		this.state = state;
	}

	public double getBaseprice() {
		return this.baseprice;
	}

	public void setBaseprice(double baseprice) {
		this.baseprice = baseprice;
	}

	public double getCarrent() {
		return this.carrent;
	}

	public void setCarrent(double carrent) {
		this.carrent = carrent;
	}

	@SuppressWarnings("rawtypes")
	public Set getTrades() {
		return this.trades;
	}

	@SuppressWarnings("rawtypes")
	public void setTrades(Set trades) {
		this.trades = trades;
	}

}