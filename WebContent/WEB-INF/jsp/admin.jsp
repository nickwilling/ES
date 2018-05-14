<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Facelet Title</title>
        <link rel="stylesheet" 
              href="../bootstrap-3.3.5-dist/css/bootstrap.min.css" >
        <link href="../CSS/style.css" rel="stylesheet">
        <script src="../bootstrap-3.3.5-dist/js/jquery-2.2.4.min.js"></script>
        <script src="../bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
        <script type="text/javascript">
        function deleteTP(obj) {
        	$.ajax({ 
                data: {
                        "id":obj.id
                    },
                contentType: "application/json; charset=utf-8",
                type:"GET",  
                dataType: 'json', 
                async: true,
                url:"<%=request.getContextPath()%>/admin/deleteTP.do",  
                error:function(data){  
                    alert("出错了！！:");  
                },  
                success:function(data){  
                	alert("success！！:");
      
                	document.getElementById("tp"+obj.name).style.display = "none";
                       
                }
                });  
   		  
   		}
        function selectTPBySeason(){ 
        	var annian = document.getElementById("annian").value;
        	var anxueqi = document.getElementById("anxueqi").value;
            $.ajax({ 
            data: {
                    "annian":annian,
                    "anxueqi":anxueqi
                },
            contentType: "application/json; charset=utf-8",
            type:"GET",  
            dataType: 'json', 
            async: true,
            url:"<%=request.getContextPath()%>/admin/selectTPBySeason.do",  
            error:function(data){  
                console.log(data);  
            },  
            success:function(data){  
            	
            	alert("success！！:");
            	$("tr[class!='title']").remove();
            	$.each(data.TPList, function (index, element) { 
            		//处理后台传过来map的方式
            		//用jquery的each函数遍历获取的数据中的每个元素
                    //index - 当前元素的index，element -当前元素
                    $("#table").append("<tr id='tp"+index+"'>"+
                    	   "<td>" + element[0] + "</td>"+//必须这么做，把要用的值换一个方式存储，不要直接传过来，这样JSON解析会出错
                   		   "<td>" + element[1]+ "</td>"+
                   		   "<td>" + element[2] + "</td>"+
                   		   "<td>" + element[3] + "</td>"+
                   		   "<td>" + element[4] + "</td>"+
                   		   "<td>" + element[5] + "</td>"+
                   		   "<td>" + element[6] + "</td>"+
                   		   "<td>" + element[7] + "</td>"+
                   		   "<td>" + element[8] + "</td>"+
                   		   "<td>" + element[9] + "</td>"+
                 		   "<td>"+
                                "<button id="+element[9]+" style='margin-top: -4px;'  class='btn btn-success btn-sm' onclick='artle(this.id)'>修改</button>"+
                                "<button id="+element[9]+" name="+index+" style='margin-top: -4px;' onclick='deleteTP(this)' class='btn btn-danger btn-sm'>删除</button>"+
                        "</td>"+
                 		   
                 		   "</tr>");
                   
                    //选择id为table的那个表格，调用jquery的append函数添加每一行数据到表格中
                    //因为一个元素表示一个Student对象，包含两个属性rollno和name，所以可直接两列显示
                });
                  
            }
            });  
        }
        
        function selectTPByDay(){ 
        	var antian = document.getElementById("antian").value;
            $.ajax({ 
            data: {
                    "antian":antian
                },
            contentType: "application/json; charset=utf-8",
            type:"GET",  
            dataType: 'json', 
            async: true,
            url:"<%=request.getContextPath()%>/admin/selectTPByDay.do",  
            error:function(data){  
                alert("出错了！！:");  
            },  
            success:function(data){  
            	alert("success！！:");
            	$("tr[class!='title']").remove();
                   $.each(data, function (index, element) { //用jquery的each函数遍历获取的数据中的每个元素
                       //index - 当前元素的index，element -当前元素
                       $("#table").append("<tr id='tp"+index+"'>"+
                    		   "<td>" + element[0] + "</td>"+
                    		   "<td>" + element[1]+ "</td>"+
                    		   "<td>" + element[2] + "</td>"+
                    		   "<td>" + element[3] + "</td>"+
                    		   "<td>" + element[4] + "</td>"+
                    		   "<td>" + element[5] + "</td>"+
                    		   "<td>" + element[6] + "</td>"+
                    		   "<td>" + element[7] + "</td>"+
                    		   "<td>" + element[8] + "</td>"+
                    		   "<td>" + element[9] + "</td>"+
                    		   "<td>"+
                                   "<button  style='margin-top: -4px;' formaction='forEditTP'  class='btn btn-success btn-sm'>修改</button>"+
                                   "<button id="+element[9]+" name="+index+" style='margin-top: -4px;' onclick='deleteTP(this)' class='btn btn-danger btn-sm'>删除</button>"+
                           "</td>"+
                    		   
                    		   "</tr>");
                      
                       //选择id为table的那个表格，调用jquery的append函数添加每一行数据到表格中
                       //因为一个元素表示一个Student对象，包含两个属性rollno和name，所以可直接两列显示
                   });
            }
            });  
        }  
        
        function selectTPByTeacher(){ 
        	var teacherName = document.getElementById("teacherName").value;
            $.ajax({ 
            data: {
                    "teacherName":teacherName
                },
            contentType: "application/json; charset=utf-8",
            type:"GET",  
            dataType: 'json', 
            async: true,
            url:"<%=request.getContextPath()%>/admin/selectTPByTeacher.do",  
            error:function(data){  
                alert("出错了！！:");  
            },  
            success:function(data){  
            	alert("success！！:");
            	$("tr[class!='title']").remove();
                   $.each(data, function (index, element) { //用jquery的each函数遍历获取的数据中的每个元素
                       //index - 当前元素的index，element -当前元素
                       $("#table").append("<tr id='tp"+index+"'>"+
                    		   "<td>" + element[0] + "</td>"+
                    		   "<td>" + element[1]+ "</td>"+
                    		   "<td>" + element[2] + "</td>"+
                    		   "<td>" + element[3] + "</td>"+
                    		   "<td>" + element[4] + "</td>"+
                    		   "<td>" + element[5] + "</td>"+
                    		   "<td>" + element[6] + "</td>"+
                    		   "<td>" + element[7] + "</td>"+
                    		   "<td>" + element[8] + "</td>"+
                    		   "<td>" + element[9] + "</td>"+
                    		   "<td>"+
                                   "<button  style='margin-top: -4px;' formaction='forEditTP'  class='btn btn-success btn-sm'>修改</button>"+
                                   "<button id="+element[9]+" name="+index+" style='margin-top: -4px;' onclick='deleteTP(this)' class='btn btn-danger btn-sm'>删除</button>"+
                           "</td>"+
                    		   
                    		   "</tr>");
                      
                       //选择id为table的那个表格，调用jquery的append函数添加每一行数据到表格中
                       //因为一个元素表示一个Student对象，包含两个属性rollno和name，所以可直接两列显示
                   });
            }
            });  
        }
        
        function selectTPByLocation(){ 
        	
        	var location = document.getElementById("location").value;
        	alert(location);
            $.ajax({ 
            data: {
                    "location":location
                },
            contentType: "application/json; charset=utf-8",
            type:"GET",  
            dataType: 'json', 
            async: true,
            url:"<%=request.getContextPath()%>/admin/selectTPByLocation.do",  
            error:function(data){  
                alert("出错了！！:");  
            },  
            success:function(data){  
            	alert("success！！:");
            	$("tr[class!='title']").remove();
                   $.each(data, function (index, element) { //用jquery的each函数遍历获取的数据中的每个元素
                       //index - 当前元素的index，element -当前元素
                       $("#table").append("<tr id='tp"+index+"'>"+
                    		   "<td>" + element[0] + "</td>"+
                    		   "<td>" + element[1]+ "</td>"+
                    		   "<td>" + element[2] + "</td>"+
                    		   "<td>" + element[3] + "</td>"+
                    		   "<td>" + element[4] + "</td>"+
                    		   "<td>" + element[5] + "</td>"+
                    		   "<td>" + element[6] + "</td>"+
                    		   "<td>" + element[7] + "</td>"+
                    		   "<td>" + element[8] + "</td>"+
                    		   "<td>" + element[9] + "</td>"+
                    		   "<td>"+
                                   "<button  style='margin-top: -4px;' formaction='forEditTP'  class='btn btn-success btn-sm'>修改</button>"+
                                   "<button id="+element[9]+" name="+index+" style='margin-top: -4px;' onclick='deleteTP(this)' class='btn btn-danger btn-sm'>删除</button>"+
                           "</td>"+
                    		   
                    		   "</tr>");
                      
                       //选择id为table的那个表格，调用jquery的append函数添加每一行数据到表格中
                       //因为一个元素表示一个Student对象，包含两个属性rollno和name，所以可直接两列显示
                   });
            }
            });  
        }
       
        
        
		</script>
    </head>
    <body>
    <canvas id="demo-canvas" style="position: absolute"></canvas>
        <div class="header">
            <a href="#" style="margin-left: 30px;">QingDao University</a>
            <a href="#" style="margin-left: 100px;"><span class="glyphicon glyphicon-home"></span>&nbsp;Home</a>
            <a href="#" style="margin-left: 800px;" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<a href="login.jsp">exit</a></a>
        </div>
        <br/><br/><br/>
        <span class="admin">Welcome,admin&nbsp;&nbsp;|&nbsp;&nbsp;<a href="login.jsp">exit</a></span>
        <div class="teachWrap">
            <ul class="li nav nav-pills">
                <li class="active"><a href="#">Home</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        教学计划管理 <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">增加教学计划</a></li>
                        <li><a href="#">查询教学计划</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        学生管理 <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">添加学生</a></li>
                        <li><a href="#">查询学生</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        反馈管理 <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">查询课程反馈</a></li> 
                        <li><a href="#">查询教师反馈</a></li>
                    </ul>
                </li>
            </ul>
            <hr/>
            <div class="div">
                <div class="div0"></div>
                <div class="div1"></div>
                <div class="div2">
                    <form>
                        <span>教师ID:</span>
                        <input name="teacherID" class="inputID" type="text" placeholder="&nbsp;&nbsp;TeacherID"/><br/><br/>
                        <span>课程ID:</span>
                        <input name="courseID" class="inputID" type="text" placeholder="&nbsp;&nbsp;CourseID"/><br/><br/>
                        <span>班级ID:</span>
                        <input name="batchID" class="inputID" type="text" placeholder="&nbsp;&nbsp;BatchID"/><br/><br/>
                        <span>学&nbsp;&nbsp;&nbsp;&nbsp;年:</span>
                        <select name="tpdyear" style="width: 10%;display: inline-block" class="form-control">
                            <option value="2010">2010</option>
                            <option value="2011">2011</option>
                            <option value="2012">2012</option>
                            <option value="2013">2013</option>
                            <option value="2014">2014</option>
                        </select>
                        <br/><br/>
                        <span>学&nbsp;&nbsp;&nbsp;&nbsp;期:</span>
                        <select name="tpdseason" style="width: 10%;display: inline-block" class="form-control">
                            <option value="spring">春季</option>
                            <option value="autumn">秋季</option>
                        </select>
                        <br/><br/>
                        <span>Week:</span>&nbsp;&nbsp;
                        <input name="tpdweek" class="inputID" type="text" placeholder="&nbsp;&nbsp;Week:1-16"/><br/><br/>
                        <span>WeekDay:</span>
                        <select name="tpdweekDay" style="width: 10%;display: inline-block" class="form-control">
                            <option value="yi">星期一</option>
                            <option value="er">星期二</option>
                            <option value="san">星期三</option>
                            <option value="si">星期四</option>
                            <option value="wu">星期五</option>
                        </select>
                        <br/><br/>
                        <span>LessonTime:</span>
                        <select name="tpdlessonTime" style="width: 10%;display: inline-block" class="form-control">
                            <option value="1-2">1-2</option>
                            <option value="3-4">3-4</option>
                            <option value="5-6">5-6</option>
                            <option value="7-8">7-8</option>
                        </select>
                        <br/><br/>
                        <span>地&nbsp;&nbsp;&nbsp;&nbsp;点:</span>
                        <input name="tpdlocation" class="inputID" type="text" placeholder="&nbsp;&nbsp;Location "/><br/><br/>
                        <button type="submit" formaction="addTP.do" class="btn btn-primary addbtn">确认添加</button>
                    </form>
                </div>
                <div class="div3">
                    
                        <select name="chaxun" id='s' style="width: 20%;display: inline-block;margin-left: 60px;" class="manage form-control">
                            <option value='season'>按学期查询</option>
                            <option value='day'>按天查询</option>
                            <option value='teacher'>按讲师查询</option>
                            <option value='location'>按机房查询</option>
                        </select>
                        <span class="span">
                            <span id="select0" style='display: block'>
                                <select id="annian" name="annian" style="width: 21%;margin-left: 360px;margin-top: -34px;" class="a manage form-control">
                                    <option value="2011">2011</option>
                                    <option value="2012">2012</option>
                                    <option value="2013">2013</option>
                                </select>
                                <select id="anxueqi" name="anxueqi" style="width: 14%;margin-left: 440px;margin-top: -34px;" class="a manage form-control">
                                    <option value="spring">春季</option>
                                    <option value="autumn">秋季</option>
                                </select>
                                <button  onclick="selectTPBySeason()" style="margin-left: 700px;margin-top: -35px;" class="btn btn-primary addbtn">查询</button>
                            </span>
                            <span id="select1">
                                <select id="antian" name="antian" style="width: 21%;margin-left: 360px;margin-top: -34px;" class="b manage form-control">
                                    <option value="1">星期一</option>
                                    <option value="2">星期二</option>
                                    <option value="3">星期三</option>
                                    <option value="4">星期四</option>
                                    <option value="5">星期五</option>
                                </select>
                                <button onclick="selectTPByDay()" style="margin-left: 660px;margin-top: -35px;" class="btn btn-primary addbtn">查询</button>
                            </span>
                            <span id="select2">
                                <input id="teacherName" class="c inputName"  name="teacherName" type="text" placeholder="&nbsp;&nbsp;Teacher Name"/>      
                                <button onclick="selectTPByTeacher()" style="margin-left: 660px;margin-top: -35px;" class="btn btn-primary addbtn">查询</button>
                            </span>
                            <span id="select3">
                                <input id="location" name="location" class="d inputName" name="location" type="text" placeholder="&nbsp;&nbsp;Location"/>      
                                <button onclick="selectTPByLocation()" style="margin-left: 660px;margin-top: -35px;"  class="btn btn-primary addbtn">查询</button>
                            </span>
                        </span>
                    
                          <table id="table" class="table table-striped">
            <thead>
                <tr class="title">
                    <th>Batch</th>
                    <th>TeacherID</th>
                    <th>CourseName</th>
                    <th>Year</th>
                    <th>Season</th>
                    <th>Week</th>
                    <th>WeekDay</th>
                    <th>LessonTime</th>
                    <th>Location</th>
                    <th>ID</th>
                    <th>Operate</th>
                </tr>
            </thead>
        </table>
                </div>
                <div class="div4"></div>
                <div class="div5">
                    <form>
                        <span>学生ID:&nbsp;&nbsp;</span>
                        <input name="studentId" class="inputID" type="text" placeholder="&nbsp;&nbsp;StudentID"/><br/><br/>
                        <span>学生姓名:</span>
                        <input name="studentName" class="inputID" type="text" placeholder="&nbsp;&nbsp;StudentName"/><br/><br/>
                        <span>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</span>
                        <label>
                            <input type="radio" name="studentGender" id="optionsRadios1" value="男" checked>男
                        </label>
                        <label style="margin-left: 20px;">
                            <input type="radio" name="studentGender" id="optionsRadios2" value="女">女
                        </label>
                        <br/><br/>
                        <span>入学年份:</span>
                        <select name="studentGrade" style="width: 10%;display: inline-block" class="form-control">
                            <option value="2011">2011</option>
                            <option value="2012">2012</option>
                            <option value="2013">2013</option>
                            <option value="2014">2014</option>
                        </select>
                        <br/><br/>
                        <span>班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级:</span>
                        <input name="batch.cid" class="inputID" type="text" placeholder="&nbsp;&nbsp;Batch"/><br/><br/>
                        <button type="submit" formaction="addStudent.do" class="btn btn-primary addbtn">确认添加</button>
                    </form>
                </div>
                <div class="div6">
                    <form>
                        <input name="studentId" class="inputName" type="text" placeholder="&nbsp;&nbsp;Student Name"/>      
                        <button type="submit" formaction="selectStudent.do" style="margin-left: 100px;margin-top: -10px;" class="btn btn-primary addbtn">查询</button>
                    </form>
                </div>
                <div class="div7"></div>

                <div class="div8">
                    <form>
                        <input name="batch" class="inputName" type="text" placeholder="&nbsp;&nbsp;Batch"/> 
                        <span class="span">
                            <span id="sel0" style="display: block;margin-top: -34px;margin-left: 300px;">

                                <button type="submit"  formaction="selectCFD.do" style="margin-left: 100px;margin-top: -8px;" class="btn btn-primary addbtn">查询</button>
                            </span>
                        </span>
                    </form>
                    <br/><br/>
                </div>

                <div class="div9">
                    <form>
                        <input name="teacherId" class="inputName" type="text" placeholder="&nbsp;&nbsp;TeacherFeedBack ID"/>      
                        <button type="submit" formaction="selectTFD.do" style="margin-left: 100px;margin-top: -8px;" class="btn btn-primary addbtn">查询</button>
                    </form>
                    <br/><br/>
                </div> 
                
                  <div class="div10">
                    <span>教师ID:</span>
            <input id="a1" name="teacherID"  class="inputID" type="text" placeholder="&nbsp;&nbsp;TeacherID"/><br/><br/>
            <span>课程ID:</span>
            <input id="a2" name="courseID"  class="inputID" type="text" placeholder="&nbsp;&nbsp;CourseID"/><br/><br/>
            <span>班级ID:</span>
            <input id="a3" name="batchID"  class="inputID" type="text" placeholder="&nbsp;&nbsp;BatchID"/><br/><br/>
            <span>学&nbsp;&nbsp;&nbsp;&nbsp;年:</span>
            <select id="a4" name="nian" style="width: 10%;display: inline-block" class="form-control">
                <option value="2010">2010</option>
                <option value="2011">2011</option>
                <option value="2012">2012</option>
                <option value="2013">2013</option>
                <option value="2014">2014</option>
            </select>
            <br/><br/>
            <span>学&nbsp;&nbsp;&nbsp;&nbsp;期:</span>
            <select id="a5" name="xueqi" style="width: 10%;display: inline-block" class="form-control">
                <option value="spring">春季</option>
                <option value="autumn">秋季</option>
            </select>
            <br/><br/>
            <span>Week:</span>&nbsp;&nbsp;
            <input id="a6" name="week"  class="inputID" type="text" placeholder="&nbsp;&nbsp;Week:1-16"/><br/><br/>
            <span>WeekDay:</span>
            <select id="a7" name="weekDay" style="width: 10%;display: inline-block" class="form-control">
                <option value="yi">星期一</option>
                <option value="er">星期二</option>
                <option value="san">星期三</option>
                <option value="si">星期四</option>
                <option value="wu">星期五</option>
            </select>
            <br/><br/>
            <span>LessonTime:</span>
            <select id="a8" name="lessonTime" style="width: 10%;display: inline-block" class="form-control">
                <option value="1-2">1-2</option>
                <option value="3-4">3-4</option>
                <option value="5-6">5-6</option>
                <option value="7-8">7-8</option>
            </select>
            <br/><br/>
            <span>地&nbsp;&nbsp;&nbsp;&nbsp;点:</span>
            <input id="a9" name="location" class="inputID" type="text" placeholder="&nbsp;&nbsp;Location "/><br/><br/>
            <input id="a10" type="hidden" name="id" >
            <button  onclick="editTP()" class="btn btn-primary addbtn">确认修改</button>
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
    </body>
