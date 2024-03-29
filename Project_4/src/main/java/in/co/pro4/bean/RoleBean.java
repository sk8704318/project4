package in.co.pro4.bean;

/**
 * Role JavaBean encapsulates Role attributes
 * @author Sanjay Kumar
 *
 */
public class RoleBean extends BaseBean {

	
    /**
     * Predefined Role constants
     */
	public static final int ADMIN = 1;
	public static final int STUDENT = 2;
	public static final int FACULTY = 3;
	public static final int COLLEGE_SCHOOL = 4;
	public static final int KIOSK = 5;

	
	/**
     * Role Name
     */
	private String name;
	

    /**
     * Role Description
     */
	private String description;
	

    /**
     * accessor
     */

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

		return name;
	}

}
