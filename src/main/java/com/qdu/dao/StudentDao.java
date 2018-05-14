package com.qdu.dao;

import com.qdu.pojo.Course;
import com.qdu.pojo.CourseDetail;
import com.qdu.pojo.CourseFeedBack;
import com.qdu.pojo.CourseFeedBackQuestion;
import com.qdu.pojo.Student;
import com.qdu.pojo.TeacherFeedBack;
import com.qdu.pojo.TeacherFeedBackQuestion;
import com.qdu.pojo.TeachingProgramDetail;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudentDao {

    @Autowired

    private SqlSessionFactory sqlSessionFactory;
    
    public Student findStudent(String sid, String spwd) {
    	String statement = "com.qdu.mapping.StudentMapping.selectStudentByUandP";
    	HashMap<String,Object> map=new HashMap<>();
    	map.put("username", sid);
    	map.put("password",spwd);
        return sqlSessionFactory.openSession().selectOne(statement, map);
    }
    public Student findStudentByRollno(String studentId) {
    	String statement = "com.qdu.mapping.StudentMapping.selectStudentById";
    	return sqlSessionFactory.openSession().selectOne(statement, studentId);
    }
    public Student addStudent(Student student) {
      
        return null;

    }



    public void updateStudent(Student s) {
    	String statement = "com.qdu.mapping.StudentMapping.updateStu";
    	sqlSessionFactory.openSession().insert(statement, s);
    }

    public List getCourseList(String studentId) {
        
        return null;
    }
    public List<TeachingProgramDetail> getCourseDetailList(int tid) {
    	String statement = "com.qdu.mapping.TeachingProgramDetailMapping.getTeachingProgramDetailListByTP";
    	return sqlSessionFactory.openSession().selectList(statement, tid);
    }

    public List getAttendanceList(String studentId, String beginDate, String endDate) {
    	String statement = "com.qdu.mapping.AttendanceMapping.selectAttendanceListByDate";
    	HashMap<String,Object> map=new HashMap<>();
    	map.put("studentId",studentId);
    	map.put("beginDate", beginDate);
    	map.put("endDate", endDate);
    	System.out.println(studentId+beginDate+endDate);
        return sqlSessionFactory.openSession().selectList(statement, map);
    }

    public List<CourseFeedBackQuestion> getCourseFeedBackQuestionList(String courseId) {
    	 String statement = "com.qdu.mapping.CourseFeedBackQuestionMapping.selectQuestionByCid";
    	 return sqlSessionFactory.openSession().selectList(statement, courseId);
    }
    public List<TeacherFeedBackQuestion> getTeacherFeedBackQuestionList(String teacherId) {
     String statement = "com.qdu.mapping.TeacherFeedBackQuestionMapping.selectQuestionByTid";
   	 return sqlSessionFactory.openSession().selectList(statement, teacherId);
    }
    public void insertCFeedBack(int qid,int choice,String studentId) {
    	String statement = "com.qdu.mapping.CourseFeedBackMapping.insertCFB";
    	Map<String,Object> map=new HashMap<>();
    	map.put("qid", qid);
    	map.put("choice", choice);
    	map.put("studentId", studentId);
    	sqlSessionFactory.openSession().insert(statement,map);
    }

    public List getTeacherFeedBackList() {
       
        return null;
    }

    public void insertTFeedBack(int qid,int choice,String studentId) {
    	String statement = "com.qdu.mapping.TeacherFeedBackMapping.insertTFB";
    	Map<String,Object> map=new HashMap<>();
    	map.put("qid", qid);
    	map.put("choice", choice);
    	map.put("studentId", studentId);
    	sqlSessionFactory.openSession().insert(statement,map);
    }
}
