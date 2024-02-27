package in.co.testModel.pro4;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import in.co.pro4.bean.UserBean;
import in.co.pro4.exception.ApplicationException;
import in.co.pro4.exception.DuplicateRecordException;
import in.co.pro4.exception.RecordNotFoundException;
import in.co.pro4.model.UserModel;

/**
 * College Model Test classes.
 * @author Sanjay Kumar
 *
 */
public class UserModelTest {
	private static UserModel model = new UserModel();

	public static void main(String[] args) throws ParseException, DuplicateRecordException {
		testAdd();
		// testUpdate();
		// testFindByPk();
		// testFindByLogin();
		// testgetRoles();
		// testSearch();
		// testList();
		// testAuthenticate();
		// testRegisterUser();
		// testChangePassword();
		// testForgetPassword();
		// testResetPassword();
		// testDelete();
	}
/**
 * 
 * Delete a User
 *
 */
	public static void testDelete() {
		try {
			UserBean bean = new UserBean();
			long pk = 9L;
			bean.setId(pk);
			model.delete(bean);
			System.out.println("Test Delete succ " + bean.getId());
			UserBean deletedbean = model.findByPK(pk);
			if (deletedbean == null) {
				System.out.println("Test Delete fail");
			}
		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * Reset Password of User with auto generated Password
	 *
	 */
	public static void testResetPassword() {
		UserBean bean = new UserBean();
		try {
			bean = model.findByLogin("vinod123@gmail.com");
			if (bean != null) {
				boolean pass = model.resetPassword(bean);
				if (pass = false) {
					System.out.println("Test Update fail");
				}
			}

		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
     * Send the password of User to his Email
     *
     */
	public static void testForgetPassword() {
		try {
			boolean b = model.forgetPassword("vinod123@gmail.com");

			System.out.println("Success : Test Forget Password Success");

		} catch (RecordNotFoundException e) {
			e.printStackTrace();
		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * Change Password of User with auto generated Password
	 *
	 */
	public static void testChangePassword() {
		try {
			UserBean bean = model.findByLogin("vinod123@gmail.com");
			String oldPassword = bean.getPassword();
			bean.setId(3l);
			bean.setPassword("pass@12345");
			bean.setConfirmPassword("pass");
			String newPassword = bean.getPassword();
			try {
				model.changePassword(3L, oldPassword, newPassword);
				System.out.println("password has been change successfully");
			} catch (RecordNotFoundException e) {
				e.printStackTrace();
			}

		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * Register a user
	 *
	 */
	public static void testRegisterUser() throws ParseException {
		try {
			UserBean bean = new UserBean();
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");

			bean.setFirstName("Neeraj");
			bean.setLastName("Rathore");
			bean.setLogIn("rathoreneeraj448@gmail.com");
			bean.setPassword("Neeraj@1997");
			bean.setConfirmPassword("Neeraj@1997");
			bean.setDob(sdf.parse("02/07/1997"));
			bean.setGender("Male");
			bean.setRoleId(1);
			long pk = model.registerUser(bean);
			System.out.println("Successfully register");
//			System.out.println(bean.getFirstName());
//			System.out.println(bean.getLogIn());
//			System.out.println(bean.getLastName());
//			System.out.println(bean.getDob());
//			UserBean registerbean = model.findByPK(3L);
//			if (registerbean != null) {
//				System.out.println("Test registration fail");
//			}
		} catch (ApplicationException e) {
			e.printStackTrace();
		} catch (DuplicateRecordException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * Authenticate a User
	 *
	 */
	public static void testAuthenticate() {
		try {
			UserBean bean = new UserBean();
			bean.setLogIn("rathoreneeraj448@gmail.com");
			bean.setPassword("pass1234");
			bean = model.authenticate(bean.getLogIn(), bean.getPassword());
			if (bean != null) {
				System.out.println("Successfully login");

			} else {
				System.out.println("Invalied login Id & password");
			}

		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * Get List of User 
	 *
	 */
	public static void testList() {
		try {
			UserBean bean = new UserBean();
			List list = new ArrayList();
			list = model.list(1, 10);
			if (list.size() < 0) {
				System.out.println("Test list fail");
			}
			Iterator it = list.iterator();
			while (it.hasNext()) {
				bean = (UserBean) it.next();
				System.out.println(bean.getId());
				System.out.println(bean.getFirstName());
				System.out.println(bean.getLastName());
				System.out.println(bean.getLogIn());
				System.out.println(bean.getPassword());
				System.out.println(bean.getDob());
				System.out.println(bean.getRoleId());
				System.out.println(bean.getUnSuccessfullLogin());
				System.out.println(bean.getGender());
				System.out.println(bean.getLastLogin());
				System.out.println(bean.getLock());
				System.out.println(bean.getMobileNo());
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
	 * Search a User 
	 *
	 */
	public static void testSearch() {
		try {
			UserBean bean = new UserBean();
			List list = new ArrayList();
			bean.setFirstName("Amit");
			list = model.search(bean, 0, 0);
			if (list.size() < 0) {
				System.out.println("Test Serach fail");
			}
			Iterator it = list.iterator();
			while (it.hasNext()) {
				bean = (UserBean) it.next();
				System.out.println(bean.getId());
				System.out.println(bean.getFirstName());
				System.out.println(bean.getLastName());
				System.out.println(bean.getLogIn());
				System.out.println(bean.getPassword());
				System.out.println(bean.getDob());
				System.out.println(bean.getRoleId());
				System.out.println(bean.getUnSuccessfullLogin());
				System.out.println(bean.getGender());
				System.out.println(bean.getLastLogin());
				System.out.println(bean.getLock());
			}

		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * Get User Roles
	 *
	 */
	public static void testgetRoles() {
		try {
			UserBean bean = new UserBean();
			List list = new ArrayList();
			bean.setRoleId(2L);
			list = model.getRoles(bean);
			if (list.size() < 0) {
				System.out.println("Test Get Roles fail");
			}
			Iterator it = list.iterator();
			while (it.hasNext()) {
				bean = (UserBean) it.next();
				System.out.println(bean.getId());
				System.out.println(bean.getFirstName());
				System.out.println(bean.getLastName());
				System.out.println(bean.getLogIn());
				System.out.println(bean.getPassword());
				System.out.println(bean.getDob());
				System.out.println(bean.getRoleId());
				System.out.println(bean.getUnSuccessfullLogin());
				System.out.println(bean.getGender());
				System.out.println(bean.getLastLogin());
				System.out.println(bean.getLock());
			}
		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * Find User by Login
	 *
	 */
	public static void testFindByLogin() {
		try {
			UserBean bean = new UserBean();
			bean = model.findByLogin("rathoreneeraj448@gmail.com");
			if (bean == null) {
				System.out.println("Test Find By Login fail");
			}
			System.out.println(bean.getId());
			System.out.println(bean.getFirstName());
			System.out.println(bean.getLastName());
			System.out.println(bean.getLogIn());
			System.out.println(bean.getPassword());
			System.out.println(bean.getDob());
			System.out.println(bean.getRoleId());
			System.out.println(bean.getUnSuccessfullLogin());
			System.out.println(bean.getGender());
			System.out.println(bean.getLastLogin());
			System.out.println(bean.getLock());
		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * Find User by PK
	 *
	 */
	public static void testFindByPk() {
		try {
			UserBean bean = new UserBean();
			long pk = 1L;
			bean = model.findByPK(pk);
			if (bean == null) {
				System.out.println("Test Find By PK fail");
			}
			System.out.println(bean.getId());
			System.out.println(bean.getFirstName());
			System.out.println(bean.getLastName());
			System.out.println(bean.getLogIn());
			System.out.println(bean.getPassword());
			System.out.println(bean.getDob());
			System.out.println(bean.getRoleId());
			System.out.println(bean.getUnSuccessfullLogin());
			System.out.println(bean.getGender());
			System.out.println(bean.getLastLogin());
			System.out.println(bean.getLock());
		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * Update a user
	 *
	 */
	public static void testUpdate() {
		try {
			UserBean bean = model.findByPK(7L);
			// bean.setLogIn("rathorvinod448@gmail.com");
//			bean.setMobileNo("9827632823");
//			bean.setConfirmPassword("Neeraj@1997");
			bean.setLogIn("rathorevinod@gmail.com");

			model.update(bean);

//			UserBean updatedbean = model.findByPK(4L);
//			if (!"ranjit".equals(updatedbean.getLogIn())) {
//				System.out.println("Test Update fail");
//			}
		} catch (ApplicationException e) {
			e.printStackTrace();
		} catch (DuplicateRecordException e) {
			e.printStackTrace();
		}

	}
	/**
	 * 
	 * Add a User
	 *
	 */
	public static void testAdd() throws ParseException, DuplicateRecordException {
		try {
			UserBean bean = new UserBean();
			SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");

			bean.setFirstName("Amit");
			bean.setLastName("Rathore");
			bean.setLogIn("amit123@gmail.com");
			bean.setPassword("amit123");
			bean.setDob(sdf.parse("17-10-2001"));

			bean.setRoleId(2L);
			bean.setUnSuccessfullLogin(2);
			bean.setGender("Male");
			bean.setLastLogin(new Timestamp(new Date().getTime()));
			bean.setLock("Yes");
			bean.setConfirmPassword("amit123");
			long pk = model.add(bean);
			UserBean addedbean = model.findByPK(pk);
			System.out.println("Test add succ");
			if (addedbean == null) {
				System.out.println("Test add fail");
			}
		} catch (ApplicationException e) {
			e.printStackTrace();
		}
	}
}
