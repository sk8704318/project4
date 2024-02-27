package in.co.testModel.pro4;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import in.co.pro4.bean.StudentBean;
import in.co.pro4.exception.ApplicationException;
import in.co.pro4.exception.DuplicateRecordException;
import in.co.pro4.model.StudentModel;

/**
 * Student Model Test classes.
 * @author Sanjay Kumar
 *
 */
public class StudentModelTest {
	public static StudentModel model = new StudentModel();

	public static void main(String[] args) throws ParseException {
		// testAdd();
		// testDelete();
		// testUpdate();
		// testList();
		// testNextPK();
		// testFindByEmail();
		testSearch();
	}
	/**
	 * 
     * Get Search of Student
     *
     */
	public static void testSearch() {

		try {
			StudentBean bean = new StudentBean();
			List list = new ArrayList();
			bean.setFirstName("");
			list = model.search(bean, 0, 0);
			if (list.size() < 0) {
				System.out.println("Test Serach fail");
			}
			Iterator it = list.iterator();
			while (it.hasNext()) {
				bean = (StudentBean) it.next();
				System.out.println(bean.getId());
				System.out.println(bean.getFirstName());
				System.out.println(bean.getLastName());
				System.out.println(bean.getDob());
				System.out.println(bean.getMobileNo());
				System.out.println(bean.getEmail());
				System.out.println(bean.getCollegeId());
			}

		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * Find Student by Email
	 *
	 */
	public static void testFindByEmail() {
		try {
			StudentBean bean = new StudentBean();
			bean = model.findByEmail("rathoreneeraj448@gmail.com");
			if (bean == null) {
				System.out.println("Test Find By EmailId fail");
			}
			System.out.println(bean.getId());
			System.out.println(bean.getFirstName());
			System.out.println(bean.getLastName());
			System.out.println(bean.getDob());
			System.out.println(bean.getMobileNo());
			System.out.println(bean.getEmail());
			System.out.println(bean.getCollegeId());
		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * Find Student by PK
	 *
	 */
	public static void testNextPK() {
		try {
			StudentBean bean = new StudentBean();
			long pk = 4L;
			bean = model.findByPK(pk);
			if (bean == null) {
				System.out.println("Test Find By PK fail");
			}
			System.out.println(bean.getId());
			System.out.println(bean.getFirstName());
			System.out.println(bean.getLastName());
			System.out.println(bean.getDob());
			System.out.println(bean.getMobileNo());
			System.out.println(bean.getEmail());
			System.out.println(bean.getCollegeId());
		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
     * Get List of Student
     *
     */
	public static void testList() {
		try {
			StudentBean bean = new StudentBean();
			List list = new ArrayList();
			list = model.list(1, 10);
			if (list.size() < 0) {
				System.out.println("Test list fail");
			}
			Iterator it = list.iterator();
			while (it.hasNext()) {
				bean = (StudentBean) it.next();
				System.out.println(bean.getId());
				System.out.println(bean.getFirstName());
				System.out.println(bean.getLastName());
				System.out.println(bean.getDob());
				System.out.println(bean.getMobileNo());
				System.out.println(bean.getEmail());
				System.out.println(bean.getCollegeId());
				System.out.println(bean.getCreatedBy());
				System.out.println(bean.getCreatedDatetime());
				System.out.println(bean.getModifiedBy());
				System.out.println(bean.getModifiedDatetime());
			}

		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * Update a Student
	 *
	 */
	public static void testUpdate() {

		try {
			StudentBean bean = model.findByPK(3L);
			bean.setCollegeId(1L);
			bean.setFirstName("Kanak");
			bean.setLastName("Verma");
			model.update(bean);

			StudentBean updatedbean = model.findByPK(3L);
			if (!"aniket".equals(updatedbean.getFirstName())) {
				System.out.println("Test Update fail");
			}
		} catch (ApplicationException e) {
			e.printStackTrace();
		} catch (DuplicateRecordException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * Delete a Student
	 *
	 */
	public static void testDelete() {
		try {
			StudentBean bean = new StudentBean();
			long pk = 2L;
			bean.setId(pk);
			model.delete(bean);
			StudentBean deletedbean = model.findByPK(pk);
			if (deletedbean != null) {
				System.out.println("Test Delete fail");
			}
		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * Add a Student
	 *
	 */
	public static void testAdd() throws ParseException {

		try {
			StudentBean bean = new StudentBean();
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

			// bean.setId(1L);
			bean.setFirstName("ram");
			bean.setLastName("kumawat");
			bean.setDob(sdf.parse("31/12/1990"));
			bean.setMobileNo("9165254357");
			bean.setEmail("ram123@gmail.com");
			bean.setCollegeId(2);
			bean.setCreatedBy("Admin");
			bean.setModifiedBy("Admin");
			bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
			bean.setModifiedDatetime(new Timestamp(new Date().getTime()));
			long pk = model.add(bean);
			StudentBean addedbean = model.findByPK(pk);
			if (addedbean == null) {
				System.out.println("Test add fail");
			}
		} catch (ApplicationException e) {
			e.printStackTrace();
		} catch (DuplicateRecordException e) {
			e.printStackTrace();
		}
	}
}
