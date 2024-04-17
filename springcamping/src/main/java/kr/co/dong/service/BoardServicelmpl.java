package kr.co.dong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dong.DAO.BoardDAO;
import kr.co.dong.DTO.BoardDTO;

@Service
public class BoardServicelmpl implements BoardService{

	@Autowired
	BoardDAO boarddao;
	
	@Override
	public List<BoardDTO> list() {
		return boarddao.list();
	}

	@Override
	public BoardDTO detail(int bno) {
		boarddao.readcnt(bno);
		return boarddao.detail(bno);
	}

	@Override
	public int insert(BoardDTO bd) {
		return boarddao.insert(bd);
	}

	@Override
	public int update(BoardDTO bd) {
		return boarddao.update(bd);
	}

	@Override
	public int delete(BoardDTO bd) {
		return boarddao.delete(bd);
	}

	@Override
	   public List<BoardDTO> boardpage(int displayPost, int postNum) throws Exception {
	      return boarddao.boardpage(displayPost, postNum);
	   }

	   @Override
	   public int count() {
	      return boarddao.count();
	   }
}
