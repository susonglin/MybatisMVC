<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<form action="add.do" method="post">
		姓名：<input type="text" name="name" value="${chuangke.name }"><br>
		电话:<input type="text" name="tel" value="${chuangke.tel }"><br>
		邮箱<input type="text" name="ext_email" value="${chuangke.ext_email }"><br>
		邮箱：<input type="text" name="ext_zw" value="${chuangke.ext_zw }"><br>
		创业类型：<input type="text" name="ext_xmjj" value="${chuangke.ext_xmjj }"><br>
		性别：<input type="text" name="ext_ryjj" value="${chuangke.ext_ryjj }"><br>
		贫困情况<input type="text" name="ext_rzqk" value="${chuangke.ext_rzqk }"><br>
		合适：<input type="text" name="ext_ywsyjhs" value="${chuangke.ext_ywsyjhs }"><br>
		留白：<input type="text" name="ext_cylb" value="${chuangke.ext_cylb }"><br>
		城市<input type="text" name="ext_city" value="${chuangke.ext_city }"><br>
		<input type="submit" value="提交"><br>
	</form>
</body>
</html>