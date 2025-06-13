package kr.or.ddit.index;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class IndexRepository {
	
	
	// 챕터 전체 목록 데이터
	private List<IndexVO> indexList = new ArrayList<IndexVO>();
	// 실습 예제 파일 내, 챕터명을 활용
	private static Map<String, String> chaptMap = new HashMap<String, String>();
	
	// 싱글턴
	private static IndexRepository instance = null;
	public static IndexRepository getInstance() {
		if(instance == null) {
			instance = new IndexRepository();
		}
		return instance;
	}
	
	// InMemory 내, 챕터, 제목, 챕터별 URL, 챕터별 소스 페이지 정보를 담기 위한 준비
	private IndexRepository() {
		// 챕터 설정
		String[] chapters = {
				"CH01","CH03", "CH04","CH05","CH06","CH07","CH08","CH17"
		};
		// 제목 설정
		String[] titles = {
				"CH01. JSP 개요","CH03. 디렉티브 태그","CH04. 액션태그",
				"CH05. 내장객체","CH06. 폼 태그","CH07. 파일업로드",
				"CH08. 유효성 검사","CH17. 태그 라이브러리"
		};
		// 챕터별 URL 설정
		String[] chapterMoveUrls = {
				"/","/ch03/","/CH04/","","","","",""
		};
		// 챕터별 소스 페이지 설정
		String[][] sourceArr = {
				{"welcome.jsp"},
				{"taglib.jsp", "ch03_test.jsp"},
				{"ch04Info.jsp"},	
				{""},	
				{""},	
				{""},	
				{""},	
				{""},	
		};
		
		// 정보를 담을 List 설정
		for (int i = 0;i<chapters.length;i++) {
			IndexVO indexVO = new IndexVO();
			indexVO.setChapter(chapters[i]);					// 챕터 등록
			indexVO.setTitle(titles[i]);						// 챕터명 등록
			indexVO.setChapterMoveUrl(chapterMoveUrls[i]);		// 챕터 이동 URL 등록
			
			// 각 챕터별 소스 페이지 목록
			List<String> sourceList = new ArrayList<String>();
			for(int j=0; j<sourceArr[i].length;j++) {
				sourceList.add(sourceArr[i][j]);
			}
			indexVO.setSourceList(sourceList);
			indexList.add(indexVO);
			
			// map에 챕터 등록하기
			chaptMap.put(chapters[i], titles[i]);
		}
	}
	
	// 챕터 전체 목록 가져오기
	public List<IndexVO> getIndexList(){
		return indexList;
	}
	
	// 챕터를 파라미터로 전달하면 챕터명을 얻을 수 있다.
	public static String getChapter(String chapter) {
		return chaptMap.get(chapter);
	}
}
