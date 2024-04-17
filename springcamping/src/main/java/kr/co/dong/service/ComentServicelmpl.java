package kr.co.dong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dong.DAO.ComentDAO;
import kr.co.dong.DTO.ComentDTO;

@Service
public class ComentServicelmpl implements ComentService{
@Autowired
ComentDAO comentdao;

	@Override
	public List<ComentDTO> ctlist(int bno) {
		return comentdao.ctlist(bno);
	}

	@Override
	public int ctinsert(ComentDTO cd) {
		return comentdao.ctinsert(cd);
	}

	@Override
	public int ctupdate(ComentDTO cd) {
		return comentdao.ctupdate(cd);
	}

	@Override
	public int ctdelete(ComentDTO cd) {
		return comentdao.ctdelete(cd);
	}

}
