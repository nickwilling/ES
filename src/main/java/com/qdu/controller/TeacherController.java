package com.qdu.controller;

import com.qdu.pojo.Teacher;
import com.qdu.service.TeacherService;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/teacher")
public class TeacherController {
    @Autowired
    private TeacherService teacherService;
    
    
   
    @RequestMapping(value = "/showIndex.do")
    public String showIndex(String username,String password,ModelMap map,HttpSession session){
    	Teacher teacher= teacherService.findTeacher(username, password);
        session.setAttribute("teacher", teacher);
        map.addAttribute("teacher", teacher);
        return "Teacher";
    }
    

            
    @RequestMapping(value = "/checkBatch.do")
    public String checkBatch(HttpSession session,ModelMap map){
    	Teacher t=(Teacher)session.getAttribute("teacher");
        map.addAttribute("batchList", teacherService.getBatchList(t.getTeacherId()));
        return "batch";
    }
    
    @RequestMapping(value = "/showTPByBatch.do")
    public String showTeachingProgramOfBatch(int cid,String cname,HttpSession session,ModelMap map){
    	Teacher t=(Teacher)session.getAttribute("teacher");
        map.addAttribute("TPList", teacherService.getTPListByBatch(cid,t.getTeacherId()));
        map.addAttribute("name",cname);
        return "result";
    }
    
    @RequestMapping(value = "/checkCourse.do")
    public String checkCourse(HttpSession session,ModelMap map){
    	Teacher t=(Teacher)session.getAttribute("teacher");
        map.addAttribute("courseList", teacherService.getCourseList(t.getTeacherId()));   
        return "course";
    }
    
    @RequestMapping(value = "/showTPByCourse.do")
    public String showTeachingProgramByCourse(HttpSession session,String cid,ModelMap map){
    	Teacher t=(Teacher)session.getAttribute("teacher");
        map.addAttribute("TPList", teacherService.getTPListByCourse(cid,t.getTeacherId()));
        return "result";
    }

    @RequestMapping(value = "/manageAttendance.do")
    public String manageAttendance(){
        return "manageAttendance";
    }
    @RequestMapping(value = "/showAttendace.do")
    public String showAttendance(int batch,String beginDate,String endDate,ModelMap map){     
        map.addAttribute("aList",teacherService.getAttendance(batch,beginDate,endDate));
        return "manageAttendance";
    }
    
    
    @RequestMapping(value = "/manageAttendanceByStudent.do")
    public String manageAttendanceByStudent(){
        return "manageAttendanceByStudent";
    }
    
    @RequestMapping(value = "/showAttendaceByStudent.do")
    public String showAttendanceByStudent(String rollno,ModelMap map){
        map.addAttribute("aList",teacherService.getAttendanceByStudent(rollno));
        return "manageAttendanceByStudent";
    }
    
    @RequestMapping(value = "/showTop20.do")
    public String showTop(ModelMap map){
        map.addAttribute("top20",teacherService.getTop20());
        return "top20";
    }
    
}
