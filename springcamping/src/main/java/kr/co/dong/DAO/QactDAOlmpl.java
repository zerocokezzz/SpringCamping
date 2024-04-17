package kr.co.dong.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dong.DTO.QactDTO;

	@Repository
	public class QactDAOlmpl implements QactDAO{
	@Autowired
	SqlSession sqlsession;
	private static final String namespaces="kr.co.dong.qnacomentmapper";

	@Override
	public List<QactDTO> qactlist(int qa_no) {
		return sqlsession.selectList(namespaces+".qactlist",qa_no);
	}

	@Override
	public int qactinsert(QactDTO qcd) {
		return sqlsession.insert(namespaces+".qactinsert", qcd);
	}

	@Override
	public int qactdelete(QactDTO qcd) {
		return sqlsession.delete(namespaces+".qactdelete", qcd);
	}

	@Override
	public int qactupdate(QactDTO qcd) {
		return sqlsession.update(namespaces+".qactupdate", qcd);
	}

}
