package Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.CommandAction;
import domain.MemberDTO;
import persistence.MemberDAO;

public class singActionCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		int access = Integer.parseInt(request.getParameter("num"));
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		String password = request.getParameter("pw");
		String birth = request.getParameter("birth");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String singdate = null;
		dao.insert(new MemberDTO(access, id, name, nickname, password, birth, email, address, phone, singdate));
		return new CommandAction(true, "/ProjectBoard/js/Login/singok.jsp");
	}

}
