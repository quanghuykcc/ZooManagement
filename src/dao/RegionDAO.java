package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import lib.ConnectDbLib;
import model.Region;

public class RegionDAO {
	ConnectDbLib dbAccess;
	PreparedStatement preparedStatement;
	ResultSet resultSet;
	Connection connection;

	
	public Region getRegionById(String id) {
		Region region = null;
		try {
			dbAccess = new ConnectDbLib();
			connection =  dbAccess.getConnectMySQL();
			String sql = "SELECT * FROM region WHERE RegionID like ?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, id);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {				
				region = new Region(resultSet.getString("RegionID"),
						resultSet.getString("RegionName"), 
						resultSet.getInt("RegionStatusID"),
						resultSet.getDouble("RegionArea"),
						resultSet.getString("Description"));								
				
			}
		}
		catch (Exception ex) {
		}
		finally {
			try {
				resultSet.close();
				preparedStatement.close();
				connection.close();
			}
			catch (Exception ex) {
				
			}
		}
		return region;
		
		
	}
}
