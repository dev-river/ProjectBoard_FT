package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Command.Command;
import Command.eventCommand;
import Command.idfindCommand;
import Command.idpwUICommand;
import Command.joinActionCommand;
import Command.loginActionCommand;
import Command.loginUICommand;
import Command.logoutCommand;
import Command.mainComand;
import Command.pwfindCommand;
import Command.reviewCommand;
import Command.searcharoundCommand;
import Command.searchmenuCommand;
import Command.singuiCommand;
import Command.truckFormCommand;
import Command.truckListCommand;
import domain.CommandAction;



/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String cp = request.getContextPath();
		String what = uri.substring(cp.length());

		System.out.println(uri+" : "+cp+" : "+what); //what 어떻게 찍히는지 테스트 중..
		
		Command com = null;
		
		if(what.equalsIgnoreCase("/Main.do"))
		{			
			com = new mainComand();
		}		
		else if(what.equalsIgnoreCase("/searcharound.do"))
		{
			com = new searcharoundCommand();
		}
		else if(what.equalsIgnoreCase("/searchmenu.do"))
		{
			com = new searchmenuCommand();
		}
		else if(what.equalsIgnoreCase("/event.do"))
		{
			com = new eventCommand();
		}
		else if(what.equalsIgnoreCase("/review.do"))
		{
			com = new reviewCommand();
		}
		else if(what.equalsIgnoreCase("/loginui.do"))
		{			
			com = new loginUICommand();
		}
		else if(what.equalsIgnoreCase("/singui.do"))
		{			
			com = new singuiCommand();
		}
		else if(what.equalsIgnoreCase("/join.do")) 
		{			
			com = new joinActionCommand();
		}
		else if(what.equalsIgnoreCase("/idpwui.do")) 
		{
			com = new idpwUICommand();
		}
		else if(what.equalsIgnoreCase("/truckList.do"))
		{
			com = new truckListCommand();
		}		
		else if(what.equalsIgnoreCase("/loginAction.do")) {
			com = new loginActionCommand();
		}
		else if(what.equalsIgnoreCase("/idsearch.do")) {
			com = new idfindCommand();
		}
		else if(what.equalsIgnoreCase("/pwsearch.do")) {
			com = new pwfindCommand();
		}
		else if(what.equalsIgnoreCase("/logout.do")) {
			com = new logoutCommand();
		}
		else if(what.equalsIgnoreCase("/truckForm.do"))
		{
			com = new truckFormCommand();
		}
		
		
		if(com!=null)
		{
			CommandAction action = com.execute(request, response);
			if(action.isRedirect())
			{
				response.sendRedirect(action.getPath());
			}
			else
			{
				request.getRequestDispatcher(action.getPath()).forward(request, response);
				
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
