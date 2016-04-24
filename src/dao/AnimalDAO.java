package dao;

import java.util.ArrayList;
import java.util.List;

import lib.ConnectDbLib;
import model.Animal;
import model.Cell;
import model.Region;


public class AnimalDAO extends AbstractDAO {
	public AnimalDAO() {
		dbAccess = new ConnectDbLib();
	}
	
	public boolean deleteAnimal(String animalID) {
		boolean ok = false;
		try {
			connection = dbAccess.getConnectMySQL();
			String sql = "DELETE FROM Animal WHERE AnimalID = ?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, animalID);
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
	
	public boolean updateAnimal(Animal updatedAnimal) {
		boolean ok = false;
		try {
			connection = dbAccess.getConnectMySQL();
			String sql = "UPDATE Animal SET AnimalName = ?, SpeciesID = ?, Gender = ?, Weight = ?, Height = ?, HealthStatus = ?, Description = ?, CellID = ? WHERE AnimalID = ?";
			preparedStatement = connection.prepareStatement(sql);			
			preparedStatement.setString(1, updatedAnimal.getAnimalName());
			preparedStatement.setString(2, updatedAnimal.getSpeciesID());
			preparedStatement.setBoolean(3, updatedAnimal.getGender());
			preparedStatement.setDouble(4, updatedAnimal.getWeight());
			preparedStatement.setDouble(5, updatedAnimal.getHeight());
			preparedStatement.setString(6, updatedAnimal.getHealthStatus());
			preparedStatement.setString(7, updatedAnimal.getDescription());
			preparedStatement.setString(8, updatedAnimal.getCellID());	
			preparedStatement.setString(9, updatedAnimal.getAnimalID());
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
	
	public ArrayList<Animal> getAllAnimals() {
		ArrayList<Animal> animalList = new ArrayList<Animal>();
		try {		
			connection =  dbAccess.getConnectMySQL();
			String sql = "SELECT * FROM animal an JOIN cell cl ON an.CellID = cl.CellID JOIN region rg ON cl.RegionID = rg.RegionID";
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Animal animal = new Animal(resultSet.getString("AnimalID"),
						resultSet.getString("AnimalName"),
						resultSet.getString("SpeciesID"),
						resultSet.getBoolean("Gender"),
						resultSet.getDouble("Height"),
						resultSet.getDouble("Weight"),
						resultSet.getString("HealthStatus"),
						resultSet.getString("Description"),
						resultSet.getString("CellID"),
						resultSet.getString("RegionName"),
						resultSet.getString("RegionID"));
				animalList.add(animal);
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
		
		return animalList;
	}
	
	public ArrayList<Animal> searchAnimalById(String id) {
		ArrayList<Animal> animalList = new ArrayList<Animal>();
		try {		
			connection =  dbAccess.getConnectMySQL();
			String sql = "SELECT * FROM animal an JOIN cell cl ON an.CellID = cl.CellID JOIN region rg ON cl.RegionID = rg.RegionID WHERE AnimalID LIKE ?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, id);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Animal animal = new Animal(resultSet.getString("AnimalID"),
						resultSet.getString("AnimalName"),
						resultSet.getString("SpeciesID"),
						resultSet.getBoolean("Gender"),
						resultSet.getDouble("Height"),
						resultSet.getDouble("Weight"),
						resultSet.getString("HealthStatus"),
						resultSet.getString("Description"),
						resultSet.getString("CellID"),
						resultSet.getString("RegionName"),
						resultSet.getString("RegionID"));
				animalList.add(animal);
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
		
		return animalList;
	}
	
	public boolean addNewAnimal(Animal newAnimal) {
		boolean ok = false;
		try {		
			connection =  dbAccess.getConnectMySQL();
			String sql = "INSERT INTO Animal (AnimalID, AnimalName, SpeciesID, Gender, Weight, Height, HealthStatus, Description, CellID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, newAnimal.getAnimalID());
			preparedStatement.setString(2, newAnimal.getAnimalName());
			preparedStatement.setString(3, newAnimal.getSpeciesID());
			preparedStatement.setBoolean(4, newAnimal.getGender());
			preparedStatement.setDouble(5, newAnimal.getWeight());
			preparedStatement.setDouble(6, newAnimal.getHeight());
			preparedStatement.setString(7, newAnimal.getHealthStatus());
			preparedStatement.setString(8, newAnimal.getDescription());
			preparedStatement.setString(9, newAnimal.getCellID());	
			
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
