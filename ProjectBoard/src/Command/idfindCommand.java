package Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.CommandAction;
import persistence.MemberDAO;

public class idfindCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(1);
		MemberDAO dao = new MemberDAO();
		String name = request.getParameter("name");
		String birth1 = request.getParameter("birth1");
		String birth2 = request.getParameter("birth2");
		String birth = birth1 + birth2;
		String id = dao.idfind(name, birth);
		request.setAttribute("id", id);
		return new CommandAction(false, "/js/Login/search.jsp");
	}

}
