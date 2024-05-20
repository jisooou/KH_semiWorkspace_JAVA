<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>위시리스트</title>
</head>
<body>
    <header>
        <h1>위시리스트</h1>
    </header>
    <main>
        <c:choose>
            <c:when test="${not empty voList}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>방 번호</th>
                            <th>삭제</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="wish" items="${voList}">
                            <tr>
                                <td>${wish.no}</td>
                                <td>${wish.roomNo}</td>
                                <td><a href="/wish/delete?no=${wish.no}">삭제</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <p>위시리스트에 등록된 항목이 없습니다.</p>
            </c:otherwise>
        </c:choose>
    </main>
</body>
</html>
