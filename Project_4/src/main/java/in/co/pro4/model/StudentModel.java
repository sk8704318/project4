package in.co.pro4.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import org.apache.log4j.Logger;

import in.co.pro4.bean.CollegeBean;
import in.co.pro4.bean.StudentBean;
import in.co.pro4.exception.ApplicationException;
import in.co.pro4.exception.DatabaseException;
import in.co.pro4.exception.DuplicateRecordException;
import in.co.pro4.utility.JDBCDataSource;

/**
 * JDBC implementation of StudentModel
 * @author Sanjay Kumar
 *
 */
public class StudentModel {
	private static Logger log = Logger.getLogger(StudentModel.class);
	/**
	 * 
	 * Next PK of Student
	 *
	 */
	public static Integer nextPK() throws DatabaseException {
		log.debug("Model NextPK Started");
		Connection conn = null;
		int pk = 0;

		try {
			conn = JDBCDataSource.getConnection();

			PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(ID) FROM ST_STUDENT");
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				pk = rs.getInt(1);
			}
			rs.close();
		} catch (Exception e) {
			log.error("Database Exception....", e);
			throw new DatabaseException("Exception : in getting NextPK");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model NextPK Ended");
		return pk + 1;

	}
	/**
	 * 
	 * Add a Student
	 *
	 */
	public static long add(StudentBean bean) throws DuplicateRecordException, ApplicationException {
		log.debug("Model Add Started");
		Connection conn = null;

		CollegeModel cModel = new CollegeModel();
		CollegeBean collegebean = cModel.findByPK(bean.getCollegeId());
		bean.setCollegeName(collegebean.getName());

		int pk = 0;
		StudentBean duplicateName = findByEmail(bean.getEmail());

		if (duplicateName != null) {
			throw new DuplicateRecordException("Email Already Exists");
		}
		try {
			conn = JDBCDataSource.getConnection();
			pk = nextPK();
			conn.setAutoCommit(false);
			PreparedStatement pstmt = conn
					.prepareStatement("INSERT INTO ST_STUDENT VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

			pstmt.setInt(1, pk);
			pstmt.setLong(2, bean.getCollegeId());
			pstmt.setString(3, bean.getCollegeName());
			pstmt.setString(4, bean.getFirstName());
			pstmt.setString(5, bean.getLastName());
			pstmt.setDate(6, new java.sql.Date(bean.getDob().getTime()));
			pstmt.setString(7, bean.getMobileNo());
			pstmt.setString(8, bean.getEmail());
			pstmt.setString(9, bean.getCreatedBy());
			pstmt.setString(10, bean.getModifiedBy());
			pstmt.setTimestamp(11, bean.getCreatedDatetime());
			pstmt.setTimestamp(12, bean.getModifiedDatetime());

			pstmt.executeUpdate();
			conn.commit();
			pstmt.close();
		} catch (Exception e) {
			log.error("Database Exception...", e);

			try {
				conn.rollback();
			} catch (SQLException e1) {
				throw new ApplicationException("Exception : add rollback " + e1.getMessage());
			}
			throw new ApplicationException("Exception : Exception in add student");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model Add Student Ended");
		return pk;

	}
	/**
	 * 
	 * Update a Student
	 *
	 */
	
	public void update(StudentBean bean) throws DuplicateRecordException, ApplicationException {
		log.debug("Model Update Started");
		Connection conn = null;

		StudentBean beanExist = findByEmail(bean.getEmail());
		if (beanExist != null && beanExist.getId() != bean.getId()) {
			throw new DuplicateRecordException("Email id is Already Exists");
		}

		CollegeModel cModel = new CollegeModel();
		CollegeBean collegeBean = cModel.findByPK(bean.getCollegeId());
		bean.setCollegeName(collegeBean.getName());

		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false);

			PreparedStatement pstmt = conn.prepareStatement(
					"UPDATE ST_STUDENT SET COLLEGE_ID=?, COLLEGE_NAME=?, FIRST_NAME=?, LAST_NAME=?, DATE_OF_BIRTH=?, MOBILE_NO=?, EMAIL_ID=?, CREATED_BY=?, MODIFIED_BY=?, CREATED_DATETIME=?, MODIFIED_DATETIME=?  WHERE ID=?");
			pstmt.setLong(1, bean.getCollegeId());
			pstmt.setString(2, bean.getCollegeName());
			pstmt.setString(3, bean.getFirstName());
			pstmt.setString(4, bean.getLastName());
			pstmt.setDate(5, new java.sql.Date(bean.getDob().getTime()));
			pstmt.setString(6, bean.getMobileNo());
			pstmt.setString(7, bean.getEmail());
			pstmt.setString(8, bean.getCreatedBy());
			pstmt.setString(9, bean.getModifiedBy());
			pstmt.setTimestamp(10, bean.getCreatedDatetime());
			pstmt.setTimestamp(11, bean.getModifiedDatetime());
			pstmt.setLong(12, bean.getId());

			pstmt.executeUpdate();
			conn.commit();
			pstmt.close();
		} catch (Exception e) {
			log.error("Database Exception....", e);
			try {
				conn.rollback();
			} catch (SQLException e1) {
				throw new ApplicationException("Exception : Delete Rollback Exception" + e1.getMessage());
			}

			throw new ApplicationException("Exception in updating student");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model Update Ended");
	}
	/**
	 * 
	 * Delete a Student
	 *
	 */
	public void delete(StudentBean bean) throws ApplicationException {
		log.debug("Model Delete Student Started");

		Connection conn = null;

		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement pstmt = conn.prepareStatement("DELETE FROM ST_STUDENT WHERE ID=?");

			pstmt.setLong(1, bean.getId());
			pstmt.executeUpdate();
			conn.commit();
			pstmt.close();
		} catch (Exception e) {
			log.error("Database Exception....", e);

			try {
				conn.rollback();
			} catch (Exception e2) {
				throw new ApplicationException("Exception : Delete Rollback Exception" + e2.getMessage());
			}

			throw new ApplicationException("Exception : In Delete Student");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model Delete From Student Ended");
	}

	/**
	 * 
	 * Find Student by Email
	 *
	 */
	public static StudentBean findByEmail(String Email) throws ApplicationException {
		log.debug("Model Find by email started");
		Connection conn = null;
		StudentBean bean = null;
		StringBuffer sql = new StringBuffer("SELECT * FROM ST_STUDENT WHERE EMAIL_ID=?");

		try {
			conn = JDBCDataSource.getConnection();

			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, Email);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				bean = new StudentBean();

				bean.setId(rs.getLong(1));
				bean.setCollegeId(rs.getLong(2));
				bean.setCollegeName(rs.getString(3));
				bean.setFirstName(rs.getString(4));
				bean.setLastName(rs.getString(5));
				bean.setDob(rs.getDate(6));
				bean.setMobileNo(rs.getString(7));
				bean.setEmail(rs.getString(8));
				bean.setCreatedBy(rs.getString(9));
				bean.setModifiedBy(rs.getString(10));
				bean.setCreatedDatetime(rs.getTimestamp(11));
				bean.setModifiedDatetime(rs.getTimestamp(12));

			}
			rs.close();
		} catch (Exception e) {
			log.error("Database EXception...", e);
			throw new ApplicationException("Exception : in getting user find by email");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model Find By Email Ended");
		return bean;
	}
		
