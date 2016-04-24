package dao;

import lib.ConnectDbLib;
import model.Animal;

public class AnimalDAO extends AbstractDAO {
	public AnimalDAO() {
		dbAccess = new ConnectDbLib();
	}
	
	public boolean addNewAnimal(Animal newAnimal) {
		boolean ok = false;
		try {		
			connection =  dbAccess.getConnectMySQL();
			String sql = "INSERT INTO Animal (AnimalID, AnimalName, SpeciesID, Gender, Weight, Height, HealthStatus, Description, CellID) VALUE (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, newAnimal.getAnimalID());
			preparedStatement.setString(1, newAnimal.getAnimalName());
			preparedStatement.setString(1, newAnimal.getSpeciesID());
			preparedStatement.setBoolean(1, newAnimal.getGender());
			preparedStatement.setDouble(1, newAnimal.getWeight());
			preparedStatement.setDouble(1, newAnimal.getHeight());
			preparedStatement.setString(1, newAnimal.getHealthStatus());
			preparedStatement.setString(1, newAnimal.getDescription());
			preparedStatement.setString(1, newAnimal.getCellID());	
			
			ok = (preparedStatement.executeUpdate() == 1);					
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
		return ok;
	}
}
