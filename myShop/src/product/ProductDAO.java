package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import product.ProductDTO;
import product.DBConnectionMgr;

public class ProductDAO {
	DBConnectionMgr pool;
	Connection con;
	
	public ProductDAO() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//삭제
	public void delete(String id) throws Exception {
		con = pool.getConnection();
		
	
		String sql = "delete from member where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);

		
	
		ps.executeUpdate();
		System.out.println("SQL문 요청 완료..");
	}
	
	//등록
	public void insert(ProductDTO dto) throws Exception {
		con = pool.getConnection();
		
		
		String sql = "insert into member values (?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, dto.getId());
		ps.setString(2, dto.getTitle());
		ps.setString(3, dto.getContent());
		ps.setInt(4, dto.getPrice());
		
	
		ps.executeUpdate();
		pool.freeConnection(con, ps);
		System.out.println("SQL문 요청 완료..");
	}
	
		//전체 리스트 출력
		public ArrayList<ProductDTO> selectAll() throws Exception {
			con = pool.getConnection();

			
			String sql = "select * from member";
			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			System.out.println("start " + rs.getRow());
			
		
			
			
			ProductDTO dto = null;
			ArrayList<ProductDTO> list = new ArrayList<>();
			
			while (rs.next()) { 
				System.out.println("row: " + rs.getRow());
				dto = new ProductDTO();

				String id = rs.getString(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				int price = rs.getInt(4);

				dto.setId(id);
				dto.setTitle(title);
				dto.setContent(content);
				dto.setPrice(price);
				
				list.add(dto);
				System.out.println();
			}
			pool.freeConnection(con, ps, rs);
			return list;
		}

		//아이디 값으로 출력
		public ProductDTO select(String input) throws Exception {
			con = pool.getConnection();

			
			String sql = "select * from member where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, input);

			
			ResultSet rs = ps.executeQuery();
			ProductDTO dto = null;
			while (rs.next()) { 
				dto = new ProductDTO();

				String id = rs.getString(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				int price = rs.getInt(4);

				dto.setId(id);
				dto.setTitle(title);
				dto.setContent(content);
				dto.setPrice(price);
			}
			pool.freeConnection(con, ps, rs);
			return dto;
		}
		
		//수정
		public void update(ProductDTO dto) throws Exception {
			con = pool.getConnection();
			
		
			String sql = "update member set title = ?, content = ?, price = ? where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getContent());
			ps.setInt(3, dto.getPrice());
			ps.setString(4, dto.getId());
			
			
			ps.executeUpdate();
			pool.freeConnection(con, ps);
			System.out.println("SQL문 요청 완료..");
		}
}

