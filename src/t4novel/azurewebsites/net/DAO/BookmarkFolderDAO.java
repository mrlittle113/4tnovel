package t4novel.azurewebsites.net.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import t4novel.azurewebsites.net.models.BookMarkFolder;

public class BookmarkFolderDAO {
	private Connection cnn;
	private static final NextIdGenrator NEXT_ID_GENRATOR;
	static {
		NEXT_ID_GENRATOR = new NextIdGenrator("BMFOLDER");
	}
	public BookmarkFolderDAO(Connection databaseConnection) {
		this.cnn = databaseConnection;
	}

	public List<BookMarkFolder> getBookmarkFolderByUser(int userID) throws Exception {
		LinkedList<BookMarkFolder> listBookmarkFolder = new LinkedList<>();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM BMFOLDER WHERE ID_ACC = ?";

		try {
			stmt = cnn.prepareStatement(query);
			stmt.setInt(1, userID);
			rs = stmt.executeQuery();

			while (rs.next()) {
				BookMarkFolder bmFolder = new BookMarkFolder();
				bmFolder.setId(rs.getInt(1));
				bmFolder.setAccountOnwerID(rs.getInt(2));
				bmFolder.setTitle(rs.getString(3));
				listBookmarkFolder.add(bmFolder);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
		}
		return listBookmarkFolder;
	}

	public List<BookMarkFolder> getAllBookmarkFolder() throws Exception {
		LinkedList<BookMarkFolder> listBookmarkFolder = new LinkedList<>();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM BMFOLDER";

		try {
			stmt = cnn.prepareStatement(query);
			rs = stmt.executeQuery();

			while (rs.next()) {
				BookMarkFolder bmFolder = new BookMarkFolder();
				bmFolder.setId(rs.getInt(1));
				bmFolder.setAccountOnwerID(rs.getInt(2));
				bmFolder.setTitle(rs.getString(3));
				listBookmarkFolder.add(bmFolder);
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
		}
		return listBookmarkFolder;
	}

	public void insertBookmarkFolder(BookMarkFolder bookmarkFolder) throws SQLException {
		PreparedStatement stmt = null;
		String query = "INSERT INTO BMFOLDER (ID_ACC, TITLE) VALUES (?, ?)";

		try {
			cnn.setAutoCommit(false);
			stmt = cnn.prepareStatement(query);
			stmt.setInt(1, bookmarkFolder.getAccountOnwerID());
			stmt.setString(2, bookmarkFolder.getTitle());
			stmt.executeUpdate();
			cnn.commit();
		} catch (SQLException e) {
			cnn.rollback();
			e.printStackTrace();
		} finally {
			cnn.setAutoCommit(true);
			if (stmt != null)
				stmt.close();
		}
	}

	public void deleteBookmarkFolderByID(int folderID) throws Exception {
		PreparedStatement stmt = null;
		String query = "DELETE FROM BMFOLDER WHERE ID = ?";

		try {
			cnn.setAutoCommit(false);
			stmt = cnn.prepareStatement(query);
			stmt.setInt(1, folderID);
			stmt.executeUpdate();
			cnn.commit();
		} catch (Exception e) {
			cnn.rollback();
			e.printStackTrace();
		} finally {
			cnn.setAutoCommit(true);
			if (stmt != null)
				stmt.close();
		}
	}

	public void updateBookmarkFolder(BookMarkFolder bookmakFolder) throws Exception {
		PreparedStatement stmt = null;
		String query = "UPDATE BMFOLDER SET TITLE = ? WHERE ID = ?";
		try {
			cnn.setAutoCommit(false);
			stmt = cnn.prepareStatement(query);
			stmt.setString(1, bookmakFolder.getTitle());
			stmt.setInt(2, bookmakFolder.getId());
			stmt.executeUpdate();
			cnn.commit();
		} catch (Exception e) {
			cnn.rollback();
			e.printStackTrace();
		} finally {
			cnn.setAutoCommit(true);
			if (stmt != null)
				stmt.close();
		}
	}
	public int getNextId() throws Exception {
		return NEXT_ID_GENRATOR.nextAutoIncrementId(cnn);	
	}
}
