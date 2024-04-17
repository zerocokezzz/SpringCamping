package kr.co.dong.DAO;

import java.util.List;

import kr.co.dong.DTO.ComentDTO;

public interface ComentDAO {
   public List<ComentDTO> ctlist(int bno);
   
   public int ctinsert(ComentDTO cd);
   
   public int ctupdate(ComentDTO cd);
   
   public int ctdelete(ComentDTO cd);

}
