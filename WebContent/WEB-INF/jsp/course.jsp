<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试题</title>
<link rel="stylesheet"
	href="../bootstrap-3.3.5-dist/css/bootstrap.min.css">
<script src="../bootstrap-3.3.5-dist/js/jquery-2.2.4.min.js"></script>
<script src="../bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<table class="table table-hover">
		<caption style="font-size: 20px">课程列表</caption>
		<thead style="font-size: 17px">
			<tr>
				<th>课程号</th>
				<th>课程名</th>
				<th>操作</th>
			</tr>
		</thead>
		<c:forEach items="${courseList}" var="b">
			<tr>
				<td>${b.courseId}</td>
				<td>${b.courseName}</td>
				<td><a href="showTPByCourse.do?cid=${b.courseId}">查看教学计划</a>
					&nbsp;</td>
			</tr>
		</c:forEach>
	</table>
	</fieldset>
</html>
