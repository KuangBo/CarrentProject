package cn.carrent.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * Customer entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public class Customer implements java.io.Serializable {

	// Fields

	private Integer cusid;
	private String cusname;
	private String idcard;
	private String password;
	private String cusphone;
	private Integer balance;
	@SuppressWarnings("rawtypes")
	private Set trades = new HashSet(0);

	// Constructors

	/** default constructor */
	public Customer() {
	}

	/** minimal constructor */
	public Customer(Integer cusid) {
		this.cusid = cusid;
	}

	/** full constructor */
	@SuppressWarnings("rawtypes")
	public Customer(Integer cusid, String cusname, String idcard, String password, String cusphone, Integer balance,
			Set trades) {
		this.cusid = cusid;
		this.cusname = cusname;
		this.idcard = idcard;
		this.password = password;
		this.cusphone = cusphone;
		this.balance = balance;
		this.trades = trades;
	}

	// Property accessors

	public Integer getCusid() {
		return this.cusid;
	}

	public void setCusid(Integer cusid) {
		this.cusid = cusid;
	}

	public String getCusname() {
		return this.cusname;
	}

	public void setCusname(String cusname) {
		this.cusname = cusname;
	}

	public String getIdcard() {
		return this.idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCusphone() {
		return this.cusphone;
	}

	public void setCusphone(String cusphone) {
		this.cusphone = cusphone;
	}

	public Integer getBalance() {
		return this.balance;
	}

	public void setBalance(Integer balance) {
		this.balance = balance;
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