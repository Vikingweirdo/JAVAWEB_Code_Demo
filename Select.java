import java.sql.*;
public class Select{
	static final String DBDRIVER = "org.gjt.mm.mysql.Driver";
			//最后一个是自己创建的数据库名字
			static final String DBURL = "jdbc:mysql://localhost:3306/wzz";
			static final String DBUSER = "root";
			static final String DBPASS = "mysqladmin";

			
	public static void main(String[] args){
			Connection con = null;
			ResultSet result = null;
			PreparedStatement prepar = null;

			String id = "Viking";
			String pass = "123";
			boolean flag = false;

			try{
			Class.forName(DBDRIVER);
			con = DriverManager.getConnection(DBURL,DBUSER,DBPASS);
			prepar=con.prepareStatement("select * from userinfo ;");
			result = prepar.executeQuery();
			
			while(result.next()){
				System.out.println(result.getString(1)+" " +result.getString(2) +" "+result.getString(3));
				if(id.equals(result.getString(2)) && pass.equals(result.getString(3))){
					System.out.println("++++");
					flag = true;
				}
			}
			
		}catch(Exception e){
		
		}
	}
}