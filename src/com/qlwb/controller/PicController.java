package com.qlwb.controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.qlwb.dao.PicDaoIf;
import com.qlwb.util.UUIDGenerator;

@Controller
public class PicController {
	
	@Autowired
	PicDaoIf picDao;
	
	@RequestMapping("file/upload")
	public String uploadPic(MultipartFile myfile){
		try {
			String filename = myfile.getOriginalFilename();
			System.out.println(filename);
			String id = new UUIDGenerator().generate().toString();
			InputStream is = myfile.getInputStream();
			byte[]  b=null;
			b = FileCopyUtils.copyToByteArray(is);
			Map param=new HashMap();
			param.put("id", id);
			param.put("name", filename);
			param.put("pic",b);
			picDao.addPic(param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:index.jsp";
	}
	@RequestMapping("file/download")
	public void downloadPic(String id,HttpServletResponse response){
		Map picMap = picDao.getPicById(id);
		System.out.println(picMap);
		byte[] blob = (byte[])picMap.get("pic");
		response.setContentType("image/jpeg;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		//InputStream inStream=null;
		OutputStream op = null;
		byte[] data;
		long nLen=0;
		try {
	       // inStream = new ByteArrayInputStream(blob);
			//nLen = blob.length;
			//int nSize = (int) nLen;
           // data = new byte[nSize];
           // inStream.read(data);//将输入流中的数据读到数组中
            op = response.getOutputStream();
            op.write(blob);//直接显示到网页上
            op.flush();
			op.close();
            //inStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@ResponseBody
	@RequestMapping("file/piclist")
	public List<Map> getPicList(){
		return picDao.getPicList();
	}
}
