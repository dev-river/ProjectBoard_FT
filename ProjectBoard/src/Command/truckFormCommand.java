package Command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.CommandAction;
import domain.TruckDTO;
import persistence.TruckDAO;

public class truckFormCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sTnum = request.getParameter("tNum");
		int tNum = 0;
		if(sTnum!=null) tNum = Integer.valueOf(sTnum);

		TruckDAO dao = new TruckDAO();
		
		List<TruckDTO> tNumlist = dao.list_tNum(tNum);
		
		request.setAttribute("tNumlist", tNumlist);
		
//		for(int i=0; i<tNumlist.size(); i++) {
//			System.out.println(tNumlist);
//		} 테스트용
		
		return new CommandAction(false,"/js/TOP/truckForm.jsp");
	}

}
