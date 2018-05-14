<%-- 
    Document   : select
    Created on : Jun 13, 2017, 2:44:48 PM
    Author     : NIIT
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>搜索</title>
        <link rel="stylesheet" 
              href="../bootstrap-3.3.5-dist/css/bootstrap.min.css" >
        <link href="../CSS/style.css" rel="stylesheet">
        <script src="../bootstrap-3.3.5-dist/js/jquery-2.2.4.min.js"></script>
        <script type="../text/javascript" src="js/search.js"></script>
    </head>
    <body>
    <div id="large-header">
        <div class="header">
            <a href="#" style="margin-left: 30px;">QingDao University</a>
            <a href="#" style="margin-left: 100px;"><span class="glyphicon glyphicon-home"></span>&nbsp;Home</a>
            <a href="#" style="margin-left: 800px;" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<a href="login.jsp">exit</a></a>
        </div>
        <br/><br/><br/>
        <span class="admin">Welcome,${teacher.teacherName}teacher&nbsp;&nbsp;|&nbsp;&nbsp;<a href="login.jsp">exit</a></span>
            <div class="teachWrap">
            <ul class="li nav nav-pills">     
                <li class="active"><a href="#">查看所带班级</a></li>
                <li class="active"><a href="#">查看所教课程</a></li>
                <li class="active"><a href="#">指定班级出勤记录</a></li>
                <li class="active"><a href="#">指定学生出勤记录</a></li>
                <li class="active"><a href="#">缺勤前20</a></li>
            </ul>
            <hr/>
            <div class="div">
        		<div class="div0">
        		<iframe style="margin-left:60px;width:900px;height:320px;background-color: transparent; " allowTransparency="true"  frameborder=0 src="checkBatch.do"></iframe> 
        		</div>
                <div class="div1">
                <iframe style="margin-left:60px;width:900px;height:320px;background-color: transparent; " allowTransparency="true"  frameborder=0 src="checkCourse.do"></iframe>
				</div>
                <div class="div2">
                <iframe style="margin-left:60px;width:900px;height:320px;background-color: transparent; " allowTransparency="true"  frameborder=0 src="manageAttendance.do"></iframe>
                </div>
                <div class="div3">
                <iframe style="margin-left:60px;width:900px;height:320px;background-color: transparent; " allowTransparency="true"  frameborder=0 src="manageAttendanceByStudent.do"></iframe>
                </div>
                <div class="div4">
                <iframe style="margin-left:60px;width:900px;height:320px;background-color: transparent; " allowTransparency="true"  frameborder=0 src="showTop20.do"></iframe>
                </div>
            </div>
        </div>
        </div>
        <div id="foot"><br/>      		
            <span id="footspan">QingDao University</span>
            <br/><br/><br/>
            <span id="footinner">
                <a href="#">法律声明</a>&nbsp;&nbsp;|
                <a href="#">品质保证</a>&nbsp;&nbsp;|
                <a href="#">Contact</a>
                <br/><br/><br/>
                <span>Copyright 2009 青青草原(中国)有限公司, 所有权利保留</span>
            </span>
        </div>
        </div>
    </body>
</html>
<script>

    $(document).ready(function () {
        $(".nav li a").click(function () {
            var order = $(".nav li a").index(this);//获取点击之后返回当前a标签index的值
            $(".div" + order).show().siblings("div").hide();//显示class中con加上返回值所对应的DIV
        });
    })
    
    </script>