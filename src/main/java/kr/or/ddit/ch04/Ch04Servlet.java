package kr.or.ddit.ch04;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ch04/form.do")
public class Ch04Servlet extends HttpServlet {
	
	// log를 활용하여 값을 출력할 수 있다.
	// Logger와 LoggerFactory는 org.slf4j 라이브러리를 활용하여 Log를 작성할 수 있다.
//	private static final Logger log = LoggerFactory.getLogger(Ch04Servlet.class);

	private int no = 0;		// 회원 번호
	private int cnt = 0;	// 요청 횟수
	// 전달받은 회원 정보를 담을 목록 데이터
	private List<Map<String,Object>> memberList = new ArrayList<Map<String,Object>>();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/ch04/form.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		
		// 전달받은 회원 정보 설정
		// DB를 활용하지는 않지만, DB에 저장하기 전, 데이터 설정과 같은 효과(데이터를 바인딩하기 위해 Map 타입을 활용)
		Map<String,Object> memberMap = new HashMap<String, Object>();
		memberMap.put("no", ++no);
		memberMap.put("id", id);
		memberMap.put("pw", pw);
		memberMap.put("name", name);
		memberList.add(memberMap);
		
		System.out.println("Ch04Servlet.doPost->사용자 등록-----");
		System.out.println("Ch04Servlet.doPost->id : " + id);
		System.out.println("Ch04Servlet.doPost->pw : " + pw);
		System.out.println("Ch04Servlet.doPost->name : " + name);
		System.out.println();
		
		cnt++;
		System.out.println("Ch04Servlet.doPost->요청 횟수 : " + cnt);
		
		// 데이터를 가용 후 페이지 이동방식을 결정합니다.
		// 페이지 이동방식 forward 인 경우
//		request.setAttribute("memberList", memberList);	// 회원 목록
//		request.setAttribute("cnt", cnt);				// 요청 횟수
//		request.getRequestDispatcher("/ch04/result.jsp").forward(request, response);
		
		// 페이지 이동방식 redirect 인 경우
		request.setAttribute("memberList", memberList);
		HttpSession session = request.getSession();
		session.setAttribute("mList", memberList);
		response.sendRedirect(request.getContextPath() + "/ch04/result.do?cnt="+cnt);
	}

}
