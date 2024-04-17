package kr.co.dong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dong.DAO.NoticeDAO;
import kr.co.dong.DTO.NoticeDTO;

@Service
public class NoticeServicelmpl implements NoticeService{

	@Autowired
	NoticeDAO noticedao;

	@Override
	public List<NoticeDTO> list() {
		// TODO Auto-generated method stub
		return noticedao.list();
	}

	@Override
	public NoticeDTO detail(int notice_no) {
		noticedao.updateReadCnt(notice_no);
		// TODO Auto-generated method stub
		return noticedao.detail(notice_no);
	}

	@Override
	public int insert(NoticeDTO noticedto) {
		// TODO Auto-generated method stub
		return noticedao.insert(noticedto);
	}

	@Override
	public int update(NoticeDTO noticedto) {
		// TODO Auto-generated method stub
		return noticedao.update(noticedto);
	}

	@Override
	public int delete(int notice_no) {
		// TODO Auto-generated method stub
		return noticedao.delete(notice_no);
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return noticedao.count();
	}

	@Override
	public List<NoticeDTO> listPage(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return noticedao.listPage(displayPost, postNum);
	}


	




	

	
}
