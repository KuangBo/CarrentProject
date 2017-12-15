package cn.carrent.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.tomcat.util.http.parser.Authorization;

import com.opensymphony.xwork2.ActionSupport;

import cn.carrent.pojo.Car;
import cn.carrent.pojo.Customer;
import cn.carrent.pojo.PageBean;
import cn.carrent.pojo.Trade;
import cn.carrent.service.ITradeService;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

@SuppressWarnings("serial")
public class TradeManageAction extends ActionSupport {

	private ITradeService tradeService;
	private int pageCode;

	public void setTradeService(ITradeService tradeService) {
		this.tradeService = tradeService;
	}

	private Integer id; // 交易单号
	private double money; // 交易金额
	private Customer customer;
	private Car car;

	public void setId(Integer id) {
		this.id = id;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public void setCar(Car car) {
		this.car = car;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public void setState(boolean state) {
		this.state = state;
	}

	private Date startdate;
	private Date enddate;
	private boolean state;

	/**
	 * 添加图书
	 * 
	 * @return
	 */
	public String addTrade() {
		Date putdate = new Date(System.currentTimeMillis());// 得到当前时间,作为上架时间
		Trade trade = new Trade(id, customer, car, money, putdate, putdate, state);// 设置图书
		boolean b = false;
		try {
			b = tradeService.insert(trade);
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
	 * 得到指定图书编号的图书信息 ajax请求该方法 返回该图书信息的json对象
	 * 
	 * @return
	 * @throws Exception
	 */
	public String getTrade() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json;charset=utf-8");
		Trade trade = new Trade();
		trade.setId(id);
		Trade newTrade = tradeService.findByTradeId(id);
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

		JSONObject jsonObject = JSONObject.fromObject(newTrade, jsonConfig);
		try {
			response.getWriter().print(jsonObject);
		} catch (IOException e) {
			throw new RuntimeException(e.getMessage());
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public String findTradeByPage() throws Exception {
		// 获取页面传递过来的当前页码数
		if (pageCode == 0) {
			pageCode = 1;
		}
		// 给pageSize,每页的记录数赋值
		int pageSize = 5;
		String column = "id";
		String keyWord = "";
		PageBean<Trade> pb = tradeService.listSplit(pageCode, pageSize, column, keyWord);
		if (pb != null) {
			pb.setUrl("findTradeByPage.action?");
		}
		// 存入request域中
		ServletActionContext.getRequest().setAttribute("pb", pb);
		System.out.println(pb);
		return "success";
	}

	public String getAllTrade() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json;charset=utf-8");
		List<Trade> newTrade = tradeService.list();
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

		JSONObject jsonObject = JSONObject.fromObject(newTrade, jsonConfig);
		try {
			response.getWriter().print(jsonObject);
		} catch (IOException e) {
			throw new RuntimeException(e.getMessage());
		}
		return null;
	}

	/**
	 * 修改图书
	 * 
	 * @return
	 */
	public String updateTrade() {
		Date putdate = new Date(System.currentTimeMillis());// 得到当前时间,作为上架时间
		Trade trade = new Trade();
		trade.setId(id);
		Trade updateTrade = new Trade();
		updateTrade.setId(id);
		updateTrade.setMoney(money);
		updateTrade.setStartdate(putdate);
		updateTrade.setEnddate(putdate);
		updateTrade.setState(state);
		updateTrade.setCar(car);
		updateTrade.setCustomer(customer);
		Boolean flag = null;
		try {
			flag = tradeService.update(updateTrade);
		} catch (Exception e1) {
			e1.printStackTrace();
		} // 修改图书信息对象
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
	 * 删除指定图书
	 * 
	 * @return
	 */
	public String deleteTrade() {
		// 删除图书需要注意的事项：如果该书有尚未归还的记录或者尚未缴纳的罚款记录,则不能删除
		boolean success = false;
		try {
			success = tradeService.remove(id);
		} catch (Exception e1) {
			e1.printStackTrace();
		} // 删除图书

		try {
			ServletActionContext.getResponse().getWriter().print(success);
		} catch (IOException e) {
			throw new RuntimeException(e.getMessage());
		}

		return null;
	}
}
