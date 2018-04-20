<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  -->
<c:import url="header.html" />
<c:import url="navimenu_slidebar.html"></c:import>

<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<h2 class="title">Introduce</h2>
			<p style="font-size: large;">Shop hoa Đà Nẵng là địa chỉ quen thuộc của các bạn trẻ Đà Nẵng muốn tặng món quàn nhỏ nhỏ xinh xinh đến người yêu, người thân, đồng nghiệp và ngày cưới của mình. </p>
<div class="paragrap" style="text-align: center; font-size: large;">
Đóa hoa ấy đẹp tươi biết mấy
<br >
Anh rụt rè mang tới cho tôi 
<br >
Tôi thảng thốt con tim non dại 
<br >
Đã tưởng đâu sứ giả của mộng đời.
<br >
</div>
<p style="font-size: large;">
<br >
Hoa là món quà vô giá mà thiên nhiên đã dành tặng cho con người, chính vì vậy mà người thưởng hoa có thể gởi gắm tâm tư tình cảm của mình vào chậu hoa một cách tinh tế, ý nhị. Mỗi loài hoa mang một vẻ đẹp và sắc thái riêng, nếu cát tường tượng trưng cho sự mỏng manh nhưng đầy nghị lực, hoa hồng đỏ thể hiện tình yêu say đắm hay một nhành lam tím tượng trưng cho sự quý phái, thanh cao. Đến với hoa tươi đà nẵng, chúng tôi sẽ tư vấn nhiệt tình cho bạn giúp bạn hiểu được ý nghĩa của bó hoa tươi mình chọn để bạn tự tin thể hiện cảm xúc và tình cảm của mình với những người yêu thương!</p>

			<!--Product-->
			<h2 class="title">Products</h2>
			
			<div class="row">

				<!--Product infomation-->
				<div class="col-lg-9">
					<div class="row">
					
						<!--Product 1-->
						<c:if test="${listFL[0].name!=null}">
						<div class="col-sm-5 col-xs-12 product-info">
						
							<div class="row">
								<div class="col-lg-5">
									<div class="thumbnail product-item">
										<img src=<c:out value="images/${listFL[0].imgPath}"/> alt="hinh 1">
									</div>
								</div>
								<div class="col-lg-7 paragrap">
									<h4> <c:out value="${listFL[0].name}"/></h4>
									<span><c:out value="${listFL[0].price}đ"/></span>
									<p><c:out value="${listFL[0].detail}"/></p>
									
								</div>
							</div>
							<a class="pull-right moreinfo paragrap" href="#">More info</a>
						</div>
						</c:if>
						<!--End Product 1-->

						<!--Product 2-->
							<c:if test="${listFL[1].name!=null}">
						<div class="col-sm-5 col-xs-12 product-info">
					
							<div class="row">
								<div class="col-lg-5">
									<div class="thumbnail product-item">
										<img src=<c:out value="images/${listFL[1].imgPath}"/> alt="hinh 2">
									</div>
								</div>
								<div class="col-lg-7 paragrap">
									<h4> <c:out value="${listFL[1].name}"/></h4>
									<span><c:out value="${listFL[1].price}đ"/></span>
									<p><c:out value="${listFL[1].detail}"/></p>
									
								</div>
							</div>
							<a class="pull-right moreinfo paragrap" href="#">More info</a>
						</div>
							</c:if>
						<!--End Product 2-->
					
					</div>

					<!--Row Product 3 and 4-->
					<div class="row">

						<!--Product 3-->
						<c:if test="${listFL[2].name!=null}">
						<div class="col-sm-5 col-xs-12 product-info">
							<div class="row">
								<div class="col-lg-5">
									<div class="thumbnail product-item">
										<img src=<c:out value="images/${listFL[2].imgPath}"></c:out> alt="hinh 1">
									</div>
								</div>
								<div class="col-lg-7 paragrap">
									<h4><c:out value="${listFL[2].name}"></c:out> </h4>
										<span><c:out value="${listFL[2].price}đ"/></span>
									<p>	<c:out value="${listFL[2].detail}"/></p>
									
								</div>
							</div>
							<a class="pull-right moreinfo paragrap" href="#">More info</a>
						</div>
							</c:if>
						<!--End Product 3-->

						<!--Product 4-->
						<c:if test="${listFL[3].name!=null}">
						<div class="col-sm-5 col-xs-12 product-info">
							<div class="row">
								<div class="col-lg-5">
									<div class="thumbnail product-item">
										<img src=<c:out value="images/${listFL[3].imgPath}"></c:out> alt="hinh 1">
									</div>
								</div>
								<div class="col-lg-7 paragrap">
									<h4><c:out value="${listFL[3].name}"></c:out> </h4>
										<span><c:out value="${listFL[3].price}đ"/></span>
									<p>	<c:out value="${listFL[3].detail}"/></p>
									
								</div>
							</div>
							<a class="pull-right none-und moreinfo paragrap" href="#">More info</a>
						</div>
							</c:if>
						<!--End Product 4-->
						<!--End Products-->

						<!--Pagination-->
						<div class="clearfix"></div>
						<ul class="pagination pull-right" style="margin-right: 4%">
							<li <c:if test="${currentPage==1}">class="active"</c:if> ><a href="ListProduct?page=1">1</a></li>
							<li <c:if test="${currentPage==2}">class="active"</c:if> ><a href="ListProduct?page=2">2</a></li>
							<li <c:if test="${currentPage==3}">class="active"</c:if>><a href="ListProduct?page=3">3</a></li>
							<li <c:if test="${currentPage==4}">class="active"</c:if>><a href="ListProduct?page=4">4</a></li>
							<li <c:if test="${currentPage==5}">class="active"</c:if> ><a href="ListProduct?page=5">5</a></li>
						</ul>
						<!--End Pagination-->
					</div>
				</div>
				<c:import url="ads.html" />

			</div>
		</div>
	</div>


</div>
</body>
</html>