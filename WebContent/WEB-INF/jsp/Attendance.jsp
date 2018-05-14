
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" 
              href="../bootstrap-3.3.5-dist/css/bootstrap.min.css" >
        <link href="../css/style1.css" rel="stylesheet"/>
        <script src="../bootstrap-3.3.5-dist/js/jquery-2.2.4.min.js"></script>
        <script src="../bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    </head>
    <body style="top:10px;">
        <div class="alter1">
            <h1>欢迎登录</h1>
        </div>
        <div class="alter2">
            <ul>
                     <li class="glyphicon glyphicon-pencil" style='padding: 10px;width: 200px;'>
                    <a href="toattendance.do" class="ll">考勤</a></li>
                <li class="dropdown glyphicon glyphicon-list-alt" style='padding: 10px;width: 200px;'>
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        进行反馈 <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="forcFeedBack.do">对课程反馈</a></li>
                        <li><a href="fortFeedBack.do">对讲师反馈</a></li> 
                    </ul> 
                </li>
                <li class="glyphicon glyphicon-user" style='padding: 10px;width: 200px;'>
                    <a href="foredit.do" class="ll">修改个人资料</a></li>
                <li class="glyphicon glyphicon-th-list" style='padding: 10px;width: 200px;'>
                    <a href="showcourse.do" class="ll">我的课程</a></li>
            </ul>

        </div>
        <div class="alter3">

            <fieldset>
                <legend>考勤</legend>
                <form action="attendance.do">
                    <span>开始日期:</span><input name="beginDate" type="text" style='width: 130px; border-radius: 8px;'>
                    <span>截至日期:</span><input name="endDate" type="text" style='width: 130px; border-radius: 8px;'>
                    <button type="submit" style='border-radius: 5px; background-color: rgb(234,211,199);width: 70px; border: 0;'>查询</button>
                </form>
                <table >
                    <tr>
                        <th>日期</th>
                        <th>学号</th>
                        <th>学生姓名</th>
                        <th>课程名</th>
                        <th>课节</th>
                        <th>出勤状态</th>
                    </tr>
                    <c:forEach items="${attenList}" var="att" >
                        <tr>
                            <td><fmt:formatDate value="${att.adate}" pattern="yyyy-MM-dd"/></td>
                            <td>${att.student.studentId}</td>
                            <td>${att.student.studentName}</td>
                            <td>${att.teachingProgramDetail.teachingProgram.course.courseName}</td>
                            <td>${att.teachingProgramDetail.tpdlessonTime}</td>
                            <td>${att.astate}</td>
                        </tr>
                    </c:forEach>
                </table>
            </fieldset>

        </div>
    </body>
</html>
