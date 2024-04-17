package kr.co.dong.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.dong.DTO.BoardDTO;
import kr.co.dong.DTO.QnaDTO;
import kr.co.dong.DTO.UserDTO;
import kr.co.dong.service.QnaService;

@Controller
public class QnaController {
	@Autowired
	QnaService qnaservice;
	
	@GetMapping("board/qnalist")
	   public String qnalist(Model model,@RequestParam("num")int num) throws Exception {
	      int count = qnaservice.count();
	      
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
	      List<BoardDTO> list = qnaservice.qnapage(displayPost, postNum);
	      model.addAttribute("qnalist", list);
	      model.addAttribute("pageNum", pageNum);
	      
	      model.addAttribute("startpageNum", startpageNum);
	      model.addAttribute("endpageNum", endpageNum);
	      
	      
	      model.addAttribute("prev", prev);
	      model.addAttribute("next", next);
	      
	      return "board/qnalist";
	}
	      
	@GetMapping("board/qnainsert")
	public String qnainsert() {
		return "board/qnainsert";
	}
	@PostMapping("board/qnainsert")
	public String qnainsert(QnaDTO qd) {
		int r = qnaservice.qnainsert(qd);
		return "redirect:qnalist?num=1";
	}
	@GetMapping("board/qnadetail")
	public String qnadetail(@RequestParam("qa_no")int qa_no,Model model) {
		QnaDTO qd = qnaservice.qnadetail(qa_no);
		model.addAttribute("qnadetail", qd);
		return "board/qnadetail";
	}
	
	@GetMapping("board/qnaupdate")
	public String qnaupdate(@RequestParam("qa_no")int qa_no,Model model) {
		QnaDTO qd = qnaservice.qnadetail(qa_no);
		model.addAttribute("qnaupdate", qd);
		return "board/qnaupdate";
	}
	
	@PostMapping("board/qnaupdate")
	public String qnaupdate(QnaDTO qd) {
		int r = qnaservice.qnaupdate(qd);
		return "redirect:qnalist?num=1";
	}
	@GetMapping("board/qnadelete")
	public String qnadelete(QnaDTO qd) {
		int r =qnaservice.qnadelete(qd);
		return "redirect:qnalist?num=1";
		
	}





}
