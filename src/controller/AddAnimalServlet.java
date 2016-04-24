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
 * Servlet implementation class AddAnimalServlet
 */
@WebServlet("/AddAnimalServlet")
public class AddAnimalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddAnimalServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String submit = request.getParameter("submit");
		if (submit != null) {
			String speciesID = request.getParameter("species_id");
			String animalID = request.getParameter("animal_id");
			String animalName = request.getParameter("animal_name");
			String gender = request.getParameter("gender");
			String weight = request.getParameter("weight");
			String height = request.getParameter("height");
			String healthStatus = request.getParameter("health_status");
			String description = request.getParameter("description");
			String cellID = request.getParameter("cell_id");
			
			Animal animal = new Animal(animalID, animalName, speciesID, false, Double.parseDouble(height), Double.parseDouble(weight), healthStatus, description, cellID);
			boolean ok = new AnimalDAO().addNewAnimal(animal);
			if (ok) {
				response.sendRedirect("edit-animal.jsp");
			}
			else {
				response.sendRedirect("dang-nhap.jsp");
			}
		}
		
		else {
			ArrayList<Species> speciesList = new SpeciesDAO().getAllSpecies();
			ArrayList<Region> regionList = new RegionDAO().getAllRegions();
			ArrayList<Cell> cellList = new CellDAO().getAllCells();
			request.setAttribute("species_list", speciesList);
			request.setAttribute("region_list", regionList);
			request.setAttribute("cell_list", cellList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("add-animal.jsp");
			dispatcher.forward(request, response);
		}
		
	}


}
