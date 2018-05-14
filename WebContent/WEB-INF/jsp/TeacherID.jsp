
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
        <form action="fortFeedBack.do" style='padding: 10px;'>
            <span>请输入教师编号：</span><input type="text" name="teacherId">
                <button type="submit" style='border-radius: 5px; background-color: rgb(234,211,199);width: 70px;height: 30px; border: 0;'>查询</button>
        </form>
        <div class="alter3">
        <form action="addtFeedBack.do" style="margin-left: 50px;">
        	<input type="hidden" name="teacherId" value="${teacherId}" />
            <fieldset>
                <c:forEach items="${tquestionList}" var="cq" >
                    <h4>${cq.qid}. ${cq.qcontent}</h4>
                    <label><input type="radio" name="cq${cq.qid}" value="1">是</label>
                    <label><input type="radio" name="cq${cq.qid}" value="0">否</label>
                    </c:forEach>
            </fieldset>
            
            <button type="submit" style='border-radius: 5px; background-color: rgb(234,211,199);width: 70px; border: 0;'>提交</button>
        </form>
        </div>
    </body>
</html>
