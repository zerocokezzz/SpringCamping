package kr.co.dong.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dong.DTO.BoardDTO;
import kr.co.dong.DTO.ComentDTO;
import kr.co.dong.DTO.UserDTO;
import kr.co.dong.service.BoardService;
import kr.co.dong.service.ComentService;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardService boardservice;
	
	@Autowired
	ComentService comentservice;
	
	//페이징
	   @GetMapping("board/boardmain")
	   public String list(Model model,@RequestParam("num")int num) throws Exception {
	      int count = boardservice.count();
	      
	      int postNum = 10;
	      
	      int pageNum = (int)Math.ceil((double)count/postNum);
	      
	      int displayPost = (num - 1) * postNum;
	      
	      int pageNum_cnt = 10;
	      
	      int endpageNum = (int)(Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt);
	      
	      int startpageNum  =endpageNum-(pageNum_cnt -1);
	      
	      int endpageNum_tmp = (int)(Math.ceil((double)count / (double)pageNum_cnt));
	      
	      if(endpageNum > endpageNum_tmp) {
	         endpageNum = endpageNum_tmp;
	      }
	      
	      boolean prev = startpageNum ==1 ? false : true;
	      boolean next = endpageNum * pageNum_cnt >= count ? false : true;
	      List<BoardDTO> list = boardservice.boardpage(displayPost, postNum);
	      model.addAttribute("boardmain", list);
	      model.addAttribute("pageNum", pageNum);
	      
	      model.addAttribute("startpageNum", startpageNum);
	      model.addAttribute("endpageNum", endpageNum);
	      
	      
	      model.addAttribute("prev", prev);
	      model.addAttribute("next", next);
	      
	      return "board/boardmain";
	}
	@GetMapping("board/insert")
	public String insert() {
		return "board/insert";
	}
	@PostMapping("board/insert")
	public String insert(BoardDTO bd, 
			HttpServletRequest request, 
	         HttpSession session, 
	         Model model) {
		UserDTO user = (UserDTO)session.getAttribute("user");
		bd.setUser_id(user.getUser_id());
		System.out.println(user);
		int r = boardservice.insert(bd);
		return "redirect:boardmain?num=1";
	}
	
	@GetMapping("board/detail")
	public String detail(@RequestParam("bno")int bno,Model model) {
		BoardDTO bd = boardservice.detail(bno);
		model.addAttribute("board", bd);
		return "board/detail";
	}
	@GetMapping("board/update")
	public String update(@RequestParam("bno")int bno,Model model) {
		BoardDTO bd=boardservice.detail(bno);
		model.addAttribute("board", bd);
		return "board/update";
	}
	@PostMapping("board/update")
	public String update(BoardDTO bd) {
		int r=boardservice.update(bd);
		return "redirect:boardmain?num=1";
	}
	@GetMapping("board/delete")
	public String delete(BoardDTO bd) {
		int r=boardservice.delete(bd);
		return "redirect:boardmain?num=1";
	}
	
	@ResponseBody
	@PostMapping("coment/ctlist")
	public List<ComentDTO> ctlist(@RequestParam("bno")int bno){
		return comentservice.ctlist(bno);
	}
	@ResponseBody
	@PostMapping("coment/ctinsert")
	public int ctinsert(ComentDTO cd, 
			 HttpServletRequest request, 
	         HttpSession session, 
	         @RequestParam("bno")int bno) {
		UserDTO user = (UserDTO)session.getAttribute("user");
		cd.setUser_id(user.getUser_id());
		return comentservice.ctinsert(cd);
	}
	
	@ResponseBody
	@PostMapping("coment/ctupdate")
	public int ctupdate(ComentDTO cd) {
		return comentservice.ctupdate(cd);
	}
	@ResponseBody
	@PostMapping("coment/ctdelete")
	public int ctdelete(ComentDTO cd) {
		return comentservice.ctdelete(cd);
	}
	
	
}
