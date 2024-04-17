package kr.co.dong.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.dong.DTO.QactDTO;
import kr.co.dong.service.QactService;

@Controller
public class QactController {
	@Autowired
	QactService qactservice;

	@ResponseBody
	@PostMapping("qna_coments/qactlist")
	public List<QactDTO> qactlist(@RequestParam("qa_no") int qa_no) {
		return qactservice.qactlist(qa_no);
	}

	@ResponseBody
	@PostMapping("qna_coments/qactinsert")
	public int qactinsert(QactDTO qcd) {
		return qactservice.qactinsert(qcd);
	}

	@ResponseBody
	@PostMapping("qna_coments/qactupdate")
	public int qactupdate(QactDTO qcd) {
		return qactservice.qactupdate(qcd);
	}

	@ResponseBody
	@PostMapping("qna_coments/qactdelete")
	public int qactdelete(QactDTO qcd) {
		return qactservice.qactdelete(qcd);
	}

}
