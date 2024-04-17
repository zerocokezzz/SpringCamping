package kr.co.dong.service;

import java.util.List;

import kr.co.dong.DTO.QactDTO;

public interface QactService {
	public List<QactDTO> qactlist(int qa_no);
	
	public int qactinsert(QactDTO qcd);
	
	public int qactdelete(QactDTO qcd);
	
	public int qactupdate(QactDTO qcd);


}
