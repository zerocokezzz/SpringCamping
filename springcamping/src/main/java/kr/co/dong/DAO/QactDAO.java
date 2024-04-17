package kr.co.dong.DAO;

import java.util.List;

import kr.co.dong.DTO.QactDTO;

public interface QactDAO {
	public List<QactDTO> qactlist(int qa_no);
	
	public int qactinsert(QactDTO qcd);
	
	public int qactupdate(QactDTO qcd);
	
	public int qactdelete(QactDTO qcd);
	

}
