package Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.CommandAction;
import domain.MemberDTO;
import persistence.MemberDAO;

public class joinActionCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		int access = Integer.parseInt(request.getParameter("num"));
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");
		String password = request.getParameter("pw");
		String birth1 = request.getParameter("birth1");
		String birth2 = request.getParameter("birth2");
		String birth = birth1 + birth2;
		String email = request.getParameter("email");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address = address1 + address2;
		String phone = request.getParameter("phone");
		String singdate = null;
		dao.insert(new MemberDTO(access, id, name, nickname, password, birth, email, address, phone, singdate));
		return new CommandAction(true, "./js/Login/joinok.jsp");
	}
}
