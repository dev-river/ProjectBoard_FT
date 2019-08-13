package Command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.CommandAction;
import domain.TruckDTO;

public class searcharoundCommand implements Command {

	@Override
	public CommandAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 트럭 가져오기
		List<TruckDTO> list = new ArrayList<TruckDTO>();
		list.add(new TruckDTO(0, "윤우네", null, 0, null, "경기도 부천시 부천로"));
		list.add(new TruckDTO(0, "예손병원", null, 0, null, "경기 부천시 부천로 206"));
		list.add(new TruckDTO(0, "춘의산", null, 0, null, "경기 부천시 여월동"));
		list.add(new TruckDTO(0, "신중동", null, 0, null, "경기 부천시 길주로 지하 314"));
		list.add(new TruckDTO(0, "부천시청", null, 0, null, "경기 부천시 길주로 지하 202"));
		list.add(new TruckDTO(0, "이화대학교회", null, 0, null, "서울 서대문구 이화여대길 52"));
		list.add(new TruckDTO(0, "연세 은명대강당", null, 0, null, "서울 서대문구 연세로 50-1"));
		list.add(new TruckDTO(0, "대현럭키아파트", null, 0, null, "서울 서대문구 이화여대길 50-12서울 서대문구 이화여대길 52"));
		list.add(new TruckDTO(0, "필름포럼", null, 0, null, "서울 서대문구 성산로 527 하늬솔빌딩 A동 지하1층"));
		list.add(new TruckDTO(0, "창작놀이센터", null, 0, null, "서울 서대문구 창천동 83-55"));
		list.add(new TruckDTO(0, "충현동주민센터", null, 0, null, "서울 서대문구 북아현로22길 38"));
		list.add(new TruckDTO(0, "금륜사", null, 0, null, "서울 서대문구 북아현로24길 53"));
		list.add(new TruckDTO(0, "연세우유", null, 0, null, "서울 서대문구 연세로 50"));
		
		Collections.sort(list);
		
		request.setAttribute("list", list);
		
		return new CommandAction(false,"/js/TOP/searcharound.jsp");
	}

}
