package kr.co.dong.DAO;

import java.util.List;

import kr.co.dong.DTO.QnaDTO;

public interface QnaDAO {
	public List<QnaDTO> qnalist();
	
	public QnaDTO qnadetail(int qa_no);
	
	public int qnainsert(QnaDTO qd);
	
	public int qnaupdate(QnaDTO qd);
	
	public int qnadelete(QnaDTO qd);
	
	public int count();
	   
    public List qnapage(int displayPost, int postNum);

}
