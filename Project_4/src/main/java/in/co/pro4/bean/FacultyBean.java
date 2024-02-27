package in.co.pro4.bean;


import java.util.Date;

/**
 * Faculty JavaBean encapsulates Faculty attributes
 * @author Sanjay Kumar
 *
 */
public class FacultyBean extends BaseBean {
	
	/**
     * FirstName of Faculty
     */
	private String firstName;
	
	/**
     * LastName of Faculty
     */
	private String lastName;
	
	/**
     * Gender of Faculty
     */
	private String gender;
	
	/**
     * EmailId of Faculty
     */
	private String emailId;
	
	/**
     * MobileNo of Faculty
     */
	private String mobileNo;
	
	/**
     * CollegeId of Faculty
     */
	private long collegeId;
	
	/**
     * CollegeName of Faculty
     */
	private String collegeName;
	
	/**
     * CourseId of Faculty
     */
	private long courseId;
	
	/**
     * CourseName of Faculty
     */
	private String courseName;
	
	/**
     * Date Of Birth of Faculty
     */
	private Date dob;
	
	/**
     * SubjectId of Faculty
     */
	private long subjectId;
	
	/**
     * SubjectName of Faculty
     */
	private String subjectName;
	

	/**
     * accessor
     */
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public long getCollegeId() {
		return collegeId;
	}

	public void setCollegeId(long collegeId) {
		this.collegeId = collegeId;
	}

	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

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

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
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

	

	@Override
	public String getKey() {
		return id + "";
	}

	@Override
	public String getValue() {
		return firstName + " " + lastName;
	}
}
