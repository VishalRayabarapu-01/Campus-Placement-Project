<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>
    <%@ include file="../headerInclude.jsp" %>
     <link rel="stylesheet" href="../contents/bootstrap.css">
    <script src="../contents/bootstrap.bundle.min.js"></script>
     <style>
        a:hover{
            text-decoration: underline;
        }
    </style>
</head>
<body>
    	<%@ include file="../admin/bodyInc.jsp" %>
        <div class="row">
            <div class="col text-center">
                <div class="h1 p-3 m-3 text-center fw-light">Student Login </div>
                <img src="../images/login.jpeg"  height="50%" width="15%" alt="">
            </div>
        </div>
        <div class="row">
            <div class="col-4"></div>
            <div class="col" >
                <form action="StudentLoginCode.jsp" method="post">
                <label for="name" class="form-group fs-4">Username:</label>
                <input type="text" required name="uname" id="" class="form-control">
                <label for="name1" class="form-group fs-4">Password:</label>
                <input type="password" required name="pass" id="" class="form-control">
                <%if (request.getParameter("msg") != null) {%>
				<small style="color: red;">Invalid username/password</small>
				<%}%>
                <div class="text-center"><input type="submit" class=" btn btn-success mt-3 " value="Sign in"></div></form>
            </div>
            <div class="col-4"></div>
        </div>
</body>
</html>