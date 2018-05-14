package com.qdu.controller;

import com.qdu.pojo.Student;
import com.qdu.pojo.TeachingProgram;
import com.qdu.pojo.TeachingProgramDetail;
import com.qdu.service.AdminService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "/showIndex.do")
    public String showIndex() {
        return "admin";
    }

    @ResponseBody
    @RequestMapping(value = "/selectTPBySeason.do")
    public  Map<String,Object> selectTPBySeason(Integer annian, String anxueqi) {
    	System.out.println("-------");
    	 Map<String,Object> map = new HashMap<>(); 
    	 map.put("TPList", adminService.selectTPBySeason(annian, anxueqi));

    	 return map;
    }

    @RequestMapping(value = "/selectTPByDay.do")
    public @ResponseBody List<List<Object>> selectTPByDay(int antian) {
    	List<List<Object>> TPList=adminService.selectTPByDay(antian);
        return TPList;
    }

    @RequestMapping(value = "/selectTPByTeacher.do")
    public @ResponseBody List<List<Object>> selectTPByTeacher(String teacherName) {
    	List<List<Object>> TPList=adminService.selectTPByTeacher(teacherName);
        return TPList;
    }

    @RequestMapping(value = "/selectTPByLocation.do")
    public @ResponseBody List<List<Object>> selectTPByLocation(String location) {
    	System.out.println(location);
    	List<List<Object>> TPList=adminService.selectTPByLocation(location);
    	System.out.println(TPList.size());
        return TPList;
    }

    @RequestMapping(value = "/addTP.do")
    public String addTP(TeachingProgramDetail tpd,String teacherID,String courseID,int batchID, ModelMap map) {
    	//字符串只要能传过来就不是空的，什么都没输传过来就是空字符串""而不是null，所以为了安全机制应该验证是否为空
    	adminService.addTP(tpd,teacherID, courseID, batchID);
        return "TP";
    }
    
    @ResponseBody
    @RequestMapping(value = "/editTP.do")
    public Map<String,Object> editTP(String teacherID, String courseID, int batchID,
            int nian, String xueqi, String week, String weekDay, String lessonTime,
            String location, Integer id) {
    	System.out.println(teacherID+courseID);
    	Map<String,Object> map=new HashMap<>();
    	map.put("msg", "成功");
        adminService.editTP(teacherID, courseID, batchID, nian, xueqi, week, weekDay, lessonTime, location, id);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/forEditTP.do")
    public Map<String,Object> forEditTP(Integer id) {
        System.out.println("----"+id);
        Map<String,Object> map = new HashMap<>(); 
        map.put("id", id);
        map.put("tp", adminService.selectTP(id));
        return map;
    }

    @RequestMapping(value = "/forEditStudent.do")
    public String forEditTP(String sid, ModelMap map) {
        map.addAttribute("id", sid);
        map.addAttribute("stu", adminService.selectStudent(sid));
        return "editStudent";
    }

    @RequestMapping(value = "/deleteTP.do")
    public @ResponseBody Map<String, Object> deleteTP(int id) {
    	System.out.println("aaaaa"+id); 
    	Map<String,Object> map = new HashMap<>();
        adminService.deleteTP(id);
        map.put("msg", "成功");
        System.out.println("--------"+id);  
        return map;
    }

    @RequestMapping(value = "/selectStudent.do")
    public String selectStudent(String studentId, ModelMap map) {
        System.out.println("ssssssssss" + adminService.selectStudent(studentId).getStudentGender());
        map.addAttribute("s", adminService.selectStudent(studentId));
        return "selectStudent1";
    }

    @RequestMapping(value = "/addStudent.do")
    public String addStudent(Student stu, ModelMap map) {
        adminService.addStudent(stu);
        return "TP";
    }

    @RequestMapping(value = "/editStudent.do")
    public String editStudent(Student stu, int batchID, ModelMap map) {
    	adminService.editStudent(stu, batchID);
        return "TP";
    }

    @RequestMapping(value = "/deleteStudent.do")
    public String deleteStudent(String sid, ModelMap map) {
        adminService.deleteStudent(sid);
        return "TP";
    }

    @RequestMapping(value = "/selectCFD.do")
    public String selectCFD(int batch, ModelMap map) {
        map.addAttribute("CFDList", adminService.selectCFD(batch));

        return "selectCourseFeedBack";
    }

    @RequestMapping(value = "/deleteCFB.do")
    public String deleteCFB(int id) {
        adminService.deleteCFD(id);

        return "course";
    }

    @RequestMapping(value = "/selectTFD.do")
    public String selectTFD(String teacherId, ModelMap map) {
        map.addAttribute("TFDList", adminService.selectTFD(teacherId));
        return "selectTeacherFeedBack";
    }

    @RequestMapping(value = "/deleteTFB.do")
    public String deleteTFB(int id) {
        adminService.deleteTFD(id);

        return "course";
    }

}
