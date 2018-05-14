<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>考试结果</title>
        <link rel="stylesheet" href="../css/style.css" >
    </head>
    <body>
          <h2>${name}班教学计划</h2>
          <table>
                <tr>
                    <th>课程号</th>
                    <th>课程名称</th>
                    <th>任课教师</th>
                    <th>学分</th>
                    <th>考核方式</th>
                    <th>上课底时间、地点</th>                    
                </tr>
                <c:forEach items="${TPList}" var="tp" >
                    <tr>
                        <td>${tp.course.courseId}</td>
                        <td>${tp.course.courseName}</td>
                        <td>${tp.course.teacher.teacherName}</td>
                        <td>${tp.course.coursecredit}</td>
                        <td>${tp.course.courseExamMethod}</td>
                        <td>
                            <c:forEach items="${tp.teachingProgramDetails}" var="tpd">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                ${tpd.tpdweek}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                ${tpd.tpdweekDay}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                ${tpd.tpdlessonTime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                ${tpd.tpdlocation}
                                <br>
                            </c:forEach>
                            
                        </td>               
                    </tr>
                </c:forEach>
            </table>
</html>
