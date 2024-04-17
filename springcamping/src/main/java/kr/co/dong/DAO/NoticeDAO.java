package kr.co.dong.DAO;

import java.util.List;

import kr.co.dong.DTO.NoticeDTO;

public interface NoticeDAO {
	
	public List<NoticeDTO> list();

	//공지사항 상세 읽기
	public NoticeDTO detail(int notice_no);
	
	//공지사항 조회수
	public int updateReadCnt(int notice_no);
	
	//공지사항 추가
	public int insert(NoticeDTO noticedto);
	
	//공지사항 수정
	public int update(NoticeDTO noticedto);
	
	//공지사항 삭제
	public int delete(int notice_no);

	//글 총개수
	public int count();
	
	//목록 + 페이징 + 검색
	public List listPage(int displayPost, int postNum);
	

}
