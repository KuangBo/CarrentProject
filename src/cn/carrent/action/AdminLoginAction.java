package cn.carrent.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import cn.carrent.pojo.Admin;
import cn.carrent.service.IAdminService;
import cn.carrent.util.MD5Util;

@SuppressWarnings("serial")
public class AdminLoginAction extends ActionSupport {

	private IAdminService adminService;

	public void setAdminService(IAdminService adminService) {
		this.adminService = adminService;
	}

	private String username;
	private String pwd;

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	/**
	 * Ajax异步请求获得登录许可
	 * 
	 * @return 返回登录状态
	 * @throws Exception
	 */
	public String login() throws Exception {
		// 管理员
		Admin admin = new Admin();
		admin.setAid(username);
		admin.setPassword(MD5Util.getMD5(pwd));
		Admin newAdmin = adminService.getAdminByAid(admin.getAid());
		int login = 1;
		if (newAdmin == null) {
			// 用户名不存在
			login = -1;
		} else if (!newAdmin.getPassword().equals(admin.getPassword())) {
			// 密码不正确
			login = -2;
		} else {
			// 存储入session
			ServletActionContext.getContext().getSession().put("admin", newAdmin);
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			response.getWriter().print(login);
		} catch (IOException e) {
			throw new RuntimeException(e.getMessage());
		}
		return null;
	}

	/**
	 * 退出登录
	 */
	public String logout() {
		ServletActionContext.getContext().getSession().remove("admin");
		return "logout";
	}

}