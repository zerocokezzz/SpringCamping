package kr.co.dong.service;

import java.util.List;

import kr.co.dong.DTO.BoardDTO;
import kr.co.dong.DTO.QnaDTO;

public interface QnaService {
public List<QnaDTO> qnalist();
	
	public QnaDTO qnadetail(int qa_no);
	
	public int qnainsert(QnaDTO qd);
	
	public int qnaupdate(QnaDTO qd);
	
	public int qnadelete(QnaDTO qd);
	
	public int count();
	   
    public List<BoardDTO> qnapage(int displayPost,int postNum) throws Exception;

}
