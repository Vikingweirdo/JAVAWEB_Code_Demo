<%@ page language="java" contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*"%>
<html>
	<head>
		<title> Check Info </title>
		<h1>check</h1>
		<h2><%= request.getParameter("id")%></h2>
		<h2><%= request.getParameter("pass")%></h2>
	</head>
	<body>
		<%!
			public static final String DBDRIVER = "org.gjt.mm.mysql.Driver";
			//最后一个是自己创建的数据库名字
			public static final String DBURL = "jdbc:mysql://localhost:3306/wzz";
			public static final String DBUSER = "root";
			public static final String DBPASS = "mysqladmin";		
		%>
		<%!
			private  Connection con = null;
			private ResultSet result = null;
			private PreparedStatement prepar = null;
			
			private String id = null;
			private String pass = null;
			private String name = null;
			private boolean flag = false;
		%>

		
		<%	
		try{
			Class.forName(DBDRIVER);
			con = DriverManager.getConnection(DBURL,DBUSER,DBPASS);
			String sql = "select * from userinfo;";
			prepar=con.prepareStatement(sql);
			result = prepar.executeQuery();
			
			while(result.next()){
				
				if(request.getParameter("id").equals(result.getString(1)) && request.getParameter("pass").equals(result.getString(3))){
					name = result.getString(2);
					flag = true;
				}
			}

		}catch(Exception e){
		
		}
		finally{
			try{
				prepar.close();
				result.close();
				con.close();

			}catch(Exception e){
			}
		}
		%>
		
		<%
			if(flag){
		%>
				<jsp:forward page="userinfo.jsp">
					<jsp:param name="name" value="<%= name%>"/>
				</jsp:forward>
		<%	}else{%>
				
				<jsp:forward page="userinfo.jsp">
				<jsp:param name="name" value="EMPTY"/>
				</jsp:forward>
		<%
			}
		%>

	</body>
</html>