package dao;

import java.util.ArrayList;

import model.Animal;
import dao.AnimalDAO;

public class AnimalBO {
	
	public boolean deleteAnimal(String animalID) {
		AnimalDAO animalDAO = new AnimalDAO();
		return animalDAO.deleteAnimal(animalID);
	}
	
	public boolean updateAnimal(Animal updatedAnimal) {
		AnimalDAO animalDAO = new AnimalDAO();
		return animalDAO.updateAnimal(updatedAnimal);
	}
	
	public ArrayList<Animal> getAllAnimals() {
		AnimalDAO animalDAO = new AnimalDAO();
		return animalDAO.getAllAnimals();
	}
	
	public Animal getAnimalById(String id) {
		AnimalDAO animalDAO = new AnimalDAO();
		return animalDAO.getAnimalById(id);
	}
	
	public ArrayList<Animal> searchAnimalById(String id) {
		AnimalDAO animalDAO = new AnimalDAO();
		return animalDAO.searchAnimalById(id);
	}
	
	public boolean addNewAnimal(Animal newAnimal) {
		AnimalDAO animalDAO = new AnimalDAO();
		return animalDAO.addNewAnimal(newAnimal);
	}
	 
}