	/**
	 * 
	 * Find Student by PK
	 *
	 */
	public StudentBean findByPK(long pk) throws ApplicationException {
		log.debug("Model Find Student By Pk Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM ST_STUDENT WHERE ID=?");
		StudentBean bean = null;
		Connection conn = null;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setLong(1, pk);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new StudentBean();

				bean.setId(rs.getLong(1));
				bean.setCollegeId(rs.getLong(2));
				bean.setCollegeName(rs.getString(3));
				bean.setFirstName(rs.getString(4));
				bean.setLastName(rs.getString(5));
				bean.setDob(rs.getDate(6));
				bean.setMobileNo(rs.getString(7));
				bean.setEmail(rs.getString(8));
				bean.setCreatedBy(rs.getString(9));
				bean.setModifiedBy(rs.getString(10));
				bean.setCreatedDatetime(rs.getTimestamp(11));
				bean.setModifiedDatetime(rs.getTimestamp(12));
			}
			rs.close();
		} catch (Exception e) {
			log.error("Database Exception....", e);
			throw new ApplicationException("Exception : in getting user by pk");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model Find Student By Pk Ended");
		return bean;
	}

	
	/**
	 * 
     * Get Search of Student
     *
     */

	public List search(StudentBean bean) throws ApplicationException {
		return search(bean, 0, 0);
	}

	/**
	 * 
	 * Search Student with pagination
	 *
	 *
	 */

	public List search(StudentBean bean, int pageNo, int pageSize) throws ApplicationException {
		log.debug("Model Search started");
		StringBuffer sql = new StringBuffer("SELECT * FROM ST_STUDENT WHERE 1=1 ");

		if (bean != null) {
			if (bean.getId() > 0) {
				sql.append("AND ID=" + bean.getId());
			}
			if (bean.getFirstName() != null && bean.getFirstName().length() > 0) {
				sql.append("AND FIRST_NAME LIKE '" + bean.getFirstName() + "%'");
			}
			if (bean.getLastName() != null && bean.getLastName().length() > 0) {
				sql.append("AND LAST_NAME LIKE '" + bean.getLastName() + "%'");
			}
			if (bean.getDob() != null && bean.getDob().getDate() > 0) {
				sql.append("AND DATE_OF_BIRTH " + bean.getDob());
			}
			if (bean.getMobileNo() != null && bean.getMobileNo().length() > 0) {
				sql.append("AND MOBILE_NO LIKE '" + bean.getMobileNo() + "%'");
			}
			if (bean.getEmail() != null && bean.getEmail().length() > 0) {
				sql.append("AND EMAIL_ID LIKE '" + bean.getEmail() + "%'");
			}
			if (bean.getCollegeName() != null && bean.getCollegeName().length() > 0) {
				sql.append("AND COLLEGE_NAME LIKE '" + bean.getCollegeName() + "%'");
			}
			if (bean.getCollegeId() != 0 && bean.getCollegeId() > 0) {
				sql.append("AND COLLEGE_ID =" + bean.getCollegeId() );
			}
		}

		if (pageSize > 0) {
			pageNo = (pageNo - 1) * pageSize;

			sql.append(" LIMIT " + pageNo + "," + pageSize);
		}

		ArrayList list = new ArrayList();
		Connection conn = null;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new StudentBean();

				bean.setId(rs.getLong(1));
				bean.setCollegeId(rs.getLong(2));
				bean.setCollegeName(rs.getString(3));
				bean.setFirstName(rs.getString(4));
				bean.setLastName(rs.getString(5));
				bean.setDob(rs.getDate(6));
				bean.setMobileNo(rs.getString(7));
				bean.setEmail(rs.getString(8));
				bean.setCreatedBy(rs.getString(9));
				bean.setModifiedBy(rs.getString(10));
				bean.setCreatedDatetime(rs.getTimestamp(11));
				bean.setModifiedDatetime(rs.getTimestamp(12));

				list.add(bean);
			}
			rs.close();
		} catch (Exception e) {
			log.error("Database Exception.....", e);
			throw new ApplicationException("Exception : Exception in search student");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model Search Ended");
		return list;
	}
	/**
	 * 
     * Get List of Student
     *
     */

	public List list() throws ApplicationException {
		return list(0, 0);
	}
	/**
	 * 
     * Get List of Student with Pagination
     *
     */

	public List list(int pageNo, int pageSize) throws ApplicationException {
		log.debug("Model List Started");
		ArrayList list = new ArrayList();

		StringBuffer sql = new StringBuffer("SELECT * FROM ST_STUDENT");

		if (pageSize > 0) {

			pageNo = (pageNo - 1) * pageSize;

			sql.append(" LIMIT " + pageNo + "," + pageSize);
		}

		Connection conn = null;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				StudentBean bean = new StudentBean();
				bean.setId(rs.getLong(1));
				bean.setCollegeId(rs.getLong(2));
				bean.setCollegeName(rs.getString(3));
				bean.setFirstName(rs.getString(4));
				bean.setLastName(rs.getString(5));
				bean.setDob(rs.getDate(6));
				bean.setMobileNo(rs.getString(7));
				bean.setEmail(rs.getString(8));
				bean.setCreatedBy(rs.getString(9));
				bean.setModifiedBy(rs.getString(10));
				bean.setCreatedDatetime(rs.getTimestamp(11));
				bean.setModifiedDatetime(rs.getTimestamp(12));

				list.add(bean);
			}
			rs.close();
		} catch (Exception e) {
			log.error("Database Exception....", e);
			throw new ApplicationException("Exception : in getting list of student");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model List Ended");
		return list;
	}
}
