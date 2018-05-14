

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <link rel="stylesheet" 
              href="../bootstrap-3.3.5-dist/css/bootstrap.min.css" >
        <link href="../CSS/style1.css" rel="stylesheet"/>
        <script src="../bootstrap-3.3.5-dist/js/jquery-2.2.4.min.js"></script>
        <script src="../bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    </head>
    <body>
          <div class="alter1">
            <h1>欢迎登录</h1>
        </div>
        <div class="alter2">
            <ul>
                     <li class="glyphicon glyphicon-pencil" style='padding: 10px;width: 200px;'>
                    <a href="toattendance.do" class="ll">考勤</a></li><br/>
                <li class="dropdown glyphicon glyphicon-list-alt" style='padding: 10px;width: 200px;'>
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                      	  进行反馈 <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="forcFeedBack.do">对课程反馈</a></li>
                        <li><a href="forttFeedBack.do">对讲师反馈</a></li> 
                    </ul> 
                </li>
                <li class="glyphicon glyphicon-user" style='padding: 10px;width: 200px;'>
                    <a href="foredit.do" class="ll">修改个人资料</a></li>
                <li class="glyphicon glyphicon-th-list" style='padding: 10px;width: 200px;'>
                    <a href="showcourse.do" class="ll">我的课程</a></li>
            </ul>

        </div>
        <div class="alter3">
            <div style='width:300px;height:50px;margin:0 auto;font-size:26px'>${student.studentName}同学，欢迎登录！</div>
            <div style='width:300px;height:50px;margin:0 auto;'>
            <span>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</span>&nbsp;&nbsp;&nbsp;&nbsp;${student.studentId}
                <br><br>
                <span>学生姓名：</span>&nbsp;&nbsp;&nbsp;&nbsp;${student.studentName}
                <br><br>
                <span>班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：</span>&nbsp;&nbsp;&nbsp;&nbsp;${student.studentGrade}
                <br><br>
                <span>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</span>&nbsp;&nbsp;&nbsp;&nbsp;${student.studentGender}
            </div>
                <br><br>
        </div>
    </body>
</html>
