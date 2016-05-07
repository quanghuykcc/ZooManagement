package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Animal;
import dao.AnimalBO;

@WebServlet("/search")
public class SearchAnimal extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SearchAnimal() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		String animalId = request.getParameter("animal_id");
		AnimalBO animalBO = new AnimalBO();
		ArrayList<Animal> animalList = animalBO.searchAnimalById(animalId);
		for (Animal animal : animalList) {
			System.out.println(animal.toString());
		}
		request.setAttribute("animal_list", animalList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("qldv-main.jsp");	
		dispatcher.forward(request, response);	
	}

}
