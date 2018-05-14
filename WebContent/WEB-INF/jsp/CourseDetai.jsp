<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/style1.css" rel="stylesheet" />
                <link rel="stylesheet" 
              href="../bootstrap-3.3.5-dist/css/bootstrap.min.css" >
        <script src="../bootstrap-3.3.5-dist/js/jquery-2.2.4.min.js"></script>
        <script src="../bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    </head>
    <body>
                       <div class="alter1">
            <h1>欢迎登录</h1>
        </div>
             <div class="alter2">
            <ul style="padding-left: 30px;">
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
            <legend>课程详细列表</legend>
            <table class="t1">
                <tr>
                    <th>Week</th>
                    <th>WeekDay</th>
                    <th>LessonTime</th>
                    <th>Location</th>
                    </tr>
                <c:forEach items="${courdList}" var="cd" >
                    <tr>
                        <td>${cd.tpdweek}</td>
                        <td>${cd.tpdweekDay}</td>
                        <td>${cd.tpdlessonTime}</td>
                        <td>${cd.tpdlocation}</td>
                    </tr>
                </c:forEach>
            </table>
        </fieldset>
        </div>
    </body>
</html>
