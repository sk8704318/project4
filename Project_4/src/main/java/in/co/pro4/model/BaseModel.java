package in.co.pro4.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import org.apache.log4j.Logger;

import in.co.pro4.bean.DropdownListBean;
import in.co.pro4.exception.ApplicationException;
import in.co.pro4.exception.DatabaseException;
import in.co.pro4.utility.DataUtility;
import in.co.pro4.utility.JDBCDataSource;

/**
 * 
 * JDBC implementation of BaseModel.
 * @author Sanjay Kumar
 */
public abstract class BaseModel implements Serializable, DropdownListBean, Comparable<BaseModel> {

	private static Logger log = Logger.getLogger(BaseModel.class);

	protected long id;
	protected String createdBy;
	protected String modifiedBy;
	protected Timestamp createdDatetime;
	protected Timestamp modifiedDatetime;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public Timestamp getCreatedDatetime() {
		return createdDatetime;
	}

	public void setCreatedDatetime(Timestamp createdDatetime) {
		this.createdDatetime = createdDatetime;
	}

	public Timestamp getModifiedDatetime() {
		return modifiedDatetime;
	}

	public void setModifiedDatetime(Timestamp modifiedDatetime) {
		this.modifiedDatetime = modifiedDatetime;
	}

	
	/**
	 * Compares IDs ( Primary Key). If keys are equals then objects are equals.
	 *
	 */
	@Override
	public int compareTo(BaseModel next) {
		return (int) (id - next.getId());
	}

	
	/**
	 * created next PK of record
	 *
	 * @throws DatabaseException
	 */
	public long nextPK() throws DatabaseException {

		log.debug("Model nextPK Started");

		Connection conn = null;

		long pk = 0;

		try {
			conn = JDBCDataSource.getConnection();

			PreparedStatement pstmt = conn.prepareStatement("SELECT MAX(ID) FROM " + getTableName());

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				pk = rs.getInt(1);
			}
			rs.close();
		} catch (Exception e) {
			log.error("DataBase Exception : ", e);
			throw new DatabaseException("Exception: Exception in getting PK");
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		log.debug("Model nextPK End");
		return pk + 1;

	}

	/**
	 * Gets table name of Model
	 *
	 * @return
	 */
	public abstract String getTableName();

	
	/**
	 * Updates created by info
	 *
	 * @throws ApplicationException
	 *
	 * @throws Exception
	 */
	public void updateCreatedInfo() throws ApplicationException {
		log.debug("Model update started : " + createdBy);

		Connection conn = null;

		String sql = "UPDATE " + getTableName() + " SET CREATED_BY=?, CREATED_DATETIME=?, WHERE ID=?";

		log.debug(sql);

		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false);

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, createdBy);
			pstmt.setTimestamp(2, DataUtility.getCurrentTimestamp());
			pstmt.setLong(1, id);

			pstmt.executeUpdate();
			conn.commit();
			pstmt.close();

		} catch (SQLException e) {
			log.error("Database Exception ", e);
			JDBCDataSource.trnRollback(conn);
			throw new ApplicationException(e.toString());

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		log.debug("Model update end");

	}

	
	/**
	 * Updates modified by info
	 *
	 * @param model
	 * @throws Exception
	 */
	public void updateModifiedInfo() throws Exception {
		log.debug("Model update started " + modifiedBy);

		Connection conn = null;

		String sql = "UPDATE " + getTableName() + " SET MODIFIED_BY=?, MODIFIED_DATETIME=? WHERE ID=?";

		try {
			conn = JDBCDataSource.getConnection();
			conn.setAutoCommit(false);

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, modifiedBy);
			pstmt.setTimestamp(2, DataUtility.getCurrentTimestamp());
			pstmt.setLong(3, id);

			pstmt.executeUpdate();
			conn.commit();
			pstmt.close();

		} catch (SQLException e) {
			log.error("Database Exception ", e);
			JDBCDataSource.trnRollback(conn);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCDataSource.closeConnection(conn);
		}

		log.debug("Model Update Modified End");
	}


	/**
	 * Populate Model from ResultSet
	 *
	 * @param model
	 * @param rs
	 * @return
	 */
	protected <T extends BaseModel> T populateModel(T model, ResultSet rs) throws SQLException {

		model.setId(rs.getLong("ID"));
		model.setCreatedBy(rs.getString("CREATED_BY"));
		model.setModifiedBy(rs.getString("MODIFIED_BY"));
		model.setCreatedDatetime(rs.getTimestamp("CREATED_DATETIME"));
		model.setModifiedDatetime(rs.getTimestamp("MODIFIED_DATETIME"));

		return model;
	}
	
	public int CompareTo(BaseModel arg0) {
		// TODO Auto-generated method stub
		return 0;
	}
}
