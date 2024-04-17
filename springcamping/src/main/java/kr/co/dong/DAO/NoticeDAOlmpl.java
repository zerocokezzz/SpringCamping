package kr.co.dong.DAO;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dong.DTO.NoticeDTO;

@Repository
public class NoticeDAOlmpl implements NoticeDAO{
	
	@Autowired
	SqlSession sqlsession;
	
	private static final String namespace="kr.co.dong.guidemapper";
	

	@Override
	public List<NoticeDTO> list() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace+".list");
	}

	@Override
	public NoticeDTO detail(int notice_no) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".detail", notice_no);
	}

	@Override
	public int updateReadCnt(int notice_no) {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace +".updateReadCnt", notice_no);
	}

	@Override
	public int insert(NoticeDTO noticedto) {
		// TODO Auto-generated method stub
		return sqlsession.insert(namespace + ".insert", noticedto);
	}

	@Override
	public int update(NoticeDTO noticedto) {
		// TODO Auto-generated method stub
		return sqlsession.update(namespace +".update", noticedto);
	}

	@Override
	public int delete(int notice_no) {
		// TODO Auto-generated method stub
		return sqlsession.delete(namespace + ".delete", notice_no);
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace + ".count");
	}

	@Override
	public List<NoticeDTO> listPage(int displayPost, int postNum){
		// TODO Auto-generated method stub
//		HashMap data = new HashMap();
		  
		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		  
		return sqlsession.selectList(namespace + ".listPage", data);
	}


	

}
