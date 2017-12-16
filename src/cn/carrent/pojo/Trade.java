package cn.carrent.pojo;

import java.util.Date;

/**
 * Trade entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public class Trade implements java.io.Serializable {

	// Fields

	private Integer id;
	private Customer customer;
	private Car car;
	private double money;
	private Date startdate;
	private Date enddate;
	private boolean state;
	private String startdates;
	private String enddates;
	private Integer cusid;
	private Integer cid;

	// Constructors

	/** default constructor */
	public Trade() {
	}

	/** minimal constructor */
	public Trade(Integer id, boolean state) {
		this.id = id;
		this.state = state;
	}

	public Trade(Integer id, Customer customer, Car car, double money, Date startdate, Date enddate, boolean state) {
		super();
		this.id = id;
		this.customer = customer;
		this.car = car;
		this.money = money;
		this.startdate = startdate;
		this.enddate = enddate;
		this.state = state;
	}

	/** full constructor */
	public Trade(Integer id, Integer cusid, Integer cid, double money, String startdate, String enddate,
			boolean state) {
		this.id = id;
		this.cusid = cusid;
		this.cid = cid;
		this.money = money;
		this.startdates = startdate;
		this.enddates = enddate;
		this.state = state;
	}

	public String getEnddates() {
		return enddates;
	}

	public void setEnddates(String enddates) {
		this.enddates = enddates;
	}

	public Integer getCusid() {
		return cusid;
	}

	public void setCusid(Integer cusid) {
		this.cusid = cusid;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Trade(Integer id, double money, String startdate, String enddate, boolean state) {
		this.id = id;
		this.money = money;
		this.setStartdates(startdate);
		this.enddates = enddate;
		this.state = state;
	}
	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Car getCar() {
		return this.car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

	public double getMoney() {
		return this.money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public Date getStartdate() {
		return this.startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return this.enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public boolean getState() {
		return this.state;
	}

	public void setState(boolean state) {
		this.state = state;
	}

	public String getStartdates() {
		return startdates;
	}

	public void setStartdates(String startdates) {
		this.startdates = startdates;
	}

}