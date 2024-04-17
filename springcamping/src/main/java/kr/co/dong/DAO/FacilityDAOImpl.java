package kr.co.dong.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dong.DTO.CampInfoDTO;
import kr.co.dong.DTO.ImgDTO;
import kr.co.dong.DTO.RentalInfoDTO;

@Repository
public class FacilityDAOImpl implements FacilityDAO{
	
	@Autowired
	SqlSession sqlsession;
	
	private static final String namespaces = "kr.co.dong.facilityMapper";
	
	// 캠핑 정보 전체목록
	@Override
	public List<CampInfoDTO> campAll() {
		return sqlsession.selectList(namespaces + ".campAll");
	}

	// 캠핑 정보 상세보기
	@Override
	public CampInfoDTO campDetail(String camp_no) {
		return sqlsession.selectOne(namespaces + ".campDetail", camp_no);
	}
	
	// 캠핑 정보 추가
	@Override
	public int campInsert(CampInfoDTO campInfoDTO) {
		return sqlsession.insert(namespaces + ".campInsert", campInfoDTO);
	}

	// 캠핑 정보 수정
	@Override
	public int campUpdate(CampInfoDTO campInfoDTO) {
		return sqlsession.update(namespaces + ".campUpdate", campInfoDTO);
	}
	
	// 캠핑 정보 삭제
	@Override
	public int campDelete(String img_parents) {
		return sqlsession.delete(namespaces + ".campDelete", img_parents);
	}
	
	// 캠핑 이미지 추가
	@Override
	public int campInsertImage(ImgDTO imgDTO) {
		return sqlsession.insert(namespaces + ".campInsertImage", imgDTO);
	}
	
	// 캠핑 이미지 수정
	@Override
	public int campUpdateImage(ImgDTO imgDTO) {
		return sqlsession.update(namespaces + ".campUpdateImage", imgDTO);
	}
	
	// 캠핑 이미지 삭제
	@Override
	public int campDeleteImage(String img_parents) {
		return sqlsession.delete(namespaces + ".campDeleteImage", img_parents);
	}
	
	// 캠핑 이미지 상세보기
	@Override
	public List<ImgDTO> detailImage(String img_parents) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespaces + ".detailImage", img_parents);
	}
	
	// 렌탈 정보 전체목록
	@Override
	public List<RentalInfoDTO> rentalAll() {
		return sqlsession.selectList(namespaces + ".rentalAll");
	}
	
	// 렌탈 정보 상세보기
	@Override
	public RentalInfoDTO rentalDetail(String rental_no) {
		System.out.println("DAO**********" + rental_no);
		return sqlsession.selectOne(namespaces + ".rentalDetail", rental_no);
	}

	// 렌탈 정보 추가
	@Override
	public int rentalInsert(RentalInfoDTO rentalInfoDTO) {
		return sqlsession.insert(namespaces + ".rentalInsert", rentalInfoDTO);
	}

	// 렌탈 정보 수정
	@Override
	public int rentalUpdate(RentalInfoDTO rentalInfoDTO) {
		return sqlsession.update(namespaces + ".rentalUpdate", rentalInfoDTO);
	}
	
	// 렌탈 정보 삭제
	@Override
	public int rentalDelete(String img_parents) {
		return sqlsession.delete(namespaces + ".rentalDelete", img_parents);
	}
	
}
