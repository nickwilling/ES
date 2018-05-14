<%-- 
    Document   : selectTeacherFeedBack
    Created on : 2017-6-22, 16:37:47
    Author     : nick
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" 
              href="../bootstrap-3.3.5-dist/css/bootstrap.min.css" >
        <link href="../CSS/style.css" rel="stylesheet">
        <script src="../bootstrap-3.3.5-dist/js/jquery-2.2.4.min.js"></script>
        <script src="../bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    </head>
    <body>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>StudentID</th>
                    <th>FeedBackQuestion</th>
                    <th>FeedBackOption</th>
                    <th>status</th>
                    <th>TeacherID</th>
                    <th>TeacherName</th>
                    <th>Operate</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${TFDList}" var="tfd">
                    <tr>
                        <td>${tfd.student.studentId}</td>
                        <td>${tfd.student.studentName}</td>
                        <td>${tfd.teacherFeedBackQuestion.qcontent}</td>
                        <td>${tfd.foption}</td>
                        <td>${tfd.teacherFeedBackQuestion.teacher.teacherId}</td>
                        <td>${tfd.teacherFeedBackQuestion.teacher.teacherName}</td>
                        <td>
                            <form>
                                <input type="hidden" name="id" value="${tfd.fid}">
                                <button style="margin-top: -4px;" type="submit" formaction="deleteTFB.do" class="btn btn-danger btn-sm">删除</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
