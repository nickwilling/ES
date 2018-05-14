<%-- 
    Document   : top20
    Created on : 2017-6-16, 1:34:36
    Author     : nick
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link rel="stylesheet"
	href="../bootstrap-3.3.5-dist/css/bootstrap.min.css">
<script src="../bootstrap-3.3.5-dist/js/jquery-2.2.4.min.js"></script>
<script src="../bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<table class="table table-hover">
		<caption style="font-size: 20px">缺勤Top20列表</caption>
		<thead style="font-size: 17px">
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>班级</th>
				<th>缺勤次数</th>
			</tr>
		</thead>
		<c:forEach items="${top20}" var="b">

			<tr>
				<td>${b.id}</td>
				<td>${b.name}</td>
				<td>${b.batch}</td>
				<td>${b.c}</td>
			</tr>
		</c:forEach>
	</table>
	</fieldset>
</body>
</html>
