<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sekiro Hospital</title>
<style>
body {
    background: url('1.jpg') no-repeat center center fixed;
    background-size: cover;
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

a.notr:link, a.notr:visited, a.notr:hover {
    color: #666666;
}

.container {
    max-width: 1000px;
    margin: auto;
    padding: 20px;
    background-color: rgba(255, 255, 255, 0.8);
    border: 5px solid #99CCCC;
    text-align: center;
}

h1 {
    color: #333333;
}

.navbar {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    padding: 10px;
    gap: 20px;
}

.dropdown {
    position: relative;
    flex: 1;
    min-width: 150px;
}

.dropdown dt {
    background-color: #99CCCC;
    padding: 10px;
    cursor: pointer;
    user-select: none;
    display: flex;
    align-items: center;
    justify-content: center;
}

.dropdown dd {
    display: none;
    position: absolute;
    background-color: white;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    z-index: 1;
    width: 100%;
}

.dropdown ul {
    list-style-type: none;
    padding: 0;
    margin: 0;
}

.dropdown ul li {
    padding: 10px;
}

.dropdown ul li a {
    text-decoration: none;
    color: #333333;
}

.dropdown:hover dd {
    display: block;
}

@media (max-width: 600px) {
    .navbar {
        flex-direction: column;
        align-items: center;
    }

    .dropdown dd {
        position: relative;
        width: 100%;
    }

    .dropdown dt {
        width: 100%;
        text-align: center;
    }
}
</style>
</head>
<body>
<div class="container">
    <h1>Sekiro Global Hospital</h1>
    <div class="navbar">
        <dl class="dropdown">
            <dt>DOCTOR</dt>
            <dd>
                <ul>
                    <li><a href="addoc.jsp">ADD DOCTOR</a></li>
                    <li><a href="addoc.jsp">UPDATE DOCTOR DETAILS</a></li>
                    <li><a href="addoc.jsp">DELETE DOCTOR</a></li>
                </ul>
            </dd>
        </dl>
        <dl class="dropdown">
            <dt>PATIENT</dt>
            <dd>
                <ul>
                    <li><a href="addpt.jsp">ADD PATIENT</a></li>
                    <li><a href="addpt.jsp">UPDATE PATIENT DETAILS</a></li>
                    <li><a href="dischrg.jsp">DISCHARGE PATIENT</a></li>
                </ul>
            </dd>
        </dl>
        <dl class="dropdown">
            <dt>NURSE</dt>
            <dd>
                <ul>
                    <li><a href="adnurse.jsp">ADD NURSE</a></li>
                    <li><a href="adnurse.jsp">UPDATE NURSE</a></li>
                    <li><a href="adnurse.jsp">DELETE NURSE</a></li>
                </ul>
            </dd>
        </dl>
        <dl class="dropdown">
            <dt>WORK TIME</dt>
            <dd>
                <ul>
                    <li><a href="empattn.jsp">EMPLOYEE WORKTIME</a></li>
                </ul>
            </dd>
        </dl>
        <dl class="dropdown">
            <dt>DEPARTMENT</dt>
            <dd>
                <ul>
                    <li><a href="DEPT.jsp">DEPARTMENT DETAILS</a></li>
                </ul>
            </dd>
        </dl>
        <dl class="dropdown">
            <dt>MEDICINE</dt>
            <dd>
                <ul>
                    <li><a href="addmed.jsp">ADD NEW MEDICINE</a></li>
                    <li><a href="addmed.jsp">UPDATE MEDICINE DETAILS</a></li>
                    <li><a href="addmed.jsp">DELETE EXPIRED MEDICINE</a></li>
                </ul>
            </dd>
        </dl>
        <dl class="dropdown">
            <dt>REPORT</dt>
            <dd>
                <ul>
                    <li><a href="docrep.jsp">DOCTOR</a></li>
                    <li><a href="patrep.jsp">PATIENT</a></li>
                    <li><a href="medrep.jsp">MEDICINE</a></li>
                </ul>
            </dd>
        </dl>
    </div>
</div>
</body>
</html>
