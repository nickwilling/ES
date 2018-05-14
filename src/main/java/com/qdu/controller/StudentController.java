
package com.qdu.controller;

import com.qdu.pojo.Attendance;
import com.qdu.pojo.Batch;
import com.qdu.pojo.CourseFeedBackQuestion;
import com.qdu.pojo.Student;
import com.qdu.pojo.TeacherFeedBackQuestion;
import com.qdu.service.StudentService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value ="/student")
public class StudentController {
    
    
    @Autowired
    private StudentService studentService;
     @RequestMapping(value="/login")
    public String login(){        
        return "login";
    } 
    @RequestMapping(value="/getStu")
    public String GetStu(String studentId,ModelMap map){
    studentService.getStudentList();
     map.addAttribute("stuList",studentService.getStudentList());
    return "Student";
    }
    
    @RequestMapping(value="/welcome.do")
    public String welcome(String username,String password,ModelMap map,HttpSession session){
        Student student = studentService.findStudent(username, password);
        session.setAttribute("student", student);

        map.addAttribute("student", student);
        return "Student"; 
    }  
    @RequestMapping(value="/forregister")
    public String forzhuce(){ 
        return "register"; 
    }
         @RequestMapping(value="/register")
    public String zhuce(String studentId,String studentName,String studentPwd,Integer studentGrade,Integer batch,String studentGender,ModelMap map){ 
//        studentService.addStudent(student);
//             System.out.println(student);
        map.addAttribute("sList", studentService.getStudentList());
        return "login"; 
    } 
    //
     @RequestMapping(value="/foredit.do")
    public String foredit(String rollno,ModelMap map,HttpSession session){ 
        Student s = (Student)session.getAttribute("student");
        
        if(s==null){
            System.out.println("空");
        }else{
            System.out.println(s.getStudentName());
        }
        map.addAttribute("student",s); 
        return "Alter"; 
    }
     @RequestMapping(value="/editStu.do")
    public String edit(Student stu,ModelMap map){ 
    	studentService.updateStudent(stu);
        map.addAttribute("sList",stu ); 
        
        return "Student";
    } 
    //
        @RequestMapping(value = "/toattendance")
    public String ToAttendance(String studentId,String beginDate,String endDate,ModelMap map){
     return "Attendance";
    }
    @RequestMapping(value = "/attendance.do")
    public String showAttendance(String id,String beginDate,String endDate,ModelMap map,HttpSession session){
        //在SpringMVC 中使用session，就用HttpSession
        Student s=(Student)session.getAttribute("student");
        map.addAttribute("attenList",studentService.getAttendanceList(s.getStudentId(), beginDate, endDate));
        List<Attendance> list=studentService.getAttendanceList(s.getStudentId(), beginDate, endDate);
        System.out.println(list.size());
        System.out.println(list.get(0).getAid());
        return "Attendance";
    }
    //
    @RequestMapping(value = "/showcourse.do")
    public String showCourse(HttpSession session,ModelMap map){
    Student s=(Student)session.getAttribute("student");
    map.addAttribute("courList",studentService.getCourseList(s.getStudentId()));
    return "Courses";
    }
    @RequestMapping(value = "/showcoursedetail.do")
    public String showCoursedetail(int TID,ModelMap map){ 
    map.addAttribute("courdList",studentService.getCourseDetailList(TID));
    return "CourseDetai";
    }
    //
    @RequestMapping(value = "/forcFeedBack.do")
    public String ForCFeedBack(){
   
   return "CourseID";
    }
    @RequestMapping(value = "/forccFeedBack.do")
    public String ForCCFeedBack(String courseId,ModelMap map){
        System.out.println("-----------------"+courseId);    
        map.addAttribute("cquestionList",studentService.getCourseFeedBackQuestionList(courseId));
        map.addAttribute("courseId",courseId);
   return "CourseID";
    }
    @RequestMapping(value = "/addcFeedBack.do")
    public String addCourseFeedBack(HttpServletRequest req,HttpSession session,String courseId,ModelMap map){
        List<CourseFeedBackQuestion> list=studentService.getCourseFeedBackQuestionList(courseId);
        Student s=(Student)session.getAttribute("student");
        for(int i=0;i<list.size();i++){
            int qid;
            int choice;
            CourseFeedBackQuestion cq=list.get(i); //获取当前问题
            qid=cq.getQid();
            choice=Integer.parseInt(req.getParameter("cq"+qid));//获取用户当前问题的选择
            studentService.insertCourseFeedBack(qid, choice, s.getStudentId());
        }
              
         return "CourseID";
    }

    @RequestMapping(value = "/forttFeedBack.do")
    public String ForTTFeedBack(){
   
   return "TeacherID";
    }
    
    @RequestMapping(value = "/fortFeedBack.do")
    public String ForTFeedBack(String teacherId,ModelMap map){
    map.addAttribute("tquestionList",studentService.getTeacherFeedBackQuestionlist(teacherId));
    map.addAttribute("teacherId",teacherId);
    return "TeacherID";
    }
    
   @RequestMapping(value = "/addtFeedBack.do")
  public String addTeacherFeedBack(HttpServletRequest req,HttpSession session,String teacherId,ModelMap map){
        List<TeacherFeedBackQuestion> list=studentService.getTeacherFeedBackQuestionlist(teacherId);
        Student s=(Student)session.getAttribute("student");
        for(int i=0;i<list.size();i++){
            int qid;
            int choice;
            TeacherFeedBackQuestion cq=list.get(i); //获取当前问题
            qid=cq.getQid();
            choice=Integer.parseInt(req.getParameter("cq"+qid));
            studentService.insertTeacherFeedBack(qid, choice, s.getStudentId());
    }
        return "TeacherID";
}

}