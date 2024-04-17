package kr.co.dong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dong.DAO.QactDAO;
import kr.co.dong.DTO.QactDTO;

	@Service
	public class QactServicelmpl implements QactService{
	@Autowired
	QactDAO qactdao;
		@Override
		public List<QactDTO> qactlist(int qa_no) {
			return qactdao.qactlist(qa_no);
		}
	
		@Override
		public int qactinsert(QactDTO qcd) {
			return qactdao.qactinsert(qcd);
		}
	
		@Override
		public int qactdelete(QactDTO qcd) {
			return qactdao.qactdelete(qcd);
		}

		@Override
		public int qactupdate(QactDTO qcd) {
			return qactdao.qactupdate(qcd);
		}

}
