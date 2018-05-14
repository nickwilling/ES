<%-- 
    Document   : manageAttendance
    Created on : 2017-6-15, 11:10:10
    Author     : nick
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link rel="stylesheet"
	href="../bootstrap-3.3.5-dist/css/bootstrap.min.css">
<link href="../CSS/style.css" rel="stylesheet">
<script src="../bootstrap-3.3.5-dist/js/jquery-2.2.4.min.js"></script>
<script src="../bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<form action="showAttendaceByStudent.do">
		<span>输入学生学号：</span><input class="inputID" type="text" name="rollno">
		<br> <br> <input class="btn btn-primary addbtn"
			type="submit" value="查询">
	</form>
	<table class="table table-hover">
		<thead style="font-size: 17px">
			<tr>
				<td>日期</td>
				<td>学生学号</td>
				<td>姓名</td>
				<td>课程名</td>
				<td>节数</td>
				<td>出勤情况</td>
			</tr>
		</thead>
		<c:forEach items="${aList}" var="a">
			<tr>
				<td><fmt:formatDate value="${a.adate}"
						pattern="yyyy-MM-dd HH:mm:ss" />
				<td>${a.student.studentId}</td>
				<td>${a.student.studentName}</td>
				<td>${a.teachingProgramDetail.teachingProgram.course.courseName}</td>
				<td>${a.teachingProgramDetail.tpdlessonTime}</td>
				<c:choose>
					<c:when test="${a.astate}=1">
						<td>出勤</td>
					</c:when>
					<c:otherwise>
						<td>缺勤</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>

	</table>
</body>
</html>