</html>
<script>

    $(document).ready(function () {
        $(".nav li a").click(function () {
            var order = $(".nav li a").index(this);//获取点击之后返回当前a标签index的值
            $(".div" + order).show().siblings("div").hide();//显示class中con加上返回值所对应的DIV
        });
    })
    var map = {"season": "select0", "day": "select1", "teacher": "select2", "location": "select3"};
    $(".b").attr("disabled", true);
    $(".c").attr("disabled", true);
    $(".d").attr("disabled", true);
    $("#s").bind("change", function () {
        var divId = map[this.value];
        $("#" + divId).show().siblings().hide();
        if (divId == 'select0') {
            $(".b").attr("disabled", true);
            $(".a").attr("disabled", false);
            $(".c").attr("disabled", true);
            $(".d").attr("disabled", true);
        } else if (divId == 'select1') {

            $(".b").attr("disabled", false);
            $(".a").attr("disabled", true);
            $(".c").attr("disabled", true);
            $(".d").attr("disabled", true);
        } else if (divId == 'select2') {
            $(".c").attr("disabled", false);
            $(".a").attr("disabled", true);
            $(".b").attr("disabled", true);
            $(".d").attr("disabled", true);
        } else if (divId == 'select3') {
            $(".d").attr("disabled", false);
            $(".a").attr("disabled", true);
            $(".b").attr("disabled", true);
            $(".c").attr("disabled", true);
        } else {
            $(".b").attr("disabled", true);
        }
    });
    function editTeaching() {
        $(".div2").show().siblings(".div3").hide();
    }
    function editStudent() {
        $(".div5").show().siblings(".div6").hide();
    }
    function artle(id){
    	
    	$.ajax({ 
            data: {
                    "id":id
                },
            contentType: "application/json; charset=utf-8",
            type:"GET",  
            dataType: 'json', 
            async: true,
            url:"<%=request.getContextPath()%>/admin/forEditTP.do",  
            error:function(data){  
                alert("出错了！！:");  
            },  
            success:function(data){  
            	alert("success！！:");
            	document.getElementById("a1").value=data.tp[0];
            	document.getElementById("a2").value=data.tp[1];
            	document.getElementById("a3").value=data.tp[2];
            	document.getElementById("a6").value=data.tp[3];
            	document.getElementById("a9").value=data.tp[4];
            	document.getElementById("a10").value=data.tp[5];
            	
                   
            }
            });  
    	$(".div10").show().siblings(".div3").hide();
    }
    
    function editTP(){
    	alert("ssssssss");
    	var a1= document.getElementById("a1").value;
    	var a2= document.getElementById("a2").value;
    	var a3= document.getElementById("a3").value;
    	var a4= document.getElementById("a4").value;
    	var a5= document.getElementById("a5").value;
    	var a6= document.getElementById("a6").value;
    	var a7= document.getElementById("a7").value;
    	var a8= document.getElementById("a8").value;
    	var a9= document.getElementById("a9").value;
    	var a9= document.getElementById("a9").value;
    	var a10= document.getElementById("a10").value;
    	alert(a1+"-"+a2+"-"+a3+"-"+a4+"-"+a5+"-"+a6+"-"+a7+"-"+a8+"-"+a9+"-"+a10);
    	$.ajax({ 
            data: {
                    "teacherID":a1,
                    "courseID": a2,
                    "batchID":  a3,
                    "nian":     a4,
                    "xueqi":    a5,
                    "week":     a6,
                    "weekDay":  a7,
                    "lessonTime":a8,
                    "location": a9,
                    "id":       a10
                },
            contentType: "application/json; charset=utf-8",
            type:"GET",  
            dataType: 'json', 
            async: true,
            url:"<%=request.getContextPath()%>/admin/editTP.do",  
            error:function(data){  
                alert("出错了！！:");  
            },  
            success:function(data){  
            	alert("success！！:");
            	
            	
                   
            }
            });  
    }
//    function editCourseBack() {
//        $(".div8").show().siblings(".div9").hide();
//    }
//    function editTeacherBack() {
//        $(".div10").show().siblings(".div11").hide();
//    }
    var map1 = {"batch": "sel0", "tea": "sel1"};
    $("#e").bind("change", function () {
        var divId = map1[this.value];
        $("#" + divId).show().siblings().hide();
    });
</script>