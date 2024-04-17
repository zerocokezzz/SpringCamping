package kr.co.dong.service;

import java.util.List;

import kr.co.dong.DTO.NoticeDTO;

	public interface NoticeService {

	public List<NoticeDTO> list ();

	public NoticeDTO detail(int notice_no);
	
	public int insert(NoticeDTO noticedto);
	
	public int update(NoticeDTO noticedto);

	public int delete(int notice_no);
	
	public int count();
	
	public List<NoticeDTO> listPage(int displayPost, int postNum) throws Exception;

}
