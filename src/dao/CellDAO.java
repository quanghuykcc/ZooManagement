package dao;

import java.util.ArrayList;

import lib.ConnectDbLib;
import model.Cell;
import model.Region;

public class CellDAO extends AbstractDAO {
	public CellDAO() {
		dbAccess = new ConnectDbLib();
	}
	
	public ArrayList<Cell> getAllCells() {
		ArrayList<Cell> cellList = new ArrayList<Cell>();
		try {		
			connection =  dbAccess.getConnectMySQL();
			String sql = "SELECT * FROM cell";
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Cell cell = new Cell(resultSet.getString("CellID"),
						resultSet.getString("CellName"),
						resultSet.getString("RegionID"),
						resultSet.getString("SpeciesID"),
						resultSet.getInt("Capacity"),
						resultSet.getInt("CellStatusID"),
						resultSet.getString("Description"));
				cellList.add(cell);
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
		return cellList;
	}
}
