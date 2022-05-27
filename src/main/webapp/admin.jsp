<%@page import="java.util.Map"%>
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Categary"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User" %>

<%

	User user = (User) session.getAttribute("current-user");
	if (user == null)
	{
		
		session.setAttribute("message", "You are not logged in, login first.");
		response.sendRedirect("login.jsp");
		
		return;
	} else
	{
		if(user.getUserType().equals("normal"))
		{
			session.setAttribute("message", "You are not admin, do not access this page.");
			response.sendRedirect("login.jsp");
			
			return;
		}
	}

%>

<%  
	CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
    List<Categary> list = cdao.getCategories();
    
    //getting count
    Map<String, Long> m = Helper.getCounts(FactoryProvider.getFactory());
%>       	

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Admin Panel</title>
	
	<%@include file="components/common_css_js.jsp" %>
</head>
<body>

	<%@include file="components/navbar.jsp"%>
	
	<div class="container admin">
		
		<div class="container-fluid mt-3">
			<%@include file="components/message.jsp" %>
		
		</div>
	
		<div class = "row mt-3">
			<div class="col-md-4">
			<!-- First coloum -->
				<!-- Fisrt Box  -->
				<div class="card">
				
					<div class="card-body text-center">
						
						<div class="container">
							<img style="max-width: 100px;" class="img-fluid rounded-circle" alt="" src="img/seo-and-web.png">
						</div>
						<h1><%= m.get("userCount") %></h1>
						<h1 class="text-uppercase text-muted">Users</h1>
					
					</div>
				
				</div>
								
			</div>
			<div class="col-md-4">
			<!-- Second coloum -->
				<!-- Second Box  -->
				<div class="card">
				
					<div class="card-body text-center">
						
						<div class="container">
							<img style="max-width: 100px;" class="img-fluid rounded-circle" alt="" src="img/list.png">
						</div>
						<h1><%= list.size() %></h1>
						<h1 class="text-uppercase text-muted">Categories</h1>
					
					</div>
				
				</div>
			
			</div>
			<div class="col-md-4">
			<!-- Third coloum -->
				<!-- Third Box -->
				<div class="card">
				
					<div class="card-body text-center">
					
						<div class="container">
							<img style="max-width: 100px;" class="img-fluid rounded-circle" alt="" src="img/product.png">
						</div>
						<h1><%= m.get("productCount") %></h1>
						<h1 class="text-uppercase text-muted">Products</h1>
					
					</div>
				
				</div>
			
			</div>
		
		</div>
		
		<!-- Second Row -->
		<div class="row mt-3">
			<div class="col-md-6">
			<!-- First coloum -->
				<!-- Fisrt Box  -->
				<div class="card" data-toggle="modal" data-target="#add-category-modal">
				
						<div class="card-body text-center">
						
							<div class="container">
								<img style="max-width: 75px;" class="img-fluid rounded-circle" alt="" src="img/keys.png">
							</div>
							<p class="mt-2">click here to add new category</p>
							<h1 class="text-uppercase text-muted">Add Category</h1>
						
						</div>	
				
				</div>
			</div>
			<div class="col-md-6" data-toggle="modal" data-target="#add-product-modal" >
				
				<div class="card">
				
						<div class="card-body text-center">
						
							<div class="container">
								<img style="max-width: 75px;" class="img-fluid rounded-circle" alt="" src="img/plus.png">
							</div>
							<p class="mt-2">click here to add new product</p>
							<h1 class="text-uppercase text-muted">Add Product</h1>
						
						</div>
				
				</div>
			</div>
		</div>
	</div>	
	
	<!-- Add Category Modal -->
		
	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header custom-bg text-white">
	        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        
	        <form action="ProductOperationServlet" method="post">
	        
	        	<input type="hidden" name="operation" value="addcategory">
	        
	        	<div class="form-group">
	        		<input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required />
	        	        	
	        	</div>
	        
	        	<div class="form-group">
	        		<textarea style="height: 200px" class="form-control" placeholder="Enter category description" name="catDescription" required></textarea>
	        	
	        	</div>
	        	
	        	<div class="container text-center">
	        		<button class="btn btn-outline-success">Add Category</button>
	        		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      
	        	</div>
	        </form>
	    </div>
	  </div>
	</div>
  </div>
	
	<!-- End Add Category Modal -->
	
	<!-- ************************************************ -->
	
	<!-- Product Modal -->		
	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <!-- form  -->
	        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
	        	
	        	<input type="hidden" name="operation" value="addproduct" />
	        	
	        	<!-- product title -->
	        	<div class="form-group">
	        		<input type="text" class="form-control" placeholder="Enter title of product" name="pName" required />
	        	</div>	        	
	        	<!-- product description -->
	        	<div class="form-group">
	        		<textarea style="height:150px;" class="form-control" placeholder="Enter product description" name="pDesc"></textarea>
	        	
	        	</div>
	        	<!-- product price -->
	        	<div class="form-group">
	        		<input type="number" class="form-control" placeholder="Enter price of product" name="pPrice" required />
	        	</div>
	        	<!-- product Discount -->
	        	<div class="form-group">
	        		<input type="number" class="form-control" placeholder="Enter product discount" name="pDiscount" required />
	        	</div>
	        	<!-- product quantity -->
	        	<div class="form-group">
	        		<input type="number" class="form-control" placeholder="Enter product quantity" name="pQuantity" required />
	        	</div>
	        	
	        	<!-- product category -->
	        	
	        	
	        	<div class="form-group">
	        		<select name="catId" class="form-control">
	        			<%	        			
	        			for(Categary c: list){
	        			%>
	        				
	        			<option value=<%= c.getCategoryId() %>><%= c.getCategoryTitle() %></option>
	        			
	        			<%} %>
	        		</select>
	        	</div>
	        	
	        	<!-- product file -->
	        	<div class="form-group">
	        		<label for="pPic">Select picture of product</label>
	        		<br>
	        		<input type="file" name="pPic" required />
	        	
	        	</div>
	        	
	        	<!-- submit button  -->
	        	<div class="container text-center">
	        	
	        		<button class="btn btn-outline-success">Add Product</button>
	        	
	        	</div>
	        	
	        </form>
	        
	        
	        <!-- end form -->
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        
	      </div>
	    </div>
	  </div>
	</div>
	<!-- End Product Modal -->
	
	 <%@include  file="components/common_modals.jsp" %>
   
</body>
</html>