package com.qdu.service;

import com.qdu.dao.TeacherDao;
import com.qdu.pojo.Attendance;
import com.qdu.pojo.Batch;
import com.qdu.pojo.Course;
import com.qdu.pojo.Student;
import com.qdu.pojo.Teacher;
import com.qdu.pojo.TeachingProgram;
import com.qdu.pojo.TeachingProgramDetail;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class TeacherService {

    @Autowired
    private TeacherDao teacherDao;
    
    public Teacher findTeacher(String sid, String spwd) {
        return teacherDao.findTeacher(sid, spwd);
    }
    
    public List<Batch> getBatchList(String teacherId){
        return teacherDao.getBatchList(teacherId);
    }
    public List<Course> getCourseList(String teacherId){
        return teacherDao.getCourseList(teacherId);
    }

    public List<TeachingProgram> getTPListByBatch(int cid,String teacherId){
         return teacherDao.getTPListByBatch(cid,teacherId) ;
    }
    
    public List<TeachingProgram> getTPListByCourse(String cid,String teacherId){
         return teacherDao.getTPListByCourse(cid,teacherId) ;
    }
    
    public List<Attendance> getAttendance(int batch,String beginDate,String endDate){       
         return teacherDao.getAttendance(batch,beginDate,endDate) ;
    }

    public List<Attendance> getAttendanceByStudent(String rollno){
         
         return teacherDao.getAttendanceByStudent(rollno);
    }
    
    public List<Map<String,Object>> getTop20(){
         
         return teacherDao.getTop20();
    }
}
