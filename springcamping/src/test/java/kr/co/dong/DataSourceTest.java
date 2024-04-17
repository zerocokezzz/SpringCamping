package kr.co.dong;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/*.xml"})
public class DataSourceTest {
	
	@Autowired //spring전용 인스턴스 생성, @Inject : 자바/spring 모두 가능, @Resource : 이름으로 연결
	private DataSource dataSource;
	
	@Test
	public void testConn() {
		try {
			Connection conn = dataSource.getConnection();
			System.out.println(conn);
			System.out.println("성공!!!!!");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
