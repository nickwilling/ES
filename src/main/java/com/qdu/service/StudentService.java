package com.qdu.service;

import com.qdu.dao.StudentDao;
import com.qdu.pojo.Course;
import com.qdu.pojo.CourseFeedBackQuestion;
import com.qdu.pojo.Student;
import com.qdu.pojo.TeacherFeedBackQuestion;
import com.qdu.pojo.TeachingProgram;
import com.qdu.pojo.TeachingProgramDetail;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class StudentService {

    @Autowired
    private StudentDao studentDao;

    public List<List<Object>> getCourseList(String rollno) {
    	List<List<Object>> list=new ArrayList<>();
    	List<Object> li;
    	Course c;
    	List<TeachingProgram> l=studentDao.findStudentByRollno(rollno).getBatch().getTeachingPrograms();
        for(int i=0;i<l.size();i++) {
        	c=l.get(i).getCourse();
        	li=new ArrayList<>();
        	li.add(c.getCourseId());
        	li.add(c.getCourseName());
        	li.add(c.getCourseExamMethod());
        	li.add(c.getCoursecredit());
        	li.add(c.getCourseSchoolHour());
        	li.add(c.getTeacher().getTeacherName());
        	li.add(c.getTeacher().getTeacherId());
        	li.add(l.get(i).getTid());
        	list.add(li);
        }
         return list;
    }

    public Student findStudent(String sid, String spwd) {
        return studentDao.findStudent(sid, spwd);
    }

    public Student addStudent(Student student) {
        return studentDao.addStudent(student);
    }

    public List<Student> getStudentList() {
        System.out.println("注册");
        return null;
    }

    public void updateStudent(Student student) {
    	studentDao.updateStudent(student);
    }


    public List<TeachingProgramDetail> getCourseDetailList(int TID) {
        return studentDao.getCourseDetailList(TID);
    }

    public List getAttendanceList(String studentId, String beginDate, String endDate) {
        return studentDao.getAttendanceList(studentId, beginDate, endDate);
    }

    public List<CourseFeedBackQuestion> getCourseFeedBackQuestionList(String courseId) {
        return studentDao.getCourseFeedBackQuestionList(courseId);
    }

    public List<TeacherFeedBackQuestion> getTeacherFeedBackQuestionlist(String teacherId) {
        return studentDao.getTeacherFeedBackQuestionList(teacherId);
    }

    public boolean insertCourseFeedBack(int qid, int choice, String studentId) {
        try {
            studentDao.insertCFeedBack(qid, choice, studentId);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean insertTeacherFeedBack(int qid, int choice, String studentId) {
        try {
            studentDao.insertTFeedBack(qid, choice, studentId);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
