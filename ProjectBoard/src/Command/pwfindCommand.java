package Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.CommandAction;
import persistence.MemberDAO;

public class pwfindCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String pw = dao.pwfind(id, email);
		request.setAttribute("pw", pw);
		return new CommandAction(true, "./js/Login/search.jsp?id="+id);
	}

}
