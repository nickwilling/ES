
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
                    <a href="toattendance.do" class="ll">考勤</a></li><br/>
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
            <legend>课程列表</legend>
            <table>
                <tr>
                    <th>课程号</th>
                    <th>课程名</th>
                    <th>考试方式</th>
                    <th>课程学分</th>
                    <th>课程学时</th>
                    <th>讲师姓名</th>
                    <th>讲师编号</th>
                </tr>
                <c:forEach items="${courList}" var="b">
                    <tr>
                        <td>${b[0]}</td>
                        <td>${b[1]}</td>
                        <td>${b[2]}</td>
                        <td>${b[3]}</td>
                        <td>${b[4]}</td>
                        <td>${b[5]}</td>
                        <td>${b[6]}</td>
                        <td>
                            <a href="showcoursedetail.do?TID=${b[7]}">查看详情</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </fieldset>
        </div>
    </body>
</html>
