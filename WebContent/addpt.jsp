<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMIT NEW PATIENT</title>
<style>
    body {
        background: url('University_College_Hospital.jpg') fixed;
        background-color: lightblue;
        color: red;
    }
    h1, h3, h4, table, th, td {
        color: red;
    }
</style>
</head>
<body>
<form action="addpt.jsp" method="post">
<%!String a="",b="",d="",e="",f="",g="",h="",i="",j=""; %>
<center>
<table border="3">
<tr>
<td ALIGN="CENTER">
<h1>ADMIT NEW PATIENT</h1>
</td>
</tr>
</table>
<br><br>
<table border="5" width="1000">
<tr>
<td>
<h3>ADD NEW PATIENT</h3>
<table border="3">
<tr>
<td width="50%">
<br><br><br>
<h4>PATIENT DETAILS</h4>
<input type="submit" name="button1" value="SEARCH PATIENT" style="left:100px;top:215px;">
<br>
<%
try {
    a = request.getParameter("button1"); 
    if ("SEARCH PATIENT".equals(a)) {
        String str1 = request.getParameter("t1");
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        Connection c = DriverManager.getConnection("jdbc:odbc:abc", "root", "data");
        Statement s = c.createStatement();
        if (str1 != null && !str1.isEmpty()) {    
            String sql2 = "select * from patient where patient_id='" + str1 + "'";
            ResultSet r = s.executeQuery(sql2);
            if (r.next()) {
                j = r.getString(1);
                b = r.getString(2);    
                d = r.getString(3);
                e = r.getString(4);
                f = r.getString(5);
                g = r.getString(6);
                h = r.getString(7);
                i = r.getString(8);
            } else {    
                %><script language="javascript">
                alert("PATIENT ID=<%=str1%> does not exist in database..!!!");
                </script><%            
            }    
        } else {
            %><script language="javascript">
            alert("ENTER PATIENT ID TO SEARCH..!!!");
            </script><%        
        }
    }
} catch(Exception e) {}
%>
PATIENT ID    <input type="text" name="t1" maxlength="10" size="20" value="<%=j%>"><br>
PATIENT NAME  <input type="text" name="t2" maxlength="10" size="20" value="<%=b%>"><br>
DATE OF BIRTH <input type="text" name="t3" maxlength="10" size="20" value="<%=d%>"><br>
DOCTOR FEE    <input type="text" name="t4" maxlength="10" size="20" value="<%=e%>"><br>
FATHER'S NAME <input type="text" name="t5" maxlength="10" size="20" value="<%=f%>"><br>
DEPARTMENT ID <input type="text" name="t6" maxlength="10" size="20" value="<%=h%>"><br>
BLOOD GROUP   <input type="text" name="t7" maxlength="10" size="20" value="<%=g%>"><br>
GENDER        <select name="t8">
                  <option value="MALE" <%= "MALE".equals(i) ? "selected" : "" %>>MALE</option>
                  <option value="FEMALE" <%= "FEMALE".equals(i) ? "selected" : "" %>>FEMALE</option>
              </select><br><br>
