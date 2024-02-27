
package in.co.pro4.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import in.co.pro4.bean.CollegeBean;
import in.co.pro4.exception.ApplicationException;
import in.co.pro4.exception.DatabaseException;
import in.co.pro4.exception.DuplicateRecordException;
import in.co.pro4.utility.JDBCDataSource;

/**
 * JDBC implementation of CollegeModel
 * @author Sanjay Kumar
 * 
 */
public class CollegeModel {
	private static Logger log = Logger.getLogger(CollegeModel.class);
	/**
	 * 
	 * Next PK of College.
	 *
	 */
	public static long nextPK() throws DatabaseException {

		log.debug("Model nextPK started");

		Connection conn = null;

		long pk = 0;

		try {
			conn = JDBCDataSource.getConnection();

			PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(ID) FROM ST_COLLEGE");

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				pk = rs.getLong(1);
			}

			rs.close();

		} catch (Exception e) {
			log.error("Model Database Exception......", e);
			throw new DatabaseException("Exception: in getting nextPK");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model nextPK Ended");
		return pk + 1;
	}


	/**
	 * 
	 * Add a College.
	 *
	 */
	public static long add(CollegeBean bean) throws ApplicationException, DuplicateRecordException {

		log.debug("Model add started");
		Connection conn = null;
		long pk = 0;

		CollegeBean duplicateCollegeName = findByName(bean.getName());

		if (duplicateCollegeName != null) {
			throw new DuplicateRecordException("College name is Already Exixts");
		}

		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false);
			pk = nextPK();

			PreparedStatement pstmt = conn.prepareStatement("INSERT INTO ST_COLLEGE VALUES(?,?,?,?,?,?,?,?,?,?)");

