package kr.co.dong.DAO;

import java.util.List;

import kr.co.dong.DTO.BoardDTO;

public interface BoardDAO {
	
	public List<BoardDTO> list();
	
	public BoardDTO detail(int bno);
	
	public int insert(BoardDTO bd);
	
	public int update(BoardDTO bd);
	
	public int delete(BoardDTO bd);
	
	public int readcnt(int bno);
	
	public int count();
	   
    public List boardpage(int displayPost, int postNum);
}
