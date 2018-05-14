
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
                    <a href="foredit.do?studentId=${student.studentId}" class="ll">修改个人资料</a></li>
                <li class="glyphicon glyphicon-th-list" style='padding: 10px;width: 200px;'>
                    <a href="showcourse.do" class="ll">我的课程</a>
                </li>
            </ul>
        </div>
        <div class="alter3">
            <form action="editStu.do">
                <input type="hidden" name="studentId" value="${rollno}"> 
                <fieldset>
            <legend>修改个人资料</legend>
            <div style='margin-left: 300px'>
                <input type="hidden" name="studentId" value="${student.studentId}" >
          
                <input type="hidden" name="studentName" value="${student.studentName}" >
                <br><br>
                <span>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</span><input type="text" name="studentPwd" value="${student.studentPwd}" >
                <br><br>
                <span>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：</span><input type="text" name="studentGrade" value="${student.studentGrade}">
                <br><br>
                 <span>班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：</span><input type="text" name="batch.cid" value="${student.batch.cid}">
                <br><br>
                <span>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</span>
                <label><input type="radio" name="studentGender" value="男">男</label>
                <label><input type="radio" name="studentGender" value="女">女</label>
            </div>
                <br><br>
                <input type="submit" value="提交" style='border-radius: 5px; background-color: rgb(234,211,199);width: 70px; border: 0; margin-left: 600px;'>
        </fieldset>
                   </form>
        </div>
    </body>
</html>
