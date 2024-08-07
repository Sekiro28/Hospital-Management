<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>NURSE PROFILE WINDOW</title>
</head>
<body background="foliage-swirls-000145-light-sky-blue.jpg" bgproperties="fixed">
<center>
<table border="3" width="500">
<tr><td>
<h1>NURSE PROFILE WINDOW</h1>
</td></tr>
</table>
<br><br><br>
<table border="5" width="800">
<tr>
<td>
<form action="NurseProfileServlet" method="post">
<table border="3">
<tr>
<td>NURSE ID<input type="text" name="t1" maxlength="10" size="20"><br></td>
<td><h4>NURSE DETAILS</h4></td>
</tr>
<tr>
<td>
<input type="submit" name="Button1" value="ADD NURSE PROFILE"><br><br>
<input type="submit" name="Button1" value="SEARCH NURSE PROFILE"><br><br>
<input type="submit" name="Button1" value="DELETE NURSE PROFILE"><br><br>
<input type="submit" name="Button1" value="EDIT NURSE PROFILE"><br><br>
</td>
<td>
<br>
<br>
NURSE NAME<input type="text" name="t2" maxlength="10" size="20"><br>
NURSE EDUQUALIFICATION<input type="text" name="t3" maxlength="10" size="20"><br>
DATE OF BIRTH<input type="text" name="t4" maxlength="10" size="20"><br>
SALARY<input type="text" name="t5" maxlength="10" size="20"><br>
FATHER'S NAME<input type="text" name="t6" maxlength="10" size="20"><br>
DEPARTMENT ID<input type="text" name="t7" maxlength="10" size="20"><br>
</td>
</tr>
</table>
</form>
<input type="button" name="bttn" value="HOME" onclick="location.href='home.jsp'">
</td>
</tr>
</table>
</center>
</body>
</html>
