package com.qlwb.dao;

import java.util.List;
import java.util.Map;

public interface ChuangkeDaoIf {
	public void addChuangke(Map<String,Object> param);
	public void updateChuangke(Map<String,Object> param);
	public void deleteChuangkeByid(String id);
	public Map selectChuangkebyid(String id);
	public int selectCountChuangke(Map<String,Object> param);
	public List<Map<String,Object>> selectChungakeByPage (Map<String,Object> param);
	
}
