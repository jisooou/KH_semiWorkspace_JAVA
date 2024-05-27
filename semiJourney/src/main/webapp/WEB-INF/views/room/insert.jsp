<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert Room</title>
</head>
<body>
    <form action="/journey/room/insert" method="post">
        <label for="name">Room Name:</label>
        <input type="text" id="name" name="name" required><br>

        <label for="grade">Grade:</label>
        <input type="text" id="grade" name="grade" required><br>

        <label for="img01">Image URL:</label>
        <input type="text" id="img01" name="img01" required><br>

        <button type="submit">Insert Room</button>
    </form>
</body>
</html>
