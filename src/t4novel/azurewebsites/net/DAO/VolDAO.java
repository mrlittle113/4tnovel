package t4novel.azurewebsites.net.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import t4novel.azurewebsites.net.models.Vol;

public class VolDAO {
	
	private Connection cnn;

	public VolDAO(Connection databaseConnection) {
		this.cnn = databaseConnection;
	}

	public void insertVol(Vol vol) {
		PreparedStatement stmt;
		String querry = "INSERT INTO VOL (ID, ID_LN, DESCRIBE, DATEUP) VALUES (?, ?, ?, ?)";
		try {
			stmt = cnn.prepareStatement(querry);
			stmt.setInt(1, vol.getId());
			stmt.setInt(2, vol.getNovelOwnerId());
			stmt.setString(3, vol.getDescription());
			stmt.setDate(4, (Date) vol.getDateUp());
			ResultSet rs = stmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}