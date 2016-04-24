
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AnimalDAO;
import model.Animal;

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
		
		String speciesID = request.getParameter("select-species");
		String animalID = request.getParameter("txt_animal_id");
		String animalName = request.getParameter("txt_animal_name");
		String gender = request.getParameter("gender");
		String weight = request.getParameter("weight");
		String height = request.getParameter("height");
		String healthStatus = request.getParameter("health_status");
		String description = request.getParameter("description");
		String cellID = request.getParameter("cell_id");
		if (checkValidate(animalID, animalName, gender, weight, height, healthStatus, description, cellID, speciesID)) {
			
			Animal animal = new Animal(animalID, animalName, speciesID, false, 0, 0, "Ahihi", "", "", "", "");
			boolean ok = new AnimalDAO().addNewAnimal(animal);
			if (ok) {
				response.sendRedirect("edit-animal.jsp");
			}
			else {
				response.sendRedirect("dang-nhap.jsp");
			}
		}
		else {
			response.sendRedirect("dang-nhap.jsp");
		}
		
	}

	private boolean checkValidate(String animalID, String animalName, String gender, String weight, String height,
			String healthStatus, String description, String cellID, String speciesID) {
		return true;
	}

}
