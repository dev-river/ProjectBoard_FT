package Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.CommandAction;
import domain.MemberDTO;
import persistence.MemberDAO;

public class loginActionCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		String id = request.getParameter("id");
		String password = request.getParameter("pw");
		boolean check = dao.login(id,password);
		System.out.println("check = "+check);
		if(check) {
			return new CommandAction(true, "/ProjectBoard/loginui.do");
		}else {
			HttpSession session = request.getSession();
			MemberDTO dto = dao.profile(id);
			session.setAttribute("dto", dto);
			return new CommandAction(false, "Main.jsp");
		}
		
	}

}
