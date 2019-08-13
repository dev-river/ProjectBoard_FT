package Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.CommandAction;
import persistence.MemberDAO;

public class idcheckCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		String id = request.getParameter("id");
		boolean check = dao.idcheck(id);
		request.setAttribute("check", check);
		return new CommandAction(false, "/js/Login/icheck.jsp");
	}

}
