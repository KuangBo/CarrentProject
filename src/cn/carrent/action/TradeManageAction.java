package cn.carrent.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.tomcat.util.http.parser.Authorization;

import com.opensymphony.xwork2.ActionSupport;

import cn.carrent.factory.ServiceFactory;
import cn.carrent.pojo.Car;
import cn.carrent.pojo.Customer;
import cn.carrent.pojo.PageBean;
import cn.carrent.pojo.Trade;
import cn.carrent.service.ITradeService;
import cn.carrent.util.JsonValueProcessorImplTest;
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
	private String startdates;
	private String enddates;
	private Integer cusid;
	private Integer cid;

	public void setId(Integer id) {
		this.id = id;
	}

	public void setMoney(double money) {
		this.money = money;
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
	 * 添加订单
	 * 
	 * @return
	 */
	public String addTrade() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date putdate = new Date(System.currentTimeMillis());// 得到当前时间,作为上架时间
		Trade trade = new Trade(id, cusid, cid, money, sdf.format(putdate), sdf.format(putdate), state);// 设置订单
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
	 * 得到指定订单编号的订单信息 ajax请求该方法 返回该订单信息的json对象
	 * 
	 * @return
	 * @throws Exception
	 */
	public String getTrade() throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json;charset=utf-8");
		Trade trade = new Trade();
		trade.setId(id);
		Trade newTrade = tradeService.findById(id);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class, new JsonValueProcessorImplTest());
		JSONObject jsonFromBean = JSONObject.fromObject(new Trade(newTrade.getId(), newTrade.getCustomer().getCusid(),
				newTrade.getCar().getCid(), newTrade.getMoney(), sdf.format(newTrade.getStartdate()),
				sdf.format(newTrade.getEnddate()), newTrade.getState()));
		try {
			response.getWriter().print(jsonFromBean);
		} catch (IOException e) {
			throw new RuntimeException(e.getMessage());
		}
		return null;
	}

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

	public String queryTrade() throws Exception {
		if (id != null) {
			PageBean<Trade> pb = tradeService.findByTradeId(id);
			ServletActionContext.getRequest().setAttribute("pb", pb);
		} else {
			this.findTradeByPage();
		}
		return "success";
	}

	/**
	 * 修改订单
	 * 
	 * @return
	 * @throws Exception
	 */
	public String updateTrade() throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Trade trade = new Trade();
		trade.setId(id);
		Trade updateTrade = new Trade();
		updateTrade.setId(id);
		updateTrade.setMoney(money);
		updateTrade.setStartdate(sdf.parse(startdates));
		updateTrade.setEnddate(sdf.parse(enddates));
		updateTrade.setState(state);
		Customer customer = ServiceFactory.getICustomerServiceInstance().findById(cusid);
		updateTrade.setCustomer(customer);
		Car car = ServiceFactory.getICarServiceInstance().findById(cid);
		updateTrade.setCar(car);
		Boolean flag = null;
		try {
			flag = tradeService.update(updateTrade);
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
	 * 删除指定订单
	 * 
	 * @return
	 */
	public String deleteTrade() {
		boolean success = false;
		try {
			success = tradeService.remove(id);
		} catch (Exception e1) {
			e1.printStackTrace();
		} // 删除订单
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

	public String getStartdates() {
		return startdates;
	}

	public void setStartdates(String startdates) {
		this.startdates = startdates;
	}

	public Integer getCusid() {
		return cusid;
	}

	public void setCusid(Integer cusid) {
		this.cusid = cusid;
	}

	public String getEnddates() {
		return enddates;
	}

	public void setEnddates(String enddates) {
		this.enddates = enddates;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}
}
