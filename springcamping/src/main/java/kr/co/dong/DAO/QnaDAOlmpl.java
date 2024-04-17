package kr.co.dong.DAO;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dong.DTO.QnaDTO;

	@Repository
	public class QnaDAOlmpl implements QnaDAO{
	@Autowired
	SqlSession sqlsession;
	
	private static final String namespaces="kr.co.dong.qnamapper";
	
	@Override
	public List<QnaDTO> qnalist() {
		return sqlsession.selectList(namespaces+".qnalist");
	}

	@Override
	public QnaDTO qnadetail(int qa_no) {
		return sqlsession.selectOne(namespaces+".qnadetail", qa_no);
	}

	@Override
	public int qnainsert(QnaDTO qd) {
		return sqlsession.insert(namespaces+".qnainsert", qd);
	}

	@Override
	public int qnaupdate(QnaDTO qd) {
		return sqlsession.update(namespaces+".qnaupdate",qd);
	}

	@Override
	public int qnadelete(QnaDTO qd) {
		return sqlsession.delete(namespaces+".qnadelete",qd);
	}
	
	@Override
	   public int count() {
	      return sqlsession.selectOne(namespaces+".count");
	   }

   @Override
   public List qnapage(int displayPost, int postNum) {
      HashMap<String, Object> data = new HashMap<String, Object>();
      
      data.put("displayPost", displayPost);
      data.put("postNum", postNum);
      return sqlsession.selectList(namespaces+".qnapage", data);
   }

}
