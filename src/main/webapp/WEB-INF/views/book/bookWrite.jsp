<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>🤑가계부 작성🤑</h1>
<form action="/report/reportWrite" method="post">
아이디 : <input type="text" name="id"><br>
일자 : <input type="date" name="rp_date"><br>
금액 : <input type="number" name="rp_money"><br>
내역 : <input type="text" name="rp_detail"><br>
카테고리 : <select name="category">
<option value="food_ex">식비</option>
<option value="transf_ex">교통비</option>
<option value="mart_ex">편의점/마트</option>
<option value="phone_ex">통신비</option>
<option value="hobby_ex">여가비</option>
<option value="shop_ex">뷰티/쇼핑</option>
<option value="etc_ex">기타</option>
</select><br>
<input type="submit">


</form>
</body>
</html>