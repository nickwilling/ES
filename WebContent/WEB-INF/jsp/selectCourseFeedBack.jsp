<%-- 
    Document   : selectCourseFeedBack
    Created on : 2017-6-22, 16:36:38
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
                    <th>StudentName</th>
                    <th>FeedBackQuestion</th>
                    <th>FeedBackOption</th>
                    <th>CourseID</th>
                    <th>CourseName</th>
                    <th>Operate</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${CFDList}" var="cfd">
                    <tr>
                        <td>${cfd.student.studentId}</td>
                        <td>${cfd.student.studentName}</td>
                        <td>${cfd.courseFeedBackQuestion.qcontent}</td>
                        <td>${cfd.foption}</td>
                        <td>${cfd.courseFeedBackQuestion.course.courseId}</td>
                        <td>${cfd.courseFeedBackQuestion.course.courseName}</td>
                        <td>
                            <form>
                                <input type="hidden" name="id" value="${cfd.fid}">
                                <button style="margin-top: -4px;" type="submit" formaction="deleteCFB.do" class="btn btn-danger btn-sm">删除</button>
                            </form>
                        </td>

                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
