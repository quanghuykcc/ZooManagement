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
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
            } else {
                gender = 0;
            }
            String weight = request.getParameter("weight");
            String height = request.getParameter("height");
            String healthStatus = request.getParameter("health_status");
            String description = request.getParameter("description");
            String cellID = request.getParameter("cell_id");

            Animal animal = new Animal(animalID, animalName, speciesID, gender, Double.parseDouble(height), Double.parseDouble(weight), healthStatus, description, cellID);
            boolean ok = new AnimalDAO().addNewAnimal(animal);
            if (ok) {
                response.sendRedirect(request.getContextPath() + "/animal-management");
            } else {
                response.sendRedirect("dang-nhap.jsp");
            }
        } else {

            ArrayList<Species> speciesList = SpeciesDAO.getAllSpecies();
            ArrayList<Region> regionList = RegionDAO.getAllRegions();
            ArrayList<Cell> cellList = CellDAO.getAllCells();
            request.setAttribute("species_list", speciesList);
            request.setAttribute("region_list", regionList);
            request.setAttribute("cell_list", cellList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("add-animal.jsp");
            dispatcher.forward(request, response);
        }

    }

}
