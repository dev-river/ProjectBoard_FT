package Command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.CommandAction;
import domain.TruckDTO;
import domain.TruckPageTO;
import persistence.TruckDAO;

public class truckListCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int page = 1;
		String foodCategory = request.getParameter("foodCategory");
//데이터전송 확인용		System.out.println(">> foodCategory = " + foodCategory);
		String sPage = request.getParameter("page");
		if(sPage!=null) page = Integer.valueOf(sPage);
		
		TruckDAO dao = new TruckDAO();
		
		List<TruckDTO> tctlist = dao.tctlist(foodCategory);
		
		TruckPageTO to = dao.list(page, foodCategory);
		
		request.setAttribute("tctlist", tctlist);
		request.setAttribute("to", to);
		
		return new CommandAction(false,"/js/TOP/truckList.jsp");
	}

}
