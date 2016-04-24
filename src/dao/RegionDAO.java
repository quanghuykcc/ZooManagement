package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import lib.ConnectDbLib;
import model.Region;

public class RegionDAO extends AbstractDAO {
	
	
	public RegionDAO() {
		dbAccess = new ConnectDbLib();
	}

	
	public ArrayList<Region> getAllRegions() {
		ArrayList<Region> regionList = new ArrayList<Region>();
		try {		
			connection =  dbAccess.getConnectMySQL();
			String sql = "SELECT * FROM region";
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Region region = new Region(resultSet.getString("RegionID"),
						resultSet.getString("RegionName"), 
						resultSet.getInt("RegionStatusID"),
						resultSet.getDouble("RegionArea"),
						resultSet.getString("Description"));
				regionList.add(region);
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
		return regionList;
	}


	public Region getRegionById(String id) {
		Region region = null;
		try {		
			connection =  dbAccess.getConnectMySQL();
			String sql = "SELECT * FROM region WHERE RegionID like ?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, id);
			resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
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
