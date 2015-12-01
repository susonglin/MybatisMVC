<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<title>下载</title>
</head>
<body>
	<form action="upload.do" method="post" enctype="multipart/form-data">
		图片:<input name="myfile" type="file"><br>
		<input type="submit" value="提交">
	</form><br>
	<div id="list_div"></div>
</body>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url:"piclist.do",
			type:"post",
			dataType:"json",
	    	contentType: "application/x-www-form-urlencoded; charset=utf-8",
	    	success:function(data){
	    		var str = "";
	    		$.each(data,function(i,val){
	    			str += "<span onclick=\"download('"+val.id+"')\">"+val.name+"</span><br>";
	    		});
	    		$("#list_div").html(str);
	    	}
		});
	});
	function download(id){
		var form=$("<form>");//定义一个form表单
		form.attr("style","display:none");
		form.attr("target","");
		form.attr("method","post");
		form.attr("action","download.do");
		var input1=$("<input>");
		input1.attr("type","hidden");
		input1.attr("name","id");
		input1.attr("value",id);
		$("body").append(form);//将表单放置在web中
		form.append(input1);
		form.submit();//表单提交 
	}
</script>
</html>