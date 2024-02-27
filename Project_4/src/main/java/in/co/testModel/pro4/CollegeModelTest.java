package in.co.testModel.pro4;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import in.co.pro4.bean.CollegeBean;
import in.co.pro4.exception.ApplicationException;
import in.co.pro4.exception.DuplicateRecordException;
import in.co.pro4.model.CollegeModel;

/**
 * College Model Test classes.
 * @author Sanjay Kumar
 *
 */
public class CollegeModelTest {
	public static CollegeModel model = new CollegeModel();

	public static void main(String[] args) throws ApplicationException, DuplicateRecordException {
		// testAdd();
		// testFindByName();
		// testDelete();
		// testFindByPK();
		// testUpdate();
		testSearch();
		// testList();
	}

	/**
	 * 
	 * Get List of College
	 * 
	 */
	public static void testList() {
		try {
			CollegeBean bean = new CollegeBean();
			List list = new ArrayList();
			list = model.list(1, 10);
			if (list.size() < 0) {
				System.out.println("Test list fail");
			}
			Iterator it = list.iterator();
			while (it.hasNext()) {
				bean = (CollegeBean) it.next();
				System.out.println(bean.getId());
				System.out.println(bean.getName());
				System.out.println(bean.getAddress());
				System.out.println(bean.getState());
				System.out.println(bean.getCity());
				System.out.println(bean.getPhoneNo());
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
	 * Search a College.
	 *
	 */
	public static void testSearch() {
		try {
			CollegeBean bean = new CollegeBean();
			List list = new ArrayList();
			bean.setCity("Delhi");

			list = model.search(bean, 1, 8);
			if (list.size() < 0) {
				System.out.println("Test Search fail");
			}
			Iterator it = list.iterator();
			while (it.hasNext()) {
				bean = (CollegeBean) it.next();
				System.out.println(bean.getId());
				System.out.println(bean.getName());
				System.out.println(bean.getAddress());
				System.out.println(bean.getState());
				System.out.println(bean.getCity());
				System.out.println(bean.getPhoneNo());
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
	 * Update a College.
	 *
	 */
	public static void testUpdate() {
		try {
			CollegeBean bean = model.findByPK(2);
			bean.setName("oit");
			bean.setAddress("vv");
			model.update(bean);
			System.out.println("Test Update succ");
			CollegeBean updateBean = model.findByPK(2L);
			if (!"oit".equals(updateBean.getName())) {
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
	 * Find College by PK.
	 *
	 */
	public static void testFindByPK() {
		try {
			CollegeBean bean = new CollegeBean();
			long pk = 2;
			bean = model.findByPK(pk);
			if (bean == null) {
				System.out.println("Test Find By PK fail");
			}
			System.out.println(bean.getId());
			System.out.println(bean.getName());
			System.out.println(bean.getAddress());
			System.out.println(bean.getState());
			System.out.println(bean.getCity());
			System.out.println(bean.getPhoneNo());
			System.out.println(bean.getCreatedBy());
			System.out.println(bean.getCreatedDatetime());
			System.out.println(bean.getModifiedBy());
			System.out.println(bean.getModifiedDatetime());
		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Delete a College.
	 *
	 */
	public static void testDelete() {
		try {
			CollegeBean bean = new CollegeBean();
			long pk = 3;
			bean.setId(pk);
			model.delete(bean);
			System.out.println("Test Delete succ");
			CollegeBean deletedBean = model.findByPK(pk);
			if (deletedBean != null) {
				System.out.println("Test Delete fail");
			}
		} catch (ApplicationException e) {
			e.printStackTrace();

		}
	}

	/**
	 * Find College by Name.
	 *
	 */
	public static void testFindByName() {
		try {
			CollegeBean bean = model.findByName("IET DAVV");
			if (bean == null) {
				System.out.println("Test Find By Name fail");
			} else {
				System.out.println(bean.getId());
				System.out.println(bean.getName());
				System.out.println(bean.getAddress());
				System.out.println(bean.getState());
				System.out.println(bean.getCity());
				System.out.println(bean.getPhoneNo());
				System.out.println(bean.getCreatedBy());
				System.out.println(bean.getModifiedBy());
				System.out.println(bean.getCreatedDatetime());

				System.out.println(bean.getModifiedDatetime());
			}
		} catch (ApplicationException e) {
			e.printStackTrace();
		}

	}

	
	/**
	 * 
	 * Add a College.
	 *
	 */
	public static void testAdd() throws DuplicateRecordException {
		try {
			CollegeBean bean = new CollegeBean();

			bean.setName("NIT");
			bean.setAddress("VijayNagar");
			bean.setState("Indore");
			bean.setCity("Indore");
			bean.setPhoneNo("7566601112");
			bean.setCreatedBy("Admin");
			bean.setModifiedBy("Admin");
			bean.setCreatedDatetime(new Timestamp(new Date().getTime()));
			bean.setModifiedDatetime(new Timestamp(new Date().getTime()));

			long pk = model.add(bean);
			System.out.println("Test add successfull");

			CollegeBean addedBean = model.findByPK(pk);

			if (addedBean == null) {
				System.out.println("Test add failed");
			}
		} catch (ApplicationException e) {

			// System.out.println("not added");
			e.printStackTrace();
		}

	}
}
