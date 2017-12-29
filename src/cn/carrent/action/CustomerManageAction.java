package cn.carrent.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.tomcat.util.http.parser.Authorization;

import com.opensymphony.xwork2.ActionSupport;

import cn.carrent.pojo.Customer;
import cn.carrent.pojo.PageBean;
import cn.carrent.service.ICustomerService;
import cn.carrent.service.ITradeService;
import cn.carrent.util.JsonValueProcessorImplTest;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

@SuppressWarnings("serial")
public class CustomerManageAction extends ActionSupport {
	private ICustomerService customerService;
	private ITradeService tradeService;
	private Integer cusid;
	private String cusname;
	private String idcard;

	public void setCustomerService(ICustomerService customerService) {
		this.customerService = customerService;
	}

	public void setTradeService(ITradeService tradeService) {
		this.tradeService = tradeService;
	}

	private String password;
	private String cusphone;
	private Integer balance;

	private int pageCode;

	public void setCusid(Integer cusid) {
		this.cusid = cusid;
	}

	public void setCusname(String cusname) {
		this.cusname = cusname;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setCusphone(String cusphone) {
		this.cusphone = cusphone;
	}

	public void setBalance(Integer balance) {
		this.balance = balance;
	}

	public void setPageCode(int pageCode) {
		this.pageCode = pageCode;
	}

	public String addCustomer() {
		Customer customer = new Customer(cusid, cusname, idcard, password, cusphone, balance);
		boolean b = false;
		try {
			b = customerService.insert(customer);
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

	public String getCustomer() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json;charset=utf-8");
		Customer customer = new Customer();
		customer.setCusid(cusid);
		Customer newCustomer = customerService.findById(cusid);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new JsonValueProcessorImplTest());
		JSONObject jsonFromBean = JSONObject
				.fromObject(new Customer(newCustomer.getCusid(), newCustomer.getCusname(), newCustomer.getIdcard(),
						newCustomer.getPassword(), newCustomer.getCusphone(), newCustomer.getBalance()));
		try {
			response.getWriter().print(jsonFromBean);
		} catch (IOException e) {
			throw new RuntimeException(e.getMessage());
		}
		return null;
	}

	public String findCustomerByPage() throws Exception {
		if (pageCode == 0) {
			pageCode = 1;
		}
		int pageSize = 5;
		String column = "cusid";
		String keyWord = "";
		PageBean<Customer> pb = customerService.listSplit(pageCode, pageSize, column, keyWord);
		if (pb != null) {
			pb.setUrl("findCustomerByPage.action?");
		}
		ServletActionContext.getRequest().setAttribute("pb", pb);
		return "success";
	}

	public String getAllCustomer() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json;charset=utf-8");
		List<Customer> newCustomer = customerService.list();
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

		JSONObject jsonObject = JSONObject.fromObject(newCustomer, jsonConfig);
		try {
			response.getWriter().print(jsonObject);
		} catch (IOException e) {
			throw new RuntimeException(e.getMessage());
		}
		return null;
	}

	public String queryCustomer() throws Exception {
		// 获取页面传递过来的当前页码数
		if (pageCode == 0) {
			pageCode = 1;
		}
		// 给pageSize,每页的记录数赋值
		int pageSize = 5;
		String column = "cusid";
		String keyWord = "";
		PageBean<Customer> pb = null;
		if (cusid != null) {
			pb = customerService.findByCusId(cusid, pageCode, pageSize, column, keyWord);
		} else {
			pb = customerService.listSplit(pageCode, pageSize, column, keyWord);
		}
		if (pb != null) {
			pb.setUrl("queryCustomer.action?");
		}
		ServletActionContext.getRequest().setAttribute("pb", pb);
		return "success";
	}

	public String updateCustomer() throws Exception {
		Customer customer = new Customer();
		customer.setCusid(cusid);
		Customer updateCustomer = new Customer();
		updateCustomer.setCusid(cusid);
		updateCustomer.setCusname(cusname);
		updateCustomer.setIdcard(idcard);
		updateCustomer.setPassword(password);
		updateCustomer.setCusphone(cusphone);
		updateCustomer.setBalance(balance);
		Boolean flag = null;
		try {
			flag = customerService.update(updateCustomer);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		int success = 0;
		if (flag) {
			success = 1;
		}
		try {
			ServletActionContext.getResponse().getWriter().print(success);
		} catch (IOException e) {
			throw new RuntimeException(e.getMessage());
		}
		return null;
	}

	public String deleteCustomer() {
		boolean success = false;
		try {
			if (tradeService.findCusId(cusid) != null) {
				tradeService.remove(tradeService.findCusId(cusid));
			}
			success = customerService.remove(cusid);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
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