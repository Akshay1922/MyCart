<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<%@include file= "components/common_css_js.jsp" %>
	    
</head>
<body>

	<%@include file="components/navbar.jsp" %>
	<div class="container-fluid">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
				
				<%@include file="components/message.jsp" %>
				
				<div class="card-body px-5">
					<div class="container text-center">
						<img alt="" src="img/add-friend.png" style="max-width : 70px;" class="img-fluid">
					
					</div>					
					
					<h4 class="text-center" >Signup Here!</h4>
					
					<form action="RegisterServlet" method="post">
						
						<div class="form-group">
						    <label for="name">User Name</label>
						    <input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Here">
						</div>
						
						<div class="form-group">
						    <label for="email">User Email</label>
						    <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Here">
						</div>
						
						<div class="form-group">
						    <label for="password">User Password</label>
						    <input name="user_password" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter Here">
						</div>
						
						<div class="form-group">
						    <label for="phone">User Phone</label>
						    <input name="user_phone" name="user_phone" type="phone" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter Here">
						</div>
						
						<div class="form-group">
						    <label for="phone">User Address</label>
							<textarea name="user_address" style="height: 200px" class="form-control" placeholder="Enter your address" rows="" cols=""></textarea>
						</div>
						
						<div class="container text-center">
							<button class="btn btn-outline-success">Register</button>
							<button class="btn btn-outline-warning">Reset</button>
									
						</div>
						
					</form>
				</div>
				</div>					
			</div>	
		</div>
	</div>	
</body>
</html>