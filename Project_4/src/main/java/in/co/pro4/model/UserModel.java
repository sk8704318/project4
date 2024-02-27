package in.co.pro4.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import in.co.pro4.bean.UserBean;
import in.co.pro4.exception.ApplicationException;
import in.co.pro4.exception.DuplicateRecordException;
import in.co.pro4.exception.RecordNotFoundException;
import in.co.pro4.utility.EmailBuilder;
import in.co.pro4.utility.EmailMassage;
import in.co.pro4.utility.EmailUtility;
import in.co.pro4.utility.JDBCDataSource;

/**
 * 
 * JDBC implementation of UserModel
 * @author Sanjay Kumar
 *
 */
public class UserModel {

	private static Logger log = Logger.getLogger(UserModel.class);

	private long roleId;

	public long getRoleId() {
		return roleId;
	}

	public void setRoleId(long roleId) {
		this.roleId = roleId;
	}
	/**
	 * 
	 * Next PK of User
	 *
	 */
	public static Integer nextPK() throws ApplicationException {
		log.debug("Model Next PK Started");

		Connection conn = null;
		int pk = 0;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(ID) FROM ST_USER");
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				pk = rs.getInt(1);
			}
			rs.close();
		} catch (Exception e) {
			log.error("Database Exception....", e);
			throw new ApplicationException("Exception : in getting next pk");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		log.debug("Model Next PK Ended");
		return pk + 1;
	}
	/**
	 * 
	 * Add a User
	 *
	 */
	public static long add(UserBean bean) throws ApplicationException, DuplicateRecordException {
		log.debug("Model Add Started");
		Connection conn = null;
		int pk = 0;

		UserBean beanExists = findByLogin(bean.getLogIn());

		if (beanExists != null) {
			throw new DuplicateRecordException("LogIn ID is already Exists");
		}
		try {
			conn = JDBCDataSource.getConnection();
			pk = nextPK();
			conn.setAutoCommit(false);
			PreparedStatement pstmt = conn.prepareStatement(
					"INSERT INTO ST_USER VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			pstmt.setLong(1, pk);
			pstmt.setString(2, bean.getFirstName());
			pstmt.setString(3, bean.getLastName());
			pstmt.setString(4, bean.getLogIn());
			pstmt.setString(5, bean.getPassword());
			pstmt.setDate(6, new java.sql.Date(bean.getDob().getTime()));
			pstmt.setString(7, bean.getMobileNo());
			pstmt.setLong(8, bean.getRoleId());
			pstmt.setInt(9, bean.getUnSuccessfullLogin());
			pstmt.setString(10, bean.getGender());
			pstmt.setTimestamp(11, bean.getLastLogin());
			pstmt.setString(12, bean.getLock());
			pstmt.setString(13, bean.getLastloginIP());
			pstmt.setString(14, bean.getLastloginIP());
			pstmt.setString(15, bean.getCreatedBy());
			pstmt.setString(16, bean.getModifiedBy());
			pstmt.setTimestamp(17, bean.getCreatedDatetime());
			pstmt.setTimestamp(18, bean.getModifiedDatetime());

			pstmt.executeUpdate();

			conn.commit();
			pstmt.close();
		} catch (Exception e) {
			log.error("Database Exception....", e);

			try {
				conn.rollback();
			} catch (Exception e1) {
				throw new ApplicationException("Exception : add rollback" + e1.getMessage());
			}
			throw new ApplicationException("Exception : in adding user");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model Add Ended");
		return pk;
	}
	/**
	 * 
	 * Update a user
	 *
	 */
	public void update(UserBean bean) throws ApplicationException, DuplicateRecordException {
		log.debug("Model Update Started");
		Connection conn = null;

		UserBean beanExists = findByLogin(bean.getLogIn());

		if (beanExists != null && !(beanExists.getId() == bean.getId())) {
			// System.out.println("id " + beanExists.getId());
			throw new DuplicateRecordException("Login Already Exists");
		}

		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement pstmt = conn.prepareStatement(
					"UPDATE ST_USER SET FIRST_NAME=?, LAST_NAME=?, LOGIN=?, PASSWORD=?, DOB=?, MOBILE_NO=?, ROLE_ID=?, UNSUCCESSEFUL_LOGIN=?, GENDER=?, LAST_LOGIN=?, USER_LOCK=?, REGISTERED_IP=?, LAST_LOGIN_IP=?, CREATED_BY=?, MODIFIED_BY=?, CREATED_DATETIME=?, MODIFIED_DATETIME=? WHERE ID=?");
			pstmt.setString(1, bean.getFirstName());
			pstmt.setString(2, bean.getLastName());
			pstmt.setString(3, bean.getLogIn());
			pstmt.setString(4, bean.getPassword());
			pstmt.setDate(5, new java.sql.Date(bean.getDob().getTime()));
			pstmt.setString(6, bean.getMobileNo());
			pstmt.setLong(7, bean.getRoleId());
			pstmt.setInt(8, bean.getUnSuccessfullLogin());
			pstmt.setString(9, bean.getGender());
			pstmt.setTimestamp(10, bean.getLastLogin());
			pstmt.setString(11, bean.getLock());
			pstmt.setString(12, bean.getRegisteredIP());
			pstmt.setString(13, bean.getLastloginIP());
			pstmt.setString(14, bean.getCreatedBy());
			pstmt.setString(15, bean.getModifiedBy());
			pstmt.setTimestamp(16, bean.getCreatedDatetime());
			pstmt.setTimestamp(17, bean.getModifiedDatetime());
			pstmt.setLong(18, bean.getId());

			pstmt.executeUpdate();

			conn.commit();
			pstmt.close();

		} catch (Exception e) {
			log.error("Database Exception...", e);
			try {
				conn.rollback();
			} catch (Exception e1) {
				throw new ApplicationException("Exception : update rollback" + e1.getMessage());
			}
			throw new ApplicationException("Exception : in updating user");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model Update Ended");
	}
	/**
	 * 
	 * Delete a User
	 *
	 */
	public static void delete(UserBean bean) throws ApplicationException {
		log.debug("Model Delete Started");
		Connection conn = null;

		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement pstmt = conn.prepareStatement("DELETE FROM ST_USER WHERE ID=?");
			pstmt.setLong(1, bean.getId());
			pstmt.executeUpdate();

			conn.commit();
			pstmt.close();
		} catch (Exception e) {
			log.error("Database Exception");
			try {
				conn.rollback();
			} catch (Exception e1) {
				throw new ApplicationException("Exception : delete rollback" + e1.getMessage());
			}
			throw new ApplicationException("Exception : in deleting user");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model Delete Ended");
	}


	/**
	 * 
	 * Find User by Login
	 *
	 */
	public static UserBean findByLogin(String login) throws ApplicationException {
		log.debug("Model Find By Login Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM ST_USER WHERE LOGIN=?");

		UserBean bean = null;
		Connection conn = null;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());

			pstmt.setString(1, login);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				bean = new UserBean();

				bean.setId(rs.getLong(1));
				bean.setFirstName(rs.getString(2));
				bean.setLastName(rs.getString(3));
				bean.setLogIn(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setDob(rs.getDate(6));
				bean.setMobileNo(rs.getString(7));
				bean.setRoleId(rs.getLong(8));
				bean.setUnSuccessfullLogin(rs.getInt(9));
				bean.setGender(rs.getString(10));
				bean.setLastLogin(rs.getTimestamp(11));
				bean.setLock(rs.getString(12));
				bean.setRegisteredIP(rs.getString(13));
				bean.setLastloginIP(rs.getString(14));
				bean.setCreatedBy(rs.getString(15));
				bean.setModifiedBy(rs.getString(16));
				bean.setCreatedDatetime(rs.getTimestamp(17));
				bean.setModifiedDatetime(rs.getTimestamp(18));
			}
			rs.close();
		} catch (Exception e) {
			log.error("Database Exception...", e);
			throw new ApplicationException("Exception : In getting user by Login");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model Find By Login Ended");
		return bean;
	}
	/**
	 * 
	 * Find User by PK
	 *
	 */
	public UserBean findByPK(long pk) throws ApplicationException {
		log.debug("Model Find By PK Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM ST_USER WHERE ID=?");

		Connection conn = null;
		UserBean bean = null;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setLong(1, pk);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				bean = new UserBean();

				bean.setId(rs.getLong(1));
				bean.setFirstName(rs.getString(2));
				bean.setLastName(rs.getString(3));
				bean.setLogIn(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setDob(rs.getDate(6));
				bean.setMobileNo(rs.getString(7));
				bean.setRoleId(rs.getLong(8));
				bean.setUnSuccessfullLogin(rs.getInt(9));
				bean.setGender(rs.getString(10));
				bean.setLastLogin(rs.getTimestamp(11));
				bean.setLock(rs.getString(12));
				bean.setRegisteredIP(rs.getString(13));
				bean.setLastloginIP(rs.getString(14));
				bean.setCreatedBy(rs.getString(15));
				bean.setModifiedBy(rs.getString(16));
				bean.setCreatedDatetime(rs.getTimestamp(17));
				bean.setModifiedDatetime(rs.getTimestamp(18));
			}
			rs.close();
		} catch (Exception e) {
			log.error("Database Exception....", e);
			throw new ApplicationException("Exception : In getting user by PK");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model Find By PK Ended");
		return bean;
	}
	/**
	 * 
	 * Search User with pagination
	 *
	 *
	 */
	public List search(UserBean bean, int pageNo, int pageSize) throws ApplicationException {
		log.debug("Model User Search Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM ST_USER WHERE 1=1");

		if (bean != null) {
			if (bean.getId() > 0) {
				sql.append(" AND ID = " + bean.getId());
			}
			if (bean.getFirstName() != null && bean.getFirstName().length() > 0) {
				sql.append(" AND FIRST_NAME LIKE '" + bean.getFirstName() + "%'");
			}
			if (bean.getLastName() != null && bean.getLastName().length() > 0) {
				sql.append(" AND LAST_NAME LIKE '" + bean.getLastName() + "%'");
			}
			if (bean.getLogIn() != null && bean.getLogIn().length() > 0) {
				sql.append(" AND LOGIN LIKE '" + bean.getLogIn() + "%'");
			}
			if (bean.getPassword() != null && bean.getPassword().length() > 0) {
				sql.append(" AND PASSWORD LIKE '" + bean.getPassword() + "%'");
			}

			if (bean.getDob() != null && bean.getDob().getDate() > 0) {
				sql.append(" AND DOB LIKE '" + new java.sql.Date(bean.getDob().getTime()) + "%'");
			}

			if (bean.getMobileNo() != null && bean.getMobileNo().length() > 0) {
				sql.append(" AND MOBILE_NO= " + bean.getMobileNo());
			}
			if (bean.getRoleId() > 0) {
				sql.append(" AND ROLE_ID=" + bean.getRoleId());
			}
			if (bean.getGender() != null && bean.getGender().length() > 0) {
				sql.append(" AND GENDER LIKE '" + bean.getGender() + "%'");
			}
			if (bean.getUnSuccessfullLogin() > 0) {
				sql.append(" AND UNSUCCESSFULL_LOGIN=" + bean.getUnSuccessfullLogin());
			}
			if (bean.getLastLogin() != null && bean.getLastLogin().getTime() > 0) {
				sql.append(" AND LAST_LOGIN=" + bean.getLastLogin());
			}
			if (bean.getRegisteredIP() != null && bean.getRegisteredIP().length() > 0) {
				sql.append(" AND REGISTERED_IP LIKE '" + bean.getRegisteredIP() + "%'");
			}
			if (bean.getLastloginIP() != null && bean.getLastloginIP().length() > 0) {
				sql.append(" AND LOGIN_IP LIKE '" + bean.getLastloginIP() + "%'");
			}
		}

		if (pageSize > 0) {
			pageNo = (pageNo - 1) * pageSize;

			sql.append(" LIMIT " + pageNo + ", " + pageSize);
		}
		
		System.out.println(sql.toString());
	
		ArrayList list = new ArrayList();
		Connection conn = null;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new UserBean();

				bean.setId(rs.getLong(1));
				bean.setFirstName(rs.getString(2));
				bean.setLastName(rs.getString(3));
				bean.setLogIn(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setDob(rs.getDate(6));
				bean.setMobileNo(rs.getString(7));
				bean.setRoleId(rs.getLong(8));
				bean.setUnSuccessfullLogin(rs.getInt(9));
				bean.setGender(rs.getString(10));
				bean.setLastLogin(rs.getTimestamp(11));
				bean.setLock(rs.getString(12));
				bean.setRegisteredIP(rs.getString(13));
				bean.setLastloginIP(rs.getString(14));
				bean.setCreatedBy(rs.getString(15));
				bean.setModifiedBy(rs.getString(16));
				bean.setCreatedDatetime(rs.getTimestamp(17));
				bean.setModifiedDatetime(rs.getTimestamp(18));

				list.add(bean);
			}
			rs.close();
		} catch (Exception e) {
			log.error("Database Exception....", e);
			throw new ApplicationException("Exception : in getting user list");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model User List Ended");
		return list;
	}
	/**
	 * 
	 * Search a User 
	 *
	 */
	public List search(UserBean bean) throws ApplicationException {
		return search(bean, 0, 0);
	}
	/**
	 * 
	 * Get List of User 
	 *
	 */
	public List list() throws ApplicationException {
		return list(0, 0);
	}
	/**
	 * 
	 * Get List of User with pagination
	 *
	 */
	public List list(int pageNo, int pageSize) throws ApplicationException {
		log.debug("Model List Startde");
		ArrayList list = new ArrayList();

		StringBuffer sql = new StringBuffer("SELECT * FROM ST_USER");

		if (pageSize > 0) {
			pageNo = (pageNo - 1) * pageSize;

			sql.append(" LIMIT " + pageNo + "," + pageSize);
		}

		Connection conn = null;
		UserBean bean = null;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				bean = new UserBean();

				bean.setId(rs.getLong(1));
				bean.setFirstName(rs.getString(2));
				bean.setLastName(rs.getString(3));
				bean.setLogIn(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setDob(rs.getDate(6));
				bean.setMobileNo(rs.getString(7));
				bean.setRoleId(rs.getLong(8));
				bean.setUnSuccessfullLogin(rs.getInt(9));
				bean.setGender(rs.getString(10));
				bean.setLastLogin(rs.getTimestamp(11));
				bean.setLock(rs.getString(12));
				bean.setRegisteredIP(rs.getString(13));
				bean.setLastloginIP(rs.getString(14));
				bean.setCreatedBy(rs.getString(15));
				bean.setModifiedBy(rs.getString(16));
				bean.setCreatedDatetime(rs.getTimestamp(17));
				bean.setModifiedDatetime(rs.getTimestamp(18));

				list.add(bean);
			}
			rs.close();
		} catch (Exception e) {
			log.debug("Database Exception...", e);
			throw new ApplicationException("Exception : in getting list");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model User List Ended");
		return list;
	}
	/**
	 * 
	 * Authenticate a User
	 *
	 */
	public UserBean authenticate(String login, String password) throws ApplicationException {
		log.debug("Model Authenticate Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM ST_USER WHERE LOGIN=? AND PASSWORD=?");

		UserBean bean = null;
		Connection conn = null;

		try {
			conn = JDBCDataSource.getConnection();

			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, login);
			pstmt.setString(2, password);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				bean = new UserBean();

				bean.setId(rs.getLong(1));
				bean.setFirstName(rs.getString(2));
				bean.setLastName(rs.getString(3));
				bean.setLogIn(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setDob(rs.getDate(6));
				bean.setMobileNo(rs.getString(7));
				bean.setRoleId(rs.getLong(8));
				bean.setUnSuccessfullLogin(rs.getInt(9));
				bean.setGender(rs.getString(10));
				bean.setLastLogin(rs.getTimestamp(11));
				bean.setLock(rs.getString(12));
				bean.setRegisteredIP(rs.getString(13));
				bean.setLastloginIP(rs.getString(14));
				bean.setCreatedBy(rs.getString(15));
				bean.setModifiedBy(rs.getString(16));
				bean.setCreatedDatetime(rs.getTimestamp(17));
				bean.setModifiedDatetime(rs.getTimestamp(18));
			}
			rs.close();
		} catch (Exception e) {
			log.error("Database Exeption...", e);
			throw new ApplicationException("Exception : in authentication");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("MOdel Authenticate Ended");
		return bean;
	}

	/**
	 * 
	 * Lock User for certain time duration
	 *
	 */
	public boolean lock(String login) throws DuplicateRecordException, RecordNotFoundException, ApplicationException {
		log.debug("Service Lock Started");
		boolean flag = false;
		UserBean beanExists = null;

		try {
			beanExists = findByLogin(login);

			if (beanExists != null) {
				beanExists.setLock(UserBean.ACTIVE);
				update(beanExists);
				flag = true;
			} else {
				throw new RecordNotFoundException("Login Id not Exists");
			}
		} catch (ApplicationException e) {
			log.error("Application Exception....", e);
			throw new ApplicationException("Exception : in databse");
		}
		log.debug("Service Lock Ended");
		return flag;
	}

	/**
	 * 
	 * Get User Roles
	 *
	 */
	public List getRoles(UserBean bean) throws ApplicationException {
		log.debug("Model get role started");
		StringBuffer sql = new StringBuffer("SELECT * FROM ST_USER WHERE ROLE_ID=?");
		Connection conn = null;
		List list = new ArrayList();

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setLong(1, bean.getRoleId());

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new UserBean();

				bean.setId(rs.getLong(1));
				bean.setFirstName(rs.getString(2));
				bean.setLastName(rs.getString(3));
				bean.setLogIn(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setDob(rs.getDate(6));
				bean.setMobileNo(rs.getString(7));
				bean.setRoleId(rs.getLong(8));
				bean.setUnSuccessfullLogin(rs.getInt(9));
				bean.setGender(rs.getString(10));
				bean.setLastLogin(rs.getTimestamp(11));
				bean.setLock(rs.getString(12));
				bean.setRegisteredIP(rs.getString(13));
				bean.setLastloginIP(rs.getString(14));
				bean.setCreatedBy(rs.getString(15));
				bean.setModifiedBy(rs.getString(16));
				bean.setCreatedDatetime(rs.getTimestamp(17));
				bean.setModifiedDatetime(rs.getTimestamp(18));

				list.add(bean);
			}
			rs.close();
		} catch (Exception e) {
			log.error("Database Exception...", e);
			throw new ApplicationException("Exception : Exception in get roles");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model get role ended");
		return list;
	}

	/**
	 * 
	 * Change Password of User with auto generated Password
	 *
	 */
	public boolean changePassword(Long id, String oldPassword, String newPassword)
			throws ApplicationException, RecordNotFoundException {
		log.debug("Model change password started");
		boolean flag = false;
		UserBean beanExist = null;

		beanExist = findByPK(id);

		if (beanExist != null && beanExist.getPassword().equals(oldPassword)) {
			beanExist.setPassword(newPassword);

			try {
				update(beanExist);
			} catch (DuplicateRecordException e) {
				log.error(e);
				throw new ApplicationException("Login ID Already Exists");
			}
			flag = true;
		} else {
			throw new RecordNotFoundException("Old Password Doesn't Match");
		}

		HashMap<String, String> map = new HashMap<String, String>();

		map.put("login", beanExist.getLogIn());
		map.put("password", beanExist.getPassword());
		map.put("firstName", beanExist.getFirstName());
		map.put("lastName", beanExist.getLastName());

		String message = EmailBuilder.getChangePasswordMessage(map);

		EmailMassage msg = new EmailMassage();

		msg.setTo(beanExist.getLogIn());
		msg.setSubject("SUNRAYS ORS Password has been changed successfully");
		msg.setMessage(message);
		msg.setMassageType(EmailMassage.HTML_MSG);

		EmailUtility.sendMail(msg);

		log.debug("Model Changepassword ended");
		return flag;
	}

	public UserBean updateAccess(UserBean bean) {
		return null;
	}

	/**
	 * 
	 * Register a user
	 *
	 */

	public long registerUser(UserBean bean) throws ApplicationException, DuplicateRecordException {
		log.debug("Model Register User Started");
		long pk = add(bean);

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("login", bean.getLogIn());
		map.put("password", bean.getPassword());

		String message = EmailBuilder.getUserRegistrationMessage(map);

		EmailMassage msg = new EmailMassage();

		msg.setTo(bean.getLogIn());
		msg.setSubject("Registration is successful for ORS Project SunilOS");
		msg.setMessage(message);
		msg.setMassageType(EmailMassage.HTML_MSG);

		EmailUtility.sendMail(msg);
		log.debug("Model Register User Ended");
		return pk;
	}

	/**
	 * 
	 * Reset Password of User with auto generated Password
	 *
	 */
	public boolean resetPassword(UserBean bean) throws ApplicationException {
		String newPassword = String.valueOf(new Date().getTime()).substring(0, 4);

		UserBean userData = findByPK(bean.getId());
		userData.setPassword(newPassword);

		try {
			update(bean);
		} catch (DuplicateRecordException e) {
			return false;
		}

		HashMap<String, String> map = new HashMap<String, String>();

		map.put("login", bean.getLogIn());
		map.put("password", bean.getPassword());
		map.put("firstName", bean.getFirstName());
		map.put("lastName", bean.getLastName());

		String message = EmailBuilder.getForgetPasswordMessage(map);

		EmailMassage msg = new EmailMassage();

		msg.setTo(bean.getLogIn());
		msg.setSubject("Password has been reset");
		msg.setMessage(message);
		msg.setMassageType(EmailMassage.HTML_MSG);

		EmailUtility.sendMail(msg);
		return true;
	}
	/**
	 * 
     * Send the password of User to his Email
     *
     */
	public boolean forgetPassword(String login) throws ApplicationException, RecordNotFoundException {
		UserBean userData = findByLogin(login);

		boolean flag = false;

		if (userData == null) {
			throw new RecordNotFoundException("Email Id Does Not Exists");
		}

		HashMap<String, String> map = new HashMap<String, String>();

		map.put("login", userData.getLogIn());
		map.put("password", userData.getPassword());
		map.put("firstName", userData.getFirstName());
		map.put("lastName", userData.getLastName());

		String message = EmailBuilder.getForgetPasswordMessage(map);

		EmailMassage msg = new EmailMassage();

		msg.setTo(userData.getLogIn());
		msg.setSubject("SUNRAYS ORS Password Reset");
		msg.setMessage(message);
		msg.setMassageType(EmailMassage.HTML_MSG);

		EmailUtility.sendMail(msg);
		flag = true;
		return flag;
	}
}