			pstmt.setLong(1, pk);
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getAddress());
			pstmt.setString(4, bean.getState());
			pstmt.setString(5, bean.getCity());
			pstmt.setString(6, bean.getPhoneNo());
			pstmt.setString(7, bean.getCreatedBy());
			pstmt.setString(8, bean.getModifiedBy());
			pstmt.setTimestamp(9, bean.getCreatedDatetime());
			pstmt.setTimestamp(10, bean.getModifiedDatetime());

			pstmt.executeUpdate();
			conn.commit();
			pstmt.close();
		} catch (Exception e) {
			log.error("Database Exception...", e);

			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
				throw new ApplicationException("Exception : get roll back" + e1.getMessage());
			}
			throw new ApplicationException("Exception: Exception in add college");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model add Ended");
		return pk;

	}
	/**
	 * Update a College.
	 *
	 */
	public void update(CollegeBean bean) throws ApplicationException, DuplicateRecordException {
		log.debug("Model Update Started");
		Connection conn = null;
		CollegeBean beanExist = findByName(bean.getName());

		if (beanExist != null && beanExist.getId() != bean.getId()) {
			throw new DuplicateRecordException("College is Already Exist");
		}
		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement pstmt = conn.prepareStatement(
					"UPDATE ST_COLLEGE SET NAME=?, ADDRESS=?, STATE=?, CITY=?, PHONE_NO=?, CREATED_BY=?, MODIFIED_BY=?, CREATED_DATETIME=?, MODIFIED_DATETIME=? WHERE ID=?");
			pstmt.setString(1, bean.getName());
			pstmt.setString(2, bean.getAddress());
			pstmt.setString(3, bean.getState());
			pstmt.setString(4, bean.getCity());
			pstmt.setString(5, bean.getPhoneNo());
			pstmt.setString(6, bean.getCreatedBy());
			pstmt.setString(7, bean.getModifiedBy());
			pstmt.setTimestamp(8, bean.getCreatedDatetime());
			pstmt.setTimestamp(9, bean.getModifiedDatetime());
			pstmt.setLong(10, bean.getId());

			pstmt.executeUpdate();
			conn.commit();
			pstmt.close();
		} catch (Exception e) {
			log.error("Database Exception...", e);
			try {
				conn.rollback();
			} catch (SQLException e1) {
				throw new ApplicationException("Exception: Delete Rollback Exception " + e1.getMessage());
			}
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model Update Ended");
	}
	/**
	 * Delete a College.
	 *
	 */
	public void delete(CollegeBean bean) throws ApplicationException {
		log.debug("Model Delete Started");
		Connection conn = null;
		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement pstmt = conn.prepareStatement("DELETE FROM ST_COLLEGE WHERE ID=?");
			pstmt.setLong(1, bean.getId());
			pstmt.executeUpdate();
			conn.commit();
			pstmt.close();
		} catch (Exception e) {
			log.error("Database exception..", e);

			try {
				conn.rollback();

			} catch (SQLException e1) {
				throw new ApplicationException("Exception : delete rollback exception" + e1.getMessage());
			}
			throw new ApplicationException("Exception : in Delete college");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model Delete Ended");
	}


	/**
	 * Find College by Name.
	 *
	 */
	public static CollegeBean findByName(String name) throws ApplicationException {
		log.debug("Model College findByName Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM ST_COLLEGE WHERE NAME=?");

		Connection conn = null;
		CollegeBean bean = null;

		try {
			conn = JDBCDataSource.getConnection();

			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, name);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new CollegeBean();

				bean.setId(rs.getLong(1));
				bean.setName(rs.getString(2));
				bean.setAddress(rs.getString(3));
				bean.setState(rs.getString(4));
				bean.setCity(rs.getString(5));
				bean.setPhoneNo(rs.getString(6));
				bean.setCreatedBy(rs.getString(7));
				bean.setModifiedBy(rs.getString(8));
				bean.setCreatedDatetime(rs.getTimestamp(9));
				bean.setModifiedDatetime(rs.getTimestamp(10));
			}
			rs.close();
		} catch (Exception e) {
			log.error("Database Exception....", e);

			throw new ApplicationException("Exception : Exception in getting College By Name");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		
		log.debug("Model findByName Ended");
		return bean;
	}

	

	/**
	 * 
	 * Find College by PK.
	 *
	 */
	public CollegeBean findByPK(long pk) throws ApplicationException {

		log.debug("Model FindbyPK Started");

		StringBuffer sql = new StringBuffer("SELECT * FROM ST_COLLEGE WHERE ID=?");
		Connection conn = null;
		CollegeBean bean = null;

		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setLong(1, pk);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				bean = new CollegeBean();

				bean.setId(rs.getLong(1));
				bean.setName(rs.getString(2));
				bean.setAddress(rs.getString(3));
				bean.setState(rs.getString(4));
				bean.setCity(rs.getString(5));
				bean.setPhoneNo(rs.getString(6));
				bean.setCreatedBy(rs.getString(7));
				bean.setModifiedBy(rs.getString(8));
				bean.setCreatedDatetime(rs.getTimestamp(9));
				bean.setModifiedDatetime(rs.getTimestamp(10));
			}
			rs.close();
		} catch (Exception e) {
			log.error("Database Exception.....", e);
			throw new ApplicationException("Exception: Exception in college find by pk");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model College Findbypk Ended");
		return bean;
	}
	/**
	 * 
	 * Search a College.
	 *
	 */
	public List search(CollegeBean bean) throws ApplicationException {
		return search(bean, 0, 0);
	}
	
	/**
	 * 
	 * Search College with pagination
	 * 
	 */
	public List search(CollegeBean bean, int pageNo, int pageSize) throws ApplicationException {
		log.debug("Model Search Started");
		StringBuffer sql = new StringBuffer("SELECT * FROM ST_COLLEGE WHERE 1=1 ");

		if (bean != null) {
			if (bean.getId() > 0) {
				sql.append("AND id=" + bean.getId());
			}
			if (bean.getName() != null && bean.getName().length() > 0) {
				sql.append("AND NAME LIKE '" + bean.getName() + "%'");
			}
			if (bean.getAddress() != null && bean.getAddress().length() > 0) {
				sql.append("AND ADDRESS LIKE '" + bean.getAddress() + "%'");
			}
			if (bean.getState() != null && bean.getState().length() > 0) {
				sql.append("AND STATE LIKE '" + bean.getState() + "%'");
			}
			if (bean.getCity() != null && bean.getCity().length() > 0) {
				sql.append("AND CITY LIKE '" + bean.getCity() + "%'");
			}
			if (bean.getPhoneNo() != null && bean.getPhoneNo().length() > 0) {
				sql.append("AND PHONE_NO LIKE " + bean.getPhoneNo());
			}
		}
		if (pageSize > 0) {
			pageNo = (pageNo - 1) * pageSize;

			sql.append(" LIMIT " + pageNo + "," + pageSize);
		}

		System.out.println(sql.toString());
		
		ArrayList list = new ArrayList();
		Connection conn = null;
		System.out.println("In college model search list");
		try {
			conn = JDBCDataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				bean = new CollegeBean();
				bean.setId(rs.getLong(1));
				bean.setName(rs.getString(2));
				bean.setAddress(rs.getString(3));
				bean.setState(rs.getString(4));
				bean.setCity(rs.getString(5));
				bean.setPhoneNo(rs.getString(6));
				bean.setCreatedBy(rs.getString(7));
				bean.setModifiedBy(rs.getString(8));
				bean.setCreatedDatetime(rs.getTimestamp(9));
				bean.setModifiedDatetime(rs.getTimestamp(10));

				list.add(bean);
			}
			rs.close();

		} catch (Exception e) {
			log.error("Database Exception....", e);
			throw new ApplicationException("Exception : Exception in search college");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model Search Ended");
		return list;
	}

	/**
	 * 
	 * Get List of College
	 * 
	 */
	
	public List list() throws ApplicationException {
		return list(0, 0);
	}
	/**
	 * 
	 * Get List of College with Pagination
	 * 
	 */
	public List list(int pageNo, int pageSize) throws ApplicationException {
		log.debug("Model List Started");
		ArrayList list = new ArrayList();

		StringBuffer sql = new StringBuffer("SELECT * FROM ST_COLLEGE");

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
				CollegeBean bean = new CollegeBean();

				bean.setId(rs.getLong(1));
				bean.setName(rs.getString(2));
				bean.setAddress(rs.getString(3));
				bean.setState(rs.getString(4));
				bean.setCity(rs.getString(5));
				bean.setPhoneNo(rs.getString(6));
				bean.setCreatedBy(rs.getString(7));
				bean.setModifiedBy(rs.getString(8));
				bean.setCreatedDatetime(rs.getTimestamp(9));
				bean.setModifiedDatetime(rs.getTimestamp(10));

				list.add(bean);
			}
		} catch (Exception e) {
			log.error("Database Exception....", e);
			throw new ApplicationException("Exception : Exception in getting list or users");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}
		log.debug("Model List Ended");
		return list;

	}

}
