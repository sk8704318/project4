package in.co.testModel.pro4;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import in.co.pro4.bean.RoleBean;
import in.co.pro4.exception.ApplicationException;
import in.co.pro4.exception.DuplicateRecordException;
import in.co.pro4.model.RoleModel;

/**
 * Role Model Test classes.
 * @author Sanjay Kumar
 *
 */
public class RoleModelTest {
	private static RoleModel model = new RoleModel();

	public static void main(String[] args) {
		 testAdd();
		// testFindByName();
		// testFindByPK();
		// testSearch();
		// testList();
		// testUpdate();
		// testDelete();
	}
	/**
	 * 
	 * Delete a Role
	 *
	 */
	public static void testDelete() {
		try {
			RoleBean bean = new RoleBean();
			long pk = 2L;
			bean.setId(pk);
			model.delete(bean);
			RoleBean deletedbean = model.findByPK(pk);
			if (deletedbean != null) {
				System.out.println("Test Delete fail");
			}
		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * Update a Role
	 *
	 */
	public static void testUpdate() throws Exception {
		try {
			RoleBean bean = model.findByPK(2L);
			bean.setName("12");
			bean.setDescription("Ejjjjjjjjng");
			model.update(bean);

			RoleBean updatedbean = model.findByPK(2L);
			if (!"12".equals(updatedbean.getName())) {
				System.out.println("Test Update fail");
			}
		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * Get List of Role.
	 *
	 */
	public static void testList() {
		try {
			RoleBean bean = new RoleBean();
			List list = new ArrayList();
			list = model.list(1, 10);
			if (list.size() < 0) {
				System.out.println("Test list fail");
			}
			Iterator it = list.iterator();
			while (it.hasNext()) {
				bean = (RoleBean) it.next();
				System.out.println(bean.getId());
				System.out.println(bean.getName());
				System.out.println(bean.getDescription());
			}

		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * Search a Role.
	 *
	 */
	public static void testSearch() {
		try {
			RoleBean bean = new RoleBean();
			List list = new ArrayList();
			bean.setDescription("j");
			list = model.search(bean, 0, 0);
			if (list.size() < 0) {
				System.out.println("Test Serach fail");
			}
			Iterator it = list.iterator();
			while (it.hasNext()) {
				bean = (RoleBean) it.next();
				System.out.println(bean.getId());
				System.out.println(bean.getName());
				System.out.println(bean.getDescription());
			}

		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * Find Role by PK
	 *
	 */
	public static void testFindByPK() {
		try {
			RoleBean bean = new RoleBean();
			long pk = 1L;
			bean = model.findByPK(pk);
			if (bean == null) {
				System.out.println("Test Find By PK fail");
			}
			System.out.println(bean.getId());
			System.out.println(bean.getName());
			System.out.println(bean.getDescription());
		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * Find Role by Name
	 *
	 */
	public static void testFindByName() {
		try {
			RoleBean bean = new RoleBean();
			bean = model.findByName("prashant");
			if (bean == null) {
				System.out.println("Test Find By PK fail");
			}
			System.out.println(bean.getId());
			System.out.println(bean.getName());
			System.out.println(bean.getDescription());
		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * Add a Role
	 *
	 */
	public static void testAdd() {
		try {
			RoleBean bean = new RoleBean();

			bean.setName("KIOSK");
			//bean.setDescription("");
			long pk = model.add(bean);
			RoleBean addedbean = model.findByPK(pk);
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