<input type="submit" name="button1" value="EDIT PATIENT DETAILS">
<br><br><br>
</td>
<%
try {
    a = request.getParameter("button1"); 
    if ("EDIT PATIENT DETAILS".equals(a)) {
        String str1 = request.getParameter("t1");
        String str2 = request.getParameter("t2");
        String str3 = request.getParameter("t3");
        String str4 = request.getParameter("t4");
        String str5 = request.getParameter("t5");
        String str6 = request.getParameter("t6");
        String str7 = request.getParameter("t7");
        String str8 = request.getParameter("t8");
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        Connection c = DriverManager.getConnection("jdbc:odbc:abc", "root", "data");
        Statement s = c.createStatement();
        if (str1 != null && !str1.isEmpty()) {    
            String sql2 = "select * from patient where patient_id='" + str1 + "'";
            ResultSet rs1 = s.executeQuery(sql2);
            if (rs1.next()) {    
                String sql1 = "select * from department where dept_id='" + str6 + "'";
                ResultSet rs = s.executeQuery(sql1);
                if (rs.next()) {    
                    String sq = "delete from patient where patient_id='" + str1 + "'";
                    s.execute(sq);
                    String sql = "insert into patient values(" + str1 + ",'" + str2 + "','" + str3 + "','" + str4 + "','" + str5 + "','" + str7 + "','" + str6 + "','" + str8 + "')";
                    s.execute(sql);
                    %><script language="javascript">
                    alert("INSERT SUCESSFUL");
                    </script><%    
                } else {
                    %><script language="javascript">
                    alert("DEPARTMENT ID=<%=str6%> does not exist in database..!!!");
                    </script><%    
                }
            } else {
                %><script language="javascript">
                alert("NO PATIENT WITH ID=<%=str1%> exists in hospital..!!!");
                </script><%    
            }    
        } else {
            %><script language="javascript">
            alert("ENTER PATIENT ID TO EDIT..!!!");
            </script><%        
        }
    }
} catch(Exception e) {}
%>
<td width="50%">
<h4>BED ALLOCATION DETAILS</h4>
PATIENT ID<input type="text" name="t9" maxlength="10" size="20"><br>
BED NO<input type="text" name="t10" maxlength="10" size="20"><br>
DATE OF ALLOCATION<input type="text" name="t11" maxlength="10" size="20"><br>
CHARGES<input type="text" name="t12" maxlength="10" size="20"><br>
ROOM TYPE<input type="text" name="t13" maxlength="10" size="20"><br>
</td>
</tr>
<tr>
<td colspan="2"><input type="submit" name="button1" value="ADMIT PATIENT AND ALLOT BED"></td>
</tr>
</table>
<%
try {
    a = request.getParameter("button1");
    if ("ADMIT PATIENT AND ALLOT BED".equals(a)) {    
        String str1 = request.getParameter("t1");
        String str2 = request.getParameter("t2");
        String str3 = request.getParameter("t3");
        String str4 = request.getParameter("t4");
        String str5 = request.getParameter("t5");
        String str6 = request.getParameter("t6");
        String str7 = request.getParameter("t7");
        String str8 = request.getParameter("t8");
        String str11 = request.getParameter("t9");
        String str12 = request.getParameter("t10");
        String str13 = request.getParameter("t11");
        String str14 = request.getParameter("t12");
        String str15 = request.getParameter("t13");
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        Connection c = DriverManager.getConnection("jdbc:odbc:abc", "root", "data");
        Statement s = c.createStatement();
        if (!str1.isEmpty() && !str2.isEmpty() && !str3.isEmpty() && !str4.isEmpty() && !str5.isEmpty() && !str6.isEmpty() && !str7.isEmpty() && !str8.isEmpty() && !str11.isEmpty() && !str12.isEmpty() && !str13.isEmpty() && !str14.isEmpty() && !str15.isEmpty()) {
            String sq1 = "select * from department where dept_id=" + str6;
            ResultSet r4 = s.executeQuery(sq1);
            if (r4.next()) {
                String sq2 = "select * from rooms where bed_no =" + str12;
                ResultSet r5 = s.executeQuery(sq2);
                if (r5.next()) {
                    %><script language="javascript">
                    alert("BED IS ALREADY OCCUPIED");
                    </script><%
                } else {    
                    String sq4 = "insert into patient values(" + str1 + ",'" + str2 + "','" + str3 + "','" + str4 + "','" + str5 + "','" + str7 + "','" + str6 + "','" + str8 + "','A')";
                    s.execute(sq4);
                    String sq3 = "insert into rooms values(" + str11 + "," + str12 + ",'" + str15 + "'," + str14 + ",'" + str13 + "')";
                    s.execute(sq3);    
                    %><script language="javascript">
                    alert("INSERT SUCESSFUL");
                    </script><%
                }
            } else {
                %><script language="javascript">
                alert("DEPARTMENT ID=<%=str6%> does not exist in database..!!!");
                </script><%    
            }
        } else {
            %><script language="javascript">
            alert("ENTER COMPLETE DETAILS..!!!");
            </script><%    
        }
    }
} catch(Exception e) {}
%>
<h3>PATIENTS ADMITTED IN HOSPITAL</h3>
<table border="1">
<tr>
<th colspan="1" align="center">PATIENT ID</th>
<th colspan="1" align="center">PATIENT NAME</th>
<th colspan="1" align="center">DATE OF BIRTH</th>
<th colspan="1" align="center">DOCTOR'S FEE</th>
<th colspan="1" align="center">FATHER'S NAME</th>
<th colspan="1" align="center">BLOOD GROUP</th>
<th colspan="1" align="center">DEPARTMENT ID</th>
<th colspan="1" align="center">SEX</th>
</tr>
<%
try {    
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    Connection c = DriverManager.getConnection("jdbc:odbc:abc", "root", "data");
    Statement s = c.createStatement(); 
    String sql1 = "select * from patient";
    ResultSet rs = s.executeQuery(sql1);    
    while(rs.next()) {
%><tr><%
        for (int i = 1; i <= 8; i++) {
            out.println("<td>" + rs.getString(i) + "</td>");
        }
%></tr><%            
    }
} catch(Exception e) { }
%>
</table>
<br><br><br>
<h3>BEDS OCCUPIED IN HOSPITAL ACCOMMODATION</h3>
<table border="1">
<tr>
<th colspan="1" align="center">PATIENT ID</th>
<th colspan="1" align="center">BED NO</th>
<th colspan="1" align="center">ROOM TYPE</th>
<th colspan="1" align="center">CHARGES</th>
<th colspan="1" align="center">ALLOCATION DATE</th>
</tr>
<%
try {    
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    Connection c = DriverManager.getConnection("jdbc:odbc:abc", "root", "data");
    Statement s = c.createStatement(); 
    String sql1 = "select * from rooms";
    ResultSet rs = s.executeQuery(sql1);    
    while(rs.next()) {
%><tr><%
        for (int i = 1; i <= 5; i++) {
            out.println("<td>" + rs.getString(i) + "</td>");
        }
%></tr><%            
    }
} catch(Exception e) { }
%>
</table>
</table>
</center>
</form>
<input type="submit" name="bttn" value="HOME" onclick="location.href='home.jsp'">
</body>
</html>
