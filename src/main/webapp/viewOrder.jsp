<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link href='https://fonts.googleapis.com/css?family=Grenze'rel='stylesheet'>
<link href='https://fonts.googleapis.com/css?family=Abhaya Libre'rel='stylesheet'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href = "style.css" rel="stylesheet">
</head>
<style>
       
  </style>
<body>

<%@include file="header2.jsp" %><br>
	<h3 align="center">order list</h3>
    <table class="table">
        <thead>
            <tr>
                <th scope="col">ORDER ID</th>
               
                <th scope="col">ORDER STATUS</th>
                <th scope="col">ORDER PRICE</th>
                <th scope="col">ORDER QUANTITY</th>
                <th scope="col">PRODUCT ID</th>
               
                <th scope="col">ACTION</th>
            </tr>
        </thead>
        <tbody>
        <sql:setDataSource var = "snapshot" driver = "org.postgresql.Driver" url = "jdbc:postgresql://ec2-54-144-165-97.compute-1.amazonaws.com:5432/d3g2s8m8pga0t5" user = "kochvwklfkakik"  password = "d62446c6444745f52e4813b08658f26773094f08d31432f622100b6d0fa9d4da"/>
	<sql:query dataSource = "${snapshot}" var = "result">SELECT * from CUST_ORDER </sql:query>
                <c:forEach var = "row" items = "${result.rows}">
                 
                    <tr>
                            <th scope="row"><c:out value = "${row.orderID}"/></th>
                            <td><c:out value = "${row.orderDate}"/></td>
                            <td><c:out value = "${row.orderStatus}"/></td>
                            <td><c:out value = "${row.orderPrice}"/></td>
                            <td><c:out value = "${row.orderQty}"/></td>
                            <td><c:out value = "${row.prodID}"/></td>
                           
                            <td><button class="btn btn-primary"><a href="updateOrder.jsp?orderid=${row.orderID}" class="text-light">edit order</a></button><td>
                        </tr>
                   </c:forEach>
        </tbody>
      </table>


</body>
</html>