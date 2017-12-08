package cn.carrent.pojo;

/**
 * Admin entity. @author MyEclipse Persistence Tools
 */

@SuppressWarnings("serial")
public class Admin implements java.io.Serializable {

	// Fields

	private String aid;
	private String password;

	// Constructors

	/** default constructor */
	public Admin() {
	}

	/** minimal constructor */
	public Admin(String aid) {
		this.aid = aid;
	}

	/** full constructor */
	public Admin(String aid, String password) {
		this.aid = aid;
		this.password = password;
	}

	// Property accessors

	public String getAid() {
		return this.aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}