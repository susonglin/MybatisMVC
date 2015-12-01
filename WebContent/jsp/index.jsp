<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<title>Insert title here</title>
</head>
<body>
电话模糊查询：<input type="text" id="tel_str"><br>
电话查询：<input type="text" id="tel"><br>
		<button onclick="query()">查询</button>
	<table>
		<caption>展示页</caption>
		<thead>
			<th>姓名</th>
			<th>电话</th>
			<th>邮箱</th>
			<th>邮箱</th>
			<th>创业类型</th>
			<th>性别</th>
			<th>贫困情况</th>
			<th>合适</th>
			<th>留白</th>
			<th>城市</th>
			<th>编辑</th>
			<th>删除</th>
		</thead>
		<tbody id="tbody">
			
		</tbody>
	</table>
	<button id="first">首页</button>
    <button id="pre">上一页</button>
    <button id="next">下一页</button>
    <button id="end">末页</button>
</body>
<script type="text/javascript">
	var currentPage = 1,pageSize = 10;
    var totalCount,totalPage;
	$(function(){
		selectByPage();
	})
	function selectByPage(){
		var data = {};
		data.currentPage = currentPage;
		data.pageSize = pageSize;
		if($("#tel_str").val()){
			data.tel_str = $("#tel_str").val();
		}else{
			if($("#tel").val()){
				data.tel = $("#tel").val();
			}
		}
		$.ajax({
			url:"selectByPage.do",
			type:"post",
			data:data,
			dataType:"json",
	    	contentType: "application/x-www-form-urlencoded; charset=utf-8",
	    	success:function(data){
	    		if(data){
	    			//var data = JSON.parse(data);
	    			totalCount = data.totalCount;
	    			totalPage = data.totalPage;
	    			var list = data.list;
	    			var str = "";
	    			$.each(list,function(i,item){
	    				str += "<tr>";
	    				str += "<td>"+item.name+"</td>";
	    				str += "<td>"+item.tel+"</td>";
	    				str += "<td>"+item.ext_email+"</td>";
	    				str += "<td>"+item.ext_zw+"</td>";
	    				str += "<td>"+item.ext_xmjj+"</td>";
	    				str += "<td>"+item.ext_ryjj+"</td>";
	    				str += "<td>"+item.ext_rzqk+"</td>";
	    				str += "<td>"+item.ext_ywsyjhs+"</td>";
	    				str += "<td>"+item.ext_cylb+"</td>";
	    				str += "<td>"+item.ext_city+"</td>";
	    				str += "<td><a href='editde.do?id="+item.id+"'>编辑</a></td>";
	    				str += "<td><span onclick=\"delChuangke('"+item.id+"')\">删除</span></td>";
	    				str += "</tr>";
	    			});
	    			
	    			$("#tbody").html(str);
	    			addEventForButton();
	    		}
	    	}
		});
	}
		function addEventForButton(){
	    		$("#first,#pre,#next,#end").unbind();
	    		if(totalPage>1){
	    			if(currentPage==1){
	    				$("#next,#end").click(function(){
	    					changeCurrentPage($(this).attr("id"));
	    				});
	    			}else if(currentPage==totalPage){
	    				$("#first,#pre").click(function(){
	    					changeCurrentPage($(this).attr("id"));
	    				});
	    			}else{
	    				$("#first,#pre,#next,#end").click(function(){
	    					changeCurrentPage($(this).attr("id"));
	    				});
	    			}
	    		}
	    	}
	    	function changeCurrentPage(id){
	    		if(id=="first") currentPage = 1;
	    		else if(id=="pre") currentPage -= 1;
	    		else if(id=="next") currentPage += 1;
	    		else if(id=="end") currentPage = totalPage;
	    		selectByPage();
	    	}
  
	function delChuangke(id){
		var data = {};
		data.id = id;
		$.ajax({
			url:"del.do",
			type:"post",
			data:data,
	    	contentType: "application/x-www-form-urlencoded; charset=utf-8",
	    	success:function(data){
	    		if(data){
	    			window.location.href = "index.jsp";
	    		}
	    	}
	    });
	}
	function query(){
		currentPage = 1;
		pageSize = 10;
		selectByPage();
	}
</script>
</html>