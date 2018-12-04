package t4novel.azurewebsites.net.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import t4novel.azurewebsites.net.models.Chap;

public class ChapDAO {

	private Connection cnn;
	private static final NextIdGenrator NEXT_ID_GENRATOR;
	static {
		NEXT_ID_GENRATOR = new NextIdGenrator("CHAP");
	}

	public ChapDAO(Connection databaseConnection) {
		this.cnn = databaseConnection;
	}

	public void insertChap(Chap chap) throws Exception {
		PreparedStatement stmt = null;
		String querry = "INSERT INTO CHAP (ID_VOL, ID_NOVEL, TITLE ,CONTENT) VALUES (?, ?, ? , ?)";
		try {
			cnn.setAutoCommit(false);
			stmt = cnn.prepareStatement(querry);
			stmt.setInt(1, chap.getVolOwnerId());
			stmt.setInt(2, chap.getNovelOwnerId());
			stmt.setString(3, chap.getTitle());
			stmt.setString(4, chap.getContent());
			stmt.executeUpdate();
			cnn.commit();
			System.out.println("Insert chap completed!");
			System.out.println("insert chap content: " + chap.getContent());
		} catch (SQLException e) {
			cnn.rollback();
			e.printStackTrace();
		} finally {
			cnn.setAutoCommit(true);
			if (stmt != null)
				stmt.close();
		}
	}

	public Chap getChapByID(int chapID) throws Exception {
		Chap chap = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String querry = "SELECT * FROM CHAP WHERE ID = ?";
		try {
			stmt = cnn.prepareStatement(querry);
			stmt.setInt(1, chapID);
			rs = stmt.executeQuery();
			if (rs.next()) {
				chap = new Chap();
				chap.setId(rs.getInt("ID"));
				chap.setVolOwnerId(rs.getInt("ID_VOL"));
				chap.setNovelOwnerId(rs.getInt("ID_NOVEL"));
				chap.setTitle(rs.getString("TITLE"));
				chap.setContent(rs.getString("CONTENT"));
				chap.setDateUp(rs.getDate("DATEUP"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
		}
		return chap;
	}

	public List<Chap> getEntireChapsByVolId(int volID) throws Exception {
		LinkedList<Chap> listChap = new LinkedList<>();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String querry = "SELECT * FROM CHAP WHERE ID_VOL = ?";

		try {
			stmt = cnn.prepareStatement(querry);
			stmt.setInt(1, volID);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Chap chap = new Chap();
				chap.setId(rs.getInt("ID"));
				chap.setVolOwnerId(rs.getInt("ID_VOL"));
				chap.setNovelOwnerId(rs.getInt("ID_NOVEL"));
				chap.setTitle(rs.getString("TITLE"));
				chap.setContent(rs.getString("CONTENT"));
				chap.setDateUp(rs.getDate("DATEUP"));
				listChap.add(chap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
		}
		return listChap;
	}

	public List<Chap> getPartOfChapsByVolId(int volId) throws SQLException {
		LinkedList<Chap> listChap = new LinkedList<>();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String querry = "SELECT ID , ID_NOVEL , TITLE , DATEUP FROM CHAP WHERE ID_VOL = ?";

		try {
			stmt = cnn.prepareStatement(querry);
			stmt.setInt(1, volId);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Chap chap = new Chap();
				chap.setId(rs.getInt("ID"));
				chap.setVolOwnerId(volId);
				chap.setNovelOwnerId(rs.getInt("ID_NOVEL"));
				System.out.println("loading chap title : " + rs.getString("TITLE"));
				chap.setTitle(rs.getString("TITLE"));
				chap.setDateUp(rs.getDate("DATEUP"));
				listChap.add(chap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
		}
		return listChap;
	}

	public void getContentOfChap(Chap chap) throws Exception {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String querry = "SELECT CONTENT FROM CHAP WHERE ID = ?";

		try {
			stmt = cnn.prepareStatement(querry);
			stmt.setInt(1, chap.getId());
			rs = stmt.executeQuery();
			while (rs.next()) {
				String content = rs.getString("CONTENT");
				if (content == null)
					chap.setContent("");
				else
					chap.setContent(content);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
		}
	}

	public void deleteChapByID(int chapID) throws Exception {
		PreparedStatement stmt = null;
		String querry = "DELETE FROM CHAP WHERE ID = ?";
		System.out.println("is cnn null " + (cnn == null));

		try {
			cnn.setAutoCommit(false);
			stmt = cnn.prepareStatement(querry);
			stmt.setInt(1, chapID);
			stmt.executeUpdate();
			cnn.commit();
			System.out.println("Delete chap completed!");
		} catch (Exception e) {
			cnn.rollback();
			e.printStackTrace();
		} finally {
			cnn.setAutoCommit(true);
			if (stmt != null)
				stmt.close();
		}
	}

	public void deleteChapByVolID(int chapID) throws Exception {
		PreparedStatement stmt = null;
		String querry = "DELETE FROM CHAP WHERE ID_VOL = ?";
		System.out.println("is cnn null " + (cnn == null));

		try {
			cnn.setAutoCommit(false);
			stmt = cnn.prepareStatement(querry);
			stmt.setInt(1, chapID);
			stmt.executeUpdate();
			cnn.commit();
			System.out.println("Delete chap completed!");
		} catch (Exception e) {
			cnn.rollback();
			e.printStackTrace();
		} finally {
			cnn.setAutoCommit(true);
			if (stmt != null)
				stmt.close();
		}
	}

	public void updateChap(Chap chap) throws Exception {
		PreparedStatement stmt = null;
		String query = "UPDATE CHAP set ID_VOL = ? , ID_NOVEL = ? , TITLE = ? , CONTENT = ? WHERE ID = ?";

		try {
			cnn.setAutoCommit(false);
			stmt = cnn.prepareStatement(query);
			stmt.setInt(1, chap.getVolOwnerId());
			stmt.setInt(2, chap.getNovelOwnerId());
			stmt.setString(3, chap.getTitle());
			stmt.setString(4, chap.getContent());
			stmt.setInt(5, chap.getId());
			stmt.executeUpdate();
			cnn.commit();
			System.out.println("Update chap completed");
		} catch (Exception e) {
			cnn.rollback();
			e.printStackTrace();
		} finally {
			cnn.setAutoCommit(true);
			if (stmt != null)
				stmt.close();
		}
	}

	public int getNextID() throws Exception {
		return NEXT_ID_GENRATOR.nextAutoIncrementId(cnn);
	}

}
