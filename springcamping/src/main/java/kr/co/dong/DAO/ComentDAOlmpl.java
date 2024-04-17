package kr.co.dong.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dong.DTO.ComentDTO;

@Repository
public class ComentDAOlmpl implements ComentDAO{
	@Autowired
	SqlSession sqlsession;
	private static final String namespaces="kr.co.dong.boardmapper";

	@Override
	public List<ComentDTO> ctlist(int bno) {
		return sqlsession.selectList(namespaces+".ctlist",bno);
	}

	@Override
	public int ctinsert(ComentDTO cd) {
		return sqlsession.insert(namespaces+".ctinsert", cd);
	}

	@Override
	public int ctupdate(ComentDTO cd) {
		return sqlsession.update(namespaces+".ctupdate", cd);
	}

	@Override
	public int ctdelete(ComentDTO cd) {
		return sqlsession.delete(namespaces+".ctdelete", cd);
	}

}
