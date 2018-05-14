package com.qdu.service;

import com.qdu.dao.AdminDao;
import com.qdu.dao.TestDao;
import com.qdu.pojo.Batch;
import com.qdu.pojo.Student;
import com.qdu.pojo.TeachingProgram;
import com.qdu.pojo.TeachingProgramDetail;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AdminService {

    @Autowired
    private AdminDao adminDao;
    @Autowired
    private TestDao testDao;

    public List<List<Object>> selectTPBySeason(int year, String season) {
        String s = null;
        if (season.equals("spring")) {
            s = "春季";
        } else if (season.equals("autumn")) {
            s = "秋季";
        }
        List<TeachingProgramDetail> list=adminDao.selectTPBySeason(year, s);
        List<List<Object>> TPList=new ArrayList<>();
        List<Object> l;
        for(int i=0;i<list.size();i++) {
        	l=new ArrayList<>();
        	l.add(0, list.get(i).getTeachingProgram().getBatch().getCname());
        	l.add(1, list.get(i).getTeachingProgram().getTeacher().getTeacherId());
        	l.add(2, list.get(i).getTeachingProgram().getCourse().getCourseName());
        	l.add(3, list.get(i).getTpdyear());
        	l.add(4, list.get(i).getTpdseason());
        	l.add(5, list.get(i).getTpdweek());
        	l.add(6, list.get(i).getTpdweekDay());
        	l.add(7, list.get(i).getTpdlessonTime());
        	l.add(8, list.get(i).getTpdlocation());
        	l.add(9, list.get(i).getTpdid());
        	TPList.add(i, l);
        	
        }
        return TPList;
    }
    

    public List<List<Object>> selectTPByDay(int day) {
        String d = null;

        switch (day) {
            case 1:
                d = "星期一";
                break;
            case 2:
                d = "星期二";
                break;
            case 3:
                d = "星期三";
                break;
            case 4:
                d = "星期四";
                break;
            case 5:
                d = "星期五";
                break;
        }
        
        List<TeachingProgramDetail> list=adminDao.selectTPByDay(d);
        List<List<Object>> TPList=new ArrayList<>();
        List<Object> l;
        for(int i=0;i<list.size();i++) {
        	l=new ArrayList<>();
        	l.add(0, list.get(i).getTeachingProgram().getBatch().getCname());
        	l.add(1, list.get(i).getTeachingProgram().getTeacher().getTeacherId());
        	l.add(2, list.get(i).getTeachingProgram().getCourse().getCourseName());
        	l.add(3, list.get(i).getTpdyear());
        	l.add(4, list.get(i).getTpdseason());
        	l.add(5, list.get(i).getTpdweek());
        	l.add(6, list.get(i).getTpdweekDay());
        	l.add(7, list.get(i).getTpdlessonTime());
        	l.add(8, list.get(i).getTpdlocation());
        	l.add(9, list.get(i).getTpdid());
        	TPList.add(i, l);
        	
        }
        
        return TPList;
    }

    public List<List<Object>> selectTPByTeacher(String teacherId) {
    	 List<TeachingProgramDetail> list=adminDao.selectTPByTeacher(teacherId);
         List<List<Object>> TPList=new ArrayList<>();
         List<Object> l;
         for(int i=0;i<list.size();i++) {
         	l=new ArrayList<>();
         	l.add(0, list.get(i).getTeachingProgram().getBatch().getCname());
         	l.add(1, list.get(i).getTeachingProgram().getTeacher().getTeacherId());
         	l.add(2, list.get(i).getTeachingProgram().getCourse().getCourseName());
         	l.add(3, list.get(i).getTpdyear());
         	l.add(4, list.get(i).getTpdseason());
         	l.add(5, list.get(i).getTpdweek());
         	l.add(6, list.get(i).getTpdweekDay());
         	l.add(7, list.get(i).getTpdlessonTime());
         	l.add(8, list.get(i).getTpdlocation());
         	l.add(9, list.get(i).getTpdid());
         	TPList.add(i, l);
         	
         }
         return TPList;
    }

    public List<List<Object>> selectTPByLocation(String location) {
    	 List<TeachingProgramDetail> list=adminDao.selectTPByLocation(location);
         List<List<Object>> TPList=new ArrayList<>();
         List<Object> l;
         for(int i=0;i<list.size();i++) {
         	l=new ArrayList<>();
         	l.add(0, list.get(i).getTeachingProgram().getBatch().getCname());
         	l.add(1, list.get(i).getTeachingProgram().getTeacher().getTeacherId());
         	l.add(2, list.get(i).getTeachingProgram().getCourse().getCourseName());
         	l.add(3, list.get(i).getTpdyear());
         	l.add(4, list.get(i).getTpdseason());
         	l.add(5, list.get(i).getTpdweek());
         	l.add(6, list.get(i).getTpdweekDay());
         	l.add(7, list.get(i).getTpdlessonTime());
         	l.add(8, list.get(i).getTpdlocation());
         	l.add(9, list.get(i).getTpdid());
         	TPList.add(i, l);
         	
         }
         return TPList;
    }

    public List<Object> selectTP(int id) {
    	TeachingProgramDetail tp=adminDao.selectTP(id);
    	List<Object> TPList=new ArrayList<>();
    	TPList.add(tp.getTeachingProgram().getTeacher().getTeacherId());
    	TPList.add(tp.getTeachingProgram().getCourse().getCourseId());
    	TPList.add(tp.getTeachingProgram().getBatch().getCid());
    	TPList.add(tp.getTpdweek());
    	TPList.add(tp.getTpdlocation());
    	TPList.add(tp.getTpdid());
        return TPList;
    }

    public void addTP(TeachingProgramDetail tpd,String teacherID, String courseID, int batchID
            ) {
    	
        String s = null;
        String wwday = null;
        if (tpd.getTpdseason().equals("spring")) {
            s = "春季";
            
        } else {
            s = "秋季";
        }
        

        switch (tpd.getTpdweekDay()) {
            case "yi":
                wwday = "星期一";
                break;
            case "er":
                wwday = "星期二";
                break;
            case "san":
                wwday = "星期三";
                break;
            case "si":
                wwday = "星期四";
                break;
            case "wu":
                wwday = "星期五";
                break;
        }
        tpd.setTpdseason(s);
        tpd.setTpdweekDay(wwday);
        TeachingProgram tp=new TeachingProgram();
        if(adminDao.selectTPByBTC(teacherID, courseID, batchID)==null) {
        	tp.setBatch(testDao.selectBatchById(batchID));
        	tp.setCourse(testDao.selectCourseById(courseID));
        	tp.setTeacher(testDao.selectTeacherById(teacherID));
        	adminDao.addTP2(tp);
        }
        tpd.setTeachingProgram(adminDao.selectTPByBTC(teacherID, courseID, batchID));
        adminDao.addTP(tpd);
        

    }

    public void editTP(String teacherID, String courseID, int batchID,
            int nian, String xueqi, String week, String weekDay, String lessonTime,
            String location, int id) {
        String s = null;
        String wwday = null;
        if (xueqi.equals("spring")) {
            s = "春季";
        } else {
            s = "秋季";
        }

        switch (weekDay) {
            case "yi":
                wwday = "星期一";
                break;
            case "er":
                wwday = "星期二";
                break;
            case "san":
                wwday = "星期三";
                break;
            case "si":
                wwday = "星期四";
                break;
            case "wu":
                wwday = "星期五";
                break;
        }
        
        TeachingProgramDetail tpd=adminDao.selectTP(id);
        tpd.getTeachingProgram().getBatch().setCid(batchID);
        tpd.getTeachingProgram().getCourse().setCourseId(courseID);
        tpd.getTeachingProgram().getTeacher().setTeacherId(teacherID);
        tpd.setTpdlessonTime(lessonTime);
        tpd.setTpdlocation(location);
        tpd.setTpdseason(s);
        tpd.setTpdweek(week);
        tpd.setTpdweekDay(wwday);
        tpd.setTpdyear(nian);
        adminDao.editTP(tpd);
    }

    public void deleteTP(int id) {
        adminDao.deleteTP(id);
    }

    public Student selectStudent(String studentId) {

        return adminDao.selectStudent(studentId);
    }

    public void addStudent(Student stu) {
    	stu.setStudentPwd("123456");
        adminDao.addStudent(stu);

    }

    public void editStudent(Student stu, int batch) {
    	Batch b=testDao.selectBatchById(batch);
    	stu.setBatch(b);
        adminDao.editStudent(stu);

    }

    public void deleteStudent(String sid) {
        adminDao.deleteStudent(sid);
    }

    public List selectCFD(int batch) {
        return adminDao.selectCFD(batch);
    }

    public void deleteCFD(int sid) {
        adminDao.deleteCFD(sid);
    }

    public List selectTFD(String teacherId) {
//return adminDao.selectTFD(teacherId); 两种方法都可以。1.通过连接查询查出列表 2.因为Teacher表里有TeacherFeedBack列表所以直接返回就好
    	return testDao.selectTeacherById(teacherId).getTeacherFeedBacks();
    }

    public void deleteTFD(int sid) {
        adminDao.deleteTFD(sid);
    }

}
