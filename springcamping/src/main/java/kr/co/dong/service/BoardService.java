package kr.co.dong.service;

import java.util.List;

import kr.co.dong.DTO.BoardDTO;

public interface BoardService {

public List<BoardDTO> list ();
	
	public BoardDTO detail(int bno);
	
	public int insert(BoardDTO bd);
	
	public int update(BoardDTO bd);
	
	public int delete(BoardDTO bd);
	
	public int count();
	   
    public List<BoardDTO> boardpage(int displayPost,int postNum) throws Exception;
}
