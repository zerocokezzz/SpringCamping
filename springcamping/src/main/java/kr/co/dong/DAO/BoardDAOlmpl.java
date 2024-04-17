package kr.co.dong.DAO;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dong.DTO.BoardDTO;

@Repository
public class BoardDAOlmpl implements BoardDAO{
	@Autowired
	SqlSession sqlsession;
	
	private static final String namespaces="kr.co.dong.boardmapper";
	
	@Override
	public List<BoardDTO> list() {
		return sqlsession.selectList(namespaces+".list");
	}

	@Override
	public BoardDTO detail(int bno) {
		return sqlsession.selectOne(namespaces+".detail", bno);
	}

	@Override
	public int insert(BoardDTO bd) {
		return sqlsession.insert(namespaces+".insert", bd);
	}

	@Override
	public int update(BoardDTO bd) {
		return sqlsession.update(namespaces+".update", bd);
	}

	@Override
	public int delete(BoardDTO bd) {
		return sqlsession.delete(namespaces+".delete", bd);
	}

	@Override
	public int readcnt(int bno) {
		return sqlsession.update(namespaces+".readcnt",bno);
	}

	@Override
	   public List boardpage(int displayPost, int postNum) {
	      HashMap<String, Object> data = new HashMap<String, Object>();
	      
	      data.put("displayPost", displayPost);
	      data.put("postNum", postNum);
	      return sqlsession.selectList(namespaces+".boardpage", data);
	   }

	   @Override
	   public int count() {
	      return sqlsession.selectOne(namespaces+".count");
	   }

}
