
package in.co.pro4.bean;


/**
 * Marksheet JavaBean encapsulates Marksheet attributes
 * @author Sanjay Kumar
 *
 */
public class MarksheetBean extends BaseBean {

	
    /**
     * Rollno of Student
     */
	private String rollNo;
	
	/**
     * ID of Student
     */
	private long studentId;
	
	/**
     * Name of Student
     */
	private String name;
	
    /**
     * Physics marks of Student
     */
	private Integer physics;
	
    /**
     * Chemistry marks of Student
     */
	private Integer chemistry;
	
	/**
     * Mathematics marks of Student
     */
	private Integer maths;
	
	/**
     * Total marks of Student
     */
	private long total;

	/**
     * accessor
     */
	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public String getRollNo() {
		return rollNo;
	}

	public void setRollNo(String rollNo) {
		this.rollNo = rollNo;
	}

	public long getStudentId() {
		return studentId;
	}

	public void setStudentId(long studentId) {
		this.studentId = studentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPhysics() {
		return physics;
	}

	public void setPhysics(Integer physics) {
		this.physics = physics;
	}

	public Integer getChemistry() {
		return chemistry;
	}

	public void setChemistry(Integer chemistry) {
		this.chemistry = chemistry;
	}

	public Integer getMaths() {
		return maths;
	}

	public void setMaths(Integer maths) {
		this.maths = maths;
	}

	@Override
	public String getKey() {
		// TODO Auto-generated method stub
		return id + "";
	}

	@Override
	public String getValue() {
		// TODO Auto-generated method stub
		return rollNo;
	}

}
