package kr.co.dong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dong.DAO.QnaDAO;
import kr.co.dong.DTO.BoardDTO;
import kr.co.dong.DTO.QnaDTO;

@Service
public class QnaServicelmpl implements QnaService{

	@Autowired
	QnaDAO qnadao;
	
	@Override
	public List<QnaDTO> qnalist() {
		return qnadao.qnalist();
	}

	@Override
	public QnaDTO qnadetail(int qa_no) {
		return qnadao.qnadetail(qa_no);
	}

	@Override
	public int qnainsert(QnaDTO qd) {
		return qnadao.qnainsert(qd);
	}

	@Override
	public int qnaupdate(QnaDTO qd) {
		return qnadao.qnaupdate(qd);
	}

	@Override
	public int qnadelete(QnaDTO qd) {
		return qnadao.qnadelete(qd);
	}
	
	@Override
	   public int count() {
	      return qnadao.count();
	   }

	   @Override
	   public List<BoardDTO> qnapage(int displayPost, int postNum) throws Exception {
	      return qnadao.qnapage(displayPost, postNum);
	   }

	
}
