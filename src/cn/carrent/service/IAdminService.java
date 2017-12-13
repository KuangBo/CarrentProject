package cn.carrent.service;

import cn.carrent.pojo.Admin;

public interface IAdminService {
	public boolean login(Admin vo) throws Exception;

	public Admin getAdminByAid(String aid) throws Exception;
}
