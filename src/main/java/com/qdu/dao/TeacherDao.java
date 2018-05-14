
package com.qdu.dao;

import com.qdu.pojo.Attendance;
import com.qdu.pojo.Batch;
import com.qdu.pojo.Course;
import com.qdu.pojo.Student;
import com.qdu.pojo.Teacher;
import com.qdu.pojo.TeachingProgram;
import com.qdu.pojo.TeachingProgramDetail;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TeacherDao {
    
    @Autowired
    private SqlSessionFactory sqlSessionFactory;
    
    public Teacher findTeacher(String sid, String spwd) {
    	String statement = "com.qdu.mapping.TeacherMapping.selectTeacherByUandP";
    	HashMap<String,Object> map=new HashMap<>();
    	map.put("username", sid);
    	map.put("password",spwd);
        return sqlSessionFactory.openSession().selectOne(statement, map);
    }
    
    public void insert(plan newplan){
       
    }
    
    public void update(plan updatedplan){
        
    }
    public plan getplan(String courseNo){
      
        return null;
    }
    
    public List getplanList(){
       
        return null;
    }
    
    public List<Batch> getBatchList(String teacherId){
    	String statement = "com.qdu.mapping.BatchMapping.selectBatchByTId";
    	return sqlSessionFactory.openSession().selectList(statement, teacherId);
    }
    
    public List<Course> getCourseList(String teacherId){
    	String statement = "com.qdu.mapping.CourseMapping.selectCourseByTId";
    	return sqlSessionFactory.openSession().selectList(statement, teacherId);
    }
    
    public List<TeachingProgram> getTPListByBatch(int cid,String teacherId){
    	String statement = "com.qdu.mapping.TeachingProgramMapping.selectTPByBandT";
    	Map<String,Object> map = new HashMap<>();
    	map.put("cid", cid);
    	map.put("teacherId", teacherId);
    	return sqlSessionFactory.openSession().selectList(statement, map);
    }
    
     public List<TeachingProgram> getTPListByCourse(String cid,String teacherId){
    	String statement = "com.qdu.mapping.TeachingProgramMapping.selectTPByCandT";
     	Map<String,Object> map = new HashMap<>();
     	map.put("cid", cid);
     	map.put("teacherId", teacherId);
     	return sqlSessionFactory.openSession().selectList(statement, map);
    }
     
    
     
      public List<Attendance> getAttendance(int batch,String beginDate,String endDate){
    	String statement = "com.qdu.mapping.AttendanceMapping.selectAttendanceByBandD";
       	Map<String,Object> map = new HashMap<>();
       	map.put("batch", batch);
       	map.put("beginDate", beginDate);
       	map.put("endDate", endDate);
       	return sqlSessionFactory.openSession().selectList(statement, map);
    }
      
      
    public List<Attendance> getAttendanceByStudent(String rollno){
    	String statement = "com.qdu.mapping.AttendanceMapping.selectAttendanceByStu";
    	return sqlSessionFactory.openSession().selectList(statement, rollno);
        
    }
    
    public List<Map<String,Object>> getTop20(){
    	String statement = "com.qdu.mapping.AttendanceMapping.selectAttendanceTOP20";
    	return sqlSessionFactory.openSession().selectList(statement); 
    }

    private static class plan {

        public plan() {
        }
    }
}
