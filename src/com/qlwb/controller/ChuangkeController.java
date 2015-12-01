package com.qlwb.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qlwb.dao.ChuangkeDaoIf;
import com.qlwb.util.UUIDGenerator;

@Controller
public class ChuangkeController {
	@Autowired
	ChuangkeDaoIf chuangkeDao;
	
	@RequestMapping("jsp/add")
	public String addChuangke(HttpServletRequest request){
		Map param = new HashMap();
		String uuid = new UUIDGenerator().generate().toString();
		param.put("id", uuid);
		Map parameter = request.getParameterMap();
		Iterator iterator = parameter.keySet().iterator();
		while(iterator.hasNext()) {
		//System.out.println(hm.get(iterator.next()));
			String key = (String)iterator.next();
			param.put(key, request.getParameter(key));
		}
		chuangkeDao.addChuangke(param);
		return "redirect:index.jsp";
	}
	@RequestMapping("edit/update")
	public String updateChuangke(Map param){
		chuangkeDao.updateChuangke(param);
		return "redirect:index.jsp";
	}
	@RequestMapping("jsp/editde")
	public String editdeChuangke(String id,HttpServletRequest request){
		Map chuangke = chuangkeDao.selectChuangkebyid(id);
		request.setAttribute("chuangke", chuangke);
		return "forward:/edit/edit.jsp";
	}
	@ResponseBody
	@RequestMapping("jsp/del")
	public String delChuangke(String id){
		chuangkeDao.deleteChuangkeByid(id);
		return "1";
	}
	@ResponseBody
	@RequestMapping("jsp/selectById")
	public Map<String,Object> selectChuangkeById(String id){
		Map<String,Object> chuangKe = chuangkeDao.selectChuangkebyid(id);
		return chuangKe;
	}
	@ResponseBody
	@RequestMapping("jsp/selectByPage")
	public Map<String,Object> selectChuangKeByPage(HttpServletRequest request){
		Map param = new HashMap();
		Map parameter = request.getParameterMap();
		Iterator iterator = parameter.keySet().iterator();
		while(iterator.hasNext()) {
		//System.out.println(hm.get(iterator.next()));
			String key = (String)iterator.next();
			param.put(key, request.getParameter(key));
		}
		int totalCount = chuangkeDao.selectCountChuangke(param);
		int currentPage = Integer.parseInt((String)param.get("currentPage"));
		int pageSize = Integer.parseInt((String)param.get("pageSize"));
		//System.out.println(param);
		int totalPage = (totalCount+pageSize-1)/pageSize;
		Map _limit = new HashMap();
		_limit.put("pagestart",(currentPage-1)*pageSize);
		_limit.put("pagesize",pageSize);
		param.put("_limit", _limit);
		List<Map<String,Object>> list = chuangkeDao.selectChungakeByPage(param);
		Map json = new HashMap();
		json.put("totalCount" , totalCount);
		json.put("totalPage", totalPage);
		json.put("list", list);
		return json;
	}
}
