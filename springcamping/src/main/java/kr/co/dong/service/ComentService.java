package kr.co.dong.service;

import java.util.List;

import kr.co.dong.DTO.ComentDTO;

public interface ComentService {
	public List<ComentDTO> ctlist(int bno);
	   
	   public int ctinsert(ComentDTO cd);
	   
	   public int ctupdate(ComentDTO cd);
	   
	   public int ctdelete(ComentDTO cd);

}
