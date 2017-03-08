document.write("<table border = \"18\">");
	for (i = 1 ;i <= 9;i++)
	{
		document.write("<tr>");
		for (j = 1;j<=i ;j++ )
		{
			document.write("<td>" + i +"*" +j+ "="+ i*j +"</td>" );	
		}
		document.write("</tr>");
	}
document.write("</table>");