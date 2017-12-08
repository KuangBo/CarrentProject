package cn.carrent.dao.util;

import org.hibernate.Query;

import cn.carrent.dbc.HibernateSessionFactory;

public class AbstractDAOImpl {

	/*
	 * public boolean removeHandle(Set<?> ids, String tableName, String idName)
	 * throws Exception { if (ids.size() == 0) { return false; } StringBuffer
	 * buf = new StringBuffer();
	 * buf.append("DELETE FROM ").append(tableName).append(" WHERE ").append(
	 * idName).append(" IN("); Iterator<?> iter = ids.iterator(); while
	 * (iter.hasNext()) { buf.append(iter.next()).append(","); }
	 * buf.delete(buf.length() - 1, buf.length()).append(")"); PreparedStatement
	 * pstmt = this.conn.prepareStatement(buf.toString()); return
	 * pstmt.executeUpdate() == ids.size(); }
	 */

	public Integer countHandle(String tableName, String column, String keyWord) throws Exception {
		String hql = "SELECT COUNT(*) FROM " + tableName + " AS m WHERE m." + column + " LIKE ?";
		Query query = HibernateSessionFactory.getSession().createQuery(hql);
		query.setString(0, "%" + keyWord + "%");
		return ((Long) query.uniqueResult()).intValue();
		/*
		 * String sql = "SELECT COUNT(*) FROM " + tableName + " WHERE " + column
		 * + " LIKE ?"; PreparedStatement pstmt =
		 * this.conn.prepareStatement(sql); pstmt.setString(1, "%" + keyWord +
		 * "%"); ResultSet rs = pstmt.executeQuery(); if (rs.next()) { return
		 * rs.getInt(1); } else { return 0; }
		 */
	}
}
