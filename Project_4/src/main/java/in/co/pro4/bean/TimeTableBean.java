package in.co.pro4.bean;

import java.util.Date;

/**
 * TimeTable JavaBean encapsulates TimeTable attributes
 * @author Sanjay Kumar
 *
 */
public class TimeTableBean extends BaseBean {
	
	/**
     * CourseId for TimeTable
     */
	private long courseId;
	
	/**
     * CourseName for TimeTable
     */
	private String courseName;
	
	/**
     * SubjectId for TimeTable
     */
	private long subjectId;
	
	/**
     * SubjectName for TimeTable
     */
	private String subjectName;
	
	/**
     * Semester for TimeTable
     */
	private String semester;
	
	/**
     * ExamDate of TimeTable
     */
	private Date examDate;
	
	/**
     * ExamTime of TimeTable
     */
	private String examTime;
	
	/**
     * Description of TimeTable
     */
	private String description;

	
	/**
     * accessor
     */
	public long getCourseId() {
		return courseId;
	}

	public void setCourseId(long courseId) {
		this.courseId = courseId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public long getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(long subjectId) {
		this.subjectId = subjectId;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public Date getExamDate() {
		return examDate;
	}

	public void setExamDate(Date examDate) {
		this.examDate = examDate;
	}

	public String getExamTime() {
		return examTime;
	}

	public void setExamTime(String examTime) {
		this.examTime = examTime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String getKey() {
		return id + "";
	}

	@Override
	public String getValue() {
		return subjectName;
	}
}
