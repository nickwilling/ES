<%-- 
    Document   : management
    Created on : 2017-6-20, 11:12:42
    Author     : nick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="main">
        <h3>内容管理</h3>
        <input type="radio" name="sort" id="direction"><label for="direction">说明</label>
        <input type="radio" name="sort" id="plan"><label for="plan">个人计划</label>
        <input type="radio" name="sort" id="other"><label for="other">其他</label>
        <p>当前周</p>
        <input type="text">
        <p>具体内容</p>
        <textarea></textarea><br>
        <p>所需学时</p>
        <input type="text">
        <p>课程序号</p>
        <input type="text">
        <br>
        <div class="imageSelect noSelect"></div>
        <div class="imageSelect noSelect"></div>
        <div class="imageSelect noSelect"></div>
        <div class="imageSelect"  id="fileSelect"><span>+</span></div>
        <input type="file" id="file" onchange="selectedImage(this)">
        <p>上传文件大小限制为100MB<br/>文件名称最长100个字（超出自动截断）</p>
        <input type="submit" value="提  交">
    </div>
    </body>
</html>
