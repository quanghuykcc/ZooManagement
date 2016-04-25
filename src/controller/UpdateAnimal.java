package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AnimalDAO;
import dao.CellDAO;
import dao.RegionDAO;
import dao.SpeciesDAO;
import model.Animal;
import model.Cell;
import model.Region;
import model.Species;

/**
 * Servlet implementation class UpdateAnimal
 */
@WebServlet("/UpdateAnimal")
public class UpdateAnimal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAnimal() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		String submit = request.getParameter("submit");
		if (submit != null) {
			String speciesID = request.getParameter("species_id");
			String animalID = request.getParameter("animal_id");
			String animalName = request.getParameter("animal_name");
			String genderStr = request.getParameter("gender");
			int gender;
			if (genderStr != null) {
				gender = 1;
			}
			else {
				gender = 0;
			}
			String weight = request.getParameter("weight");
			String height = request.getParameter("height");
			String healthStatus = request.getParameter("health_status");
			String description = request.getParameter("description");
			String cellID = request.getParameter("cell_id");
			
			Animal animal = new Animal(animalID, animalName, speciesID, gender, Double.parseDouble(height), Double.parseDouble(weight), healthStatus, description, cellID);
			
			System.out.println(animal.toString());
			
			boolean ok = new AnimalDAO().updateAnimal(animal);
			if (ok) {
				response.sendRedirect(request.getContextPath() + "/animal-management");
			}
			else {
				response.sendRedirect("dang-nhap.jsp");
			}
		}
		
		else {
			
			String animalID = request.getParameter("animal_id");
			Animal animal = new AnimalDAO().getAnimalById(animalID);
			ArrayList<Species> speciesList = new SpeciesDAO().getAllSpecies();
			ArrayList<Region> regionList = new RegionDAO().getAllRegions();
			ArrayList<Cell> cellList = new CellDAO().getAllCells();
			request.setAttribute("species_list", speciesList);
			request.setAttribute("region_list", regionList);
			request.setAttribute("cell_list", cellList);
			request.setAttribute("animal", animal);
			RequestDispatcher dispatcher = request.getRequestDispatcher("edit-animal.jsp");
			dispatcher.forward(request, response);
		}
	}

}