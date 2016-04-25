package dao;

import java.util.ArrayList;

import lib.ConnectDbLib;
import model.Species;

public class SpeciesDAO extends AbstractDAO{
	
	public SpeciesDAO() {
		dbAccess = new ConnectDbLib();
	}
	
	public ArrayList<Species> getAllSpecies() {
		ArrayList<Species> speciesList = new ArrayList<Species>();
		try {		
			connection =  dbAccess.getConnectMySQL();
			String sql = "SELECT * FROM species";
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Species species = new Species(resultSet.getString("SpeciesID"), 
						resultSet.getString("SpeciesName"), 
						resultSet.getString("Description"));
						speciesList.add(species);
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
		
		return speciesList;
	}
}