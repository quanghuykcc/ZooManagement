package controller;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;


/**
 * Servlet implementation class CheckLogin
 */
@WebServlet("/CheckLogin")
public class CheckLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckLogin() {
        super();
        
        // TODO Auto-generated constructor stub
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	doPost(req, resp);
    }
     
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		UserDAO userDAO = new UserDAO();
		
		String submit = request.getParameter("submit");
		
		if(submit==null){
			response.sendRedirect(request.getContextPath()+"/dang-nhap.jsp");
		}else{
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			if(userDAO.checkUserLogin(username, password)){
				out.println("Ä�Äƒng nháº­p thÃ nh cÃ´ng !");
			}else{
				response.sendRedirect(request.getContextPath()+"/checklogin?msg=0");
			}
		}
	}

}
