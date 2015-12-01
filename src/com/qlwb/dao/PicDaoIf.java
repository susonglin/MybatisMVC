package com.qlwb.dao;

import java.util.List;
import java.util.Map;

public interface PicDaoIf {
	public void addPic(Map param);
	public Map getPicById(String id);
	public List<Map> getPicList();
}
