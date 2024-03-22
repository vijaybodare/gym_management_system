<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.Machines"%>
<%@page import="model.Member"%>
<%@page import="model.Trainer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gym Management</title>
 <link rel="icon" href="img/gm.jpg" type="image/jpg" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script type="text/javascript" src="JS/chart.js"></script><link rel="stylesheet" href="css/trainer.css">
<script src="js/member.js" type="text/javascript"></script>
</head>
<body class="text-start bg-dark">
<!-- navbar -->
<div class="sticky-top">
<nav class="navbar navbar-expand-lg  navbar-dark bg-secondary ">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="#"><b><i>Gym Management</i></b></a>
    <div class="collapse navbar-collapse text-end" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home">Home</a>
        </li>
     
        <li class="nav-item dropdown ">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Trainer Details
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><form class="d-flex dropdown-item" action="tList" method="post">
        <button style="border: none;outline: none;">Trainer List</button>
      </form>
      </li>
             <li><hr class="dropdown-divider"></li>
            <li><form class="d-flex dropdown-item" action="addTra" method="post">
        		<button style="border: none;outline: none;">Add New Trainer</button>
      			</form>
            </li>
            <li><hr class="dropdown-divider"></li>
            <li><form class="d-flex dropdown-item" action="tModify" method="post">
        		<button style="border: none;outline: none;">Modify Trainer Details</button>
      			</form></li>
             <li><hr class="dropdown-divider"></li>
            <li><form class="d-flex dropdown-item" action="tdel" method="post">
        		<button style="border: none;outline: none;">Delete Trainer Details</button>
      			</form></li>
          </ul>
        </li>
         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Member Details
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><form class="d-flex dropdown-item" action="mList" method="post">
        <button style="border: none;outline: none;">Member List</button>
      </form></li>
             <li><hr class="dropdown-divider"></li>
            <li><form class="d-flex dropdown-item" action="addMem" method="post">
        <button style="border: none;outline: none;">Add New Member</button>
      </form></li>
            <li><hr class="dropdown-divider"></li>
            <li><form class="d-flex dropdown-item" action="memCheck" method="post">
        <button style="border: none;outline: none;">Modify Member Details</button>
      </form></li>
             <li><hr class="dropdown-divider"></li>
            <li><form class="d-flex dropdown-item" action="memdel" method="post">
        <button style="border: none;outline: none;">Delete Member Details</button>
      </form></li>
          </ul>
        </li>
      
       <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Machine Details
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><form class="d-flex dropdown-item" action="mmList" method="post">
        <button style="border: none;outline: none;">Machine List</button>
      </form></li>
             <li><hr class="dropdown-divider"></li>
            <li><form class="d-flex dropdown-item" action="addMach" method="post">
        <button style="border: none;outline: none;">Add Machine Details</button>
      </form></li>
            <li><hr class="dropdown-divider"></li>
            <li><form class="d-flex dropdown-item" action="mechModify" method="post">
        <button style="border: none;outline: none;">Modify Machine Details</button>
      </form></li>
             <li><hr class="dropdown-divider"></li>
            <li><form class="d-flex dropdown-item" action="mechDel" method="post">
        <button style="border: none;outline: none;">Delete Machine Details</button>
      </form></li>
          </ul>
        </li>
        
         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Machine Booking
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
           <li><form class="d-flex dropdown-item" action="blist" method="post">
        <button style="border: none;outline: none;"> Booking Details</button>
      </form></li> <li><hr class="dropdown-divider"></li>
            <li><form class="d-flex dropdown-item" action="mbook" method="post">
        <button style="border: none;outline: none;">Book a machine</button> 
      </form></li>
             <li><hr class="dropdown-divider"></li>
            <li><form class="d-flex dropdown-item" action="cbook" method="post">
        <button style="border: none;outline: none;">Cancel Booking </button>
      </form></li>
            <li><hr class="dropdown-divider"></li>
            
             <li><hr class="dropdown-divider"></li>
            <li><form class="d-flex dropdown-item" action="seeReserv" method="post">
        <button style="border: none;outline: none;">See Reservation`s</button>
      </form></li>
      <li><hr class="dropdown-divider"></li>
            <li><form class="d-flex dropdown-item" action="#" method="post">
        <button style="border: none;outline: none;"> Reset Reservations</button>
      </form></li>
          </ul>
        </li>
         <li class="nav-item mx-2">
          <a href="https://www.instagram.com/vijaybodare_/?next=https%3A%2F%2Fwww.instagram.com%2Faccounts%2Fonetap%2F%3Fnext%3D%252Faccounts%252Flogout%252F%26__coig_login%3D1" title="Instagram" target="_blank"><img src="./img/inshtagram.jpg" style="height: 35px;width:35px;border-radius: 100px 100px;" alt="not found"></a>
        </li>
         <li class="nav-item mx-1">
         <a href="https://www.facebook.com/vijaybodare1403s2000" title="Facebook" target="_blank"><img src="./img/facebook.jpg" style="height: 35px;width:35px;border-radius: 100px 100px;" alt="not found"></a>
        </li>
         <li class="nav-item mx-1">
         <a href="https://api.whatsapp.com/send/?phone=%2B918408031080&text&type=phone_number&app_absent=0" title="WhatsApp" ><img src="./img/whatapp.jpg" style="height: 35px;width:35px;border-radius: 100px 100px;" alt="not found"></a>
        </li>
    </div>
     
    <div class="d-flex" style="height: 30px;width: 200px"><marquee><span class="text text-danger fs-4">${msgReg}</span></marquee></div>
    <div class="d-flex mx-1" >
    <form action="logout" method="post">
        <button title="Click To Logout" class="btn btn-danger" style="width: 150px;border-radius: 25px 0px 25px 0px;">
        <span class="fs-3 text-info">${op}</span>&nbsp;
        	<span class="fs-4 text-warning">${uname}</span>&nbsp;
    	<span class="fs-3 text-info">${cl}</span></button>
      </form>
    </div>
  </div>
</nav>
</div>
	<div class="container-lg" >
	<%
	
	try{
		String back=(String)request.getAttribute("back");
	
		if(back == null)
		{
	%> <br>
	<div class="container my-2" >
		
	   <img alt="not" src="https://images.pexels.com/photos/1954524/pexels-photo-1954524.jpeg" style="height: 450px;width: 100%; text-align: center;opacity: 0.4">
	</div>
<%
		}
	
	}catch(Exception e)
	{
		e.printStackTrace();
	}

%>
	<table  class="table table-hover table-dark table-bordered">
	
	 <%
		  	 Connection con=null;
		  
			  try {
					con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gym","root","shiv@123");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		  
		  PreparedStatement ps;
		  ResultSet rs;
		  ArrayList<Trainer> tli=new ArrayList<Trainer>();
		  ArrayList<Machines> mlishow=new ArrayList<Machines>();
		  ArrayList<Machines> mbookli=new ArrayList<Machines>();
		  Trainer tl;
		  Machines ml;
		  Machines mbl;
		  String getTname="SELECT tname,tcontact FROM trainer";
		  String getm="SELECT mname FROM machines";
		  String getmboking="SELECT * FROM machine_booking";
		  try{
				 ps= con.prepareStatement(getTname);
				rs=ps.executeQuery();
				while(rs.next()){
					tl=new Trainer(rs.getString(1),rs.getString(2));
					tli.add(tl);
				}
				ps= con.prepareStatement(getm);
				rs=ps.executeQuery();
				while(rs.next()){
					ml=new Machines(rs.getString(1));
					mlishow.add(ml);
				}
				ps= con.prepareStatement(getmboking);
				rs=ps.executeQuery();
				while(rs.next()){
					mbl=new Machines(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
					mbookli.add(mbl);
				}
		  }catch(Exception e){e.printStackTrace();}
				  
		  %>
	
	<%
	
	try{
		ArrayList<Trainer> tlist=(ArrayList<Trainer>)request.getAttribute("tlist");
		String tmodify=(String)request.getAttribute("tmodify");
		String tFound=(String)request.getAttribute("tFound");
		String tdel=(String)request.getAttribute("tdel");
		ArrayList<Member> mlist=(ArrayList<Member>)request.getAttribute("mlist");
		ArrayList<Machines> mmlist=(ArrayList<Machines>)request.getAttribute("mmlist");
		ArrayList<Machines> blist=(ArrayList<Machines>)request.getAttribute("blist");
		String mbook=(String)request.getAttribute("mbook");
		String mbookingForm=(String)request.getAttribute("mbookingForm");
		String cbook=(String)request.getAttribute("cbook");
		String seeReserv=(String)request.getAttribute("seeReserv");
		ArrayList<Machines> seeList=(ArrayList<Machines>)request.getAttribute("seeList");
		String addMach=(String)request.getAttribute("addMach");
		String mechModify=(String)request.getAttribute("mechModify");
		String mechDel=(String)request.getAttribute("mechDel");
		String addTra=(String)request.getAttribute("addTra");
		String addMem=(String)request.getAttribute("addMem");
		String memCheck=(String)request.getAttribute("memCheck");
		String getmemUpForm=(String)request.getAttribute("getmemUpForm");
		String memdel=(String)request.getAttribute("memdel");
		
		if(tlist!=null)
		{
	%> 
	<h3 class="text text-light">Trainer List</h3>
	<thead class="text text-center ">
    		<tr>
				<th scope="col">ID</th>
				<th scope="col">Profile</th>
				<th scope="col">Trainer Name</th>
				<th scope="col">Trainer Contact</th>
				<th scope="col">Gender</th>
			 </tr>
 	 </thead>
	<%
		for(Trainer t:tlist)
		{
			
		%>
		<tbody class="text text-center text-secondary">
            <tr>
            <th scope="row"><%=t.getTid()%></th>
            <td><img style="height: 50px;width: 80px;border-radius: 10px 10px" alt="not Found" src="img/tProfile/<%=t.gettProfile()%>"></td>
            <td><%=t.getTname() %></td>
			<td><%=t.getTcontact()%></td>
			<td><%=t.getTgender() %></td>
		</tr>
	</tbody>
		<%

		}
		}
		
	
		if(mlist!=null)
		{
	%> 
	<h3 class="text text-light ">Member List</h3>
	<thead class="text text-center">
    		<tr>
				<th scope="col">ID</th>
				<th scope="col">Fist Name</th>
				<th scope="col">Last Name</th>
				<th scope="col">Gender</th>
				<th scope="col">Contact</th>
				<th scope="col">Weight-(KG)</th>
				<th scope="col">Height-(Feet)</th>
				<th scope="col">Program</th>
				<th scope="col">Trainer Name</th>
				<th scope="col">Session</th>
				<th scope="col">Membership</th>
			 </tr>
 	 </thead>
	<%
		for(Member m:mlist)
		{
			
		%>
		<tbody class="text text-center text-secondary">
            <tr>
            <th scope="row"><%=m.getMid()%></th>
			<td><%= m.getMfname()%></td>
			<td><%=m.getMlname()%></td>
			<td><%= m.getMgender()%></td>
			<td><%=m.getMcontact() %></td>
			<td><%= m.getMweight()%></td>
			<td><%=m.getMheight() %></td>
			<td><%= m.getMprogram()%></td>
			<td><%=m.getMtrainer()%></td>
			<td><%= m.getMsession()%></td>
			<td><%= m.getMmembership()%></td>
			
		</tr>
	</tbody>
		<%

		}
		}
		
	if(mmlist!=null)
	{
%> 
<h3 class="text text-light ">Machines List</h3>
<thead class="text text-center">
		<tr>
			<th scope="col">ID</th>
			<th scope="col">Machine Name</th>
			<th scope="col">Available`s Booking </th>
			
		 </tr>
	 </thead>
<%

	for(Machines mm:mmlist)
	{
		
	%>
	<tbody class="text text-center text-secondary">
        <tr>
        <th scope="row"><%=mm.getMid()%></th>
		<td><%= mm.getMname()%></td>
		<td><%= mm.getBooking()%></td>
	</tr>
</tbody>
	<%

	}
	}
	
	if(addTra!=null)
	{
%> 
<div class="container text text-center text-secondary my-3 " >
	<span class="fs-3" style="color:green; text-align:left;"> Add Trainers</span>
      <form action="tReg" autocomplete="on" method="post" enctype="multipart/form-data">
			<div class="row">
			  <div class="col">
			    <input type="text" class="form-control" required oninput="trainer()" name="tname" placeholder="Trainer Name" aria-label="First name" >
			  </div>
			</div>
			<div class="row my-2">
			  <div class="col">
			    <input type="text" class="form-control" required oninput="trainer()" name="tcon" placeholder="Trainer Contact" aria-label="phone name">
			  </div>
			</div>
		
			 	<button><input type="file" name="img" id="img"></button>
			  
			<div class="row my-2">
			<div class="col">
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="tgen" id="inlineRadio1" value="male">
				  <label class="form-check-label" for="inlineRadio1">Male</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="tgen" id="inlineRadio2" value="female">
				  <label class="form-check-label" for="inlineRadio2">Female</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="tgen" id="inlineRadio3" value="other" >
				  <label class="form-check-label" for="inlineRadio3">Other</label>
				</div>
				</div>
				</div>
				<div class="d-flex offset-md-5 my-2">
  				<button class="btn btn-outline-success">Register</button>
			</div>
      </form>
</div>

	<%

	}
	
	if(tmodify!=null)
	{
%> 
<div class="container text text-center text-secondary my-3 " >
	<span class="fs-3" style="color:green; text-align:left;"> Check Trainer Data</span>
      <form method="post" action="tcheck" autocomplete="on">
			<div class="row">
			  <div class="col">
			    <input type="text" class="form-control" required oninput="trainer()" name="tnames" placeholder="Trainer Name" aria-label="First name" >
			  </div>
			</div>
			<div class="row my-2">
			  <div class="col">
			    <input type="text" class="form-control" required oninput="trainer()" name="tcont" placeholder="Trainer Contact" aria-label="phone name">
			  </div>
			</div>
			
				<div class="d-flex offset-md-5 my-2">
  				<button class="btn btn-outline-warning">Check Data</button>
			</div>
      </form>
</div>

	<%

	}
	
	
	if(tFound!=null)
	{
%> 
<div class="container text text-center text-secondary my-3 " >
	<span class="fs-3" style="color:green; text-align:left;"> Update Trainers Data</span>
      <form method="post" action="tup" autocomplete="on">
			<div class="row">
			  <div class="col">
			    <input type="text" class="form-control" required oninput="trainer()" name="tname" placeholder="Trainer Name" aria-label="First name" >
			  </div>
			</div>
			<div class="row my-2">
			  <div class="col">
			    <input type="text" class="form-control" required oninput="trainer()" name="tcon" placeholder="Trainer Contact" aria-label="phone name">
			  </div>
			</div>
			<div class="row my-2">
			<div class="col">
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="tgen" id="inlineRadio1" value="male">
				  <label class="form-check-label" for="inlineRadio1">Male</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="tgen" id="inlineRadio2" value="female">
				  <label class="form-check-label" for="inlineRadio2">Female</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="tgen" id="inlineRadio3" value="other" >
				  <label class="form-check-label" for="inlineRadio3">Other</label>
				</div>
				</div>
				</div>
				<div class="d-flex offset-md-5 my-2">
  				<button class="btn btn-outline-secondary">Update Data</button>
			</div>
      </form>
</div>
	<%

	}
	
	if(tdel!=null)
	{
%> 
<div class="container text text-center text-secondary my-3 " >
	<span class="fs-3" style="color:green; text-align:left;"> Delete Data</span>
      <form method="post" action="tdelete" autocomplete="on">
			<div class="mb-3">
		  <select class="form-select" name="tname" id="tname" aria-label="Default select example" required>
			  <option selected value="">Select Name :</option>
			
			  <%
			  if(tli!=null){
				  for(Trainer t:tli)
				  {
			  %>
			  <option name="<%=t.getTname() %>" id="<%=t.getTname() %>" value="<%=t.getTname() %>"><%=t.getTname().toUpperCase() %> -- <%=t.getTcontact().toString().toLowerCase()%></option>
			
	<%}}%>
	
			</select>
		</div>
				<div class="d-flex offset-md-5 my-2">
  				<button class="btn btn-outline-danger mx-4">Delete</button>
			</div>
      </form>
</div>
<div class="container border border-danger">
 <div class="d-flex m-1 p-1">
 <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRL_77dBC3Oj4mQjL1CUJDrmOinbZBxR0PVw&usqp=CAU" style="height: 270px;width:100%;border-radius: 100px 100px;" alt="not found">
   </div> 
</div>
	<%

	}
	if(addMach!=null)
	{
%> 
<div class="container text text-center text-secondary my-3 " >
	<span class="fs-3" style="color:green; text-align:left;"> Add Machine Data</span>
      <form method="post" action="machReg" autocomplete="on">
			<div class="row">
			  <div class="col">
			    <input type="text" class="form-control" required oninput="trainer()" name="machname" placeholder="Enter Machine Name" aria-label="First name" >
			  </div>
			</div>
			
				<div class="d-flex offset-md-5 my-2">
  				<button class="btn btn-outline-success">Add Data</button>
			</div>
      </form>
</div>

	<%

	}
	
	if(mechModify!=null)
	{
%> 
<div class="container text text-center text-secondary my-3 " >
	<span class="fs-3" style="color:green; text-align:left;"> Update Machine Data</span>
      <form method="post" action="mechUp" autocomplete="on">
			<div class="row">
			  <div class="col">
			    <input type="text" class="form-control" required oninput="trainer()" name="machname" placeholder="Enter Machine Name" aria-label="First name" >
			  </div>
			</div>
			
				<div class="d-flex offset-md-5 my-2">
  				<button class="btn btn-outline-warning">Update</button>
			</div>
      </form>
</div>
<div class="container border border-warning">
 <div class="d-flex m-1 p-1">
 <img src="https://www.primalstrength.com/cdn/shop/files/gymdesign_render_Two_collumn_grid_cb1b5850-fa8e-4a7b-a2b3-190c2e45facd.jpg?v=1680719688&width=1500" style="height: 290px;width:100%;border-radius: 30px 30px;" alt="not found">
   </div> 
</div>
	<%

	}
	if(mechDel!=null)
	{
%> 
<div class="container text text-center text-secondary my-3 " >
	<span class="fs-3" style="color:green; text-align:left;"> Delete Machine Data</span>
      <form method="post" action="mechDelete" autocomplete="on">
			<div class="row">
			  <div class="col">
			    <input type="text" required class="form-control" oninput="trainer()" name="machId" placeholder="Enter Machine ID" aria-label="First name" >
			  </div>
			</div>
			
				<div class="d-flex offset-md-5 my-2">
  				<button class="btn btn-outline-danger">Delete</button>
			</div>
      </form>
</div>
<div class="container border border-danger">
 <div class="d-flex m-1 p-1">
 <img src="https://dumbbellshub.com/wp-content/uploads/2020/06/Dumbbell-Workouts-for-Mass-scaled.jpg" style="height: 290px;width:100%;border-radius: 30px 30px;" alt="not found">
   </div> 
</div>
	<%

	}
	
	if(addMem!=null)
	{
%> 
<div class="container text-info">
<h2 class="text-center text-info">Member Details </h2>
	<form action="mReg" method="post">
		<div class="mb-3">
		  <label for="formGroupExampleInput" class="form-label">First Name :</label>
		  <input type="text" class="form-control" oninput="input()" name="fname" id="fname" placeholder="Enter Your First Name" required>
		</div>
		<div class="mb-3">
		  <label for="formGroupExampleInput2" class="form-label">Last Name :</label>
		  <input type="text" class="form-control" oninput="input()" name="lname" id="lname" placeholder="Enter Your Last Name" required>
		</div>
		<div class="mb-3">
		  <label for="formGroupExampleInput2" class="form-label">Phone No:</label>
		  <input type="text" class="form-control" oninput="input()" name="con" id="con" placeholder="Enter Your Mobile Number" required>
		</div>
		<div class="mb-3">
		  <label for="formGroupExampleInput2" class="form-label">Weight :</label>
		  <input type="text" class="form-control" oninput="input()" name="w" id="w" placeholder="Enter Your Weight in KG" required>
		</div>
		<div class="mb-3">
		  <label for="formGroupExampleInput2"  class="form-label">Height :</label>
		  <input type="text" class="form-control" oninput="input()" name="h" id="h" placeholder="Enter Your Height in feet" required>
		</div>
		<select class="form-select" name="program" id="program" aria-label="Default select example" required>
		  <option selected>Select Program</option>
		  <option value="Weight Loss">Weight Loss</option>
		  <option value="Muscle Gain">Muscle Gain</option>
		  <option value="Shredding">Shredding</option>
		</select>
		<div class="mb-3">
		  <label for="formGroupExampleInput2" class="form-label">Trainer Name :</label>
		 
		  <select class="form-select" name="tname" id="tname" aria-label="Default select example" required>
			  <option selected value="">Select Session :</option>
			  <%
			  if(tli!=null){
				  for(Trainer t:tli)
				  {
			  %>
			  <option name="<%=t.getTname() %>" id="<%=t.getTname() %>" value="<%=t.getTname() %>"><%=t.getTname() %></option>
			 
	<%}}%>
			</select>
		</div>
		<select class="form-select" name="session" id="session" aria-label="Default select example" required>
			  <option selected value="">Select Session :</option>
			  <option name="session" id="session" value="Morning">Morning</option>
			  <option name="session" id="session" value="Evening">Evening</option>
			  
			</select>
		<select class="form-select my-1" name="membership" id="membership" aria-label="Default select example">
			  <option selected value="">Select Membership :</option>
			  <option name="membership" id="membership" value="OneY">One Year  (80,000 PKR)</option>
			   <option name="membership" id="membership" value="SixM">Six Months (40,000 PKR)</option>(10,000PKR)
			  <option  name="membership" id="membership" value="ThreeM">Three Months (20,000 PKR)</option>
			  <option name="membership" id="membership" value="OneM">One Months (10,000 PKR)</option>
			</select>
			
			<div class="d-flex offset-md-5 my-1">
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="mgen" id="inlineRadio1" value="male">
				  <label class="form-check-label" for="inlineRadio1">Male</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="mgen" id="inlineRadio2" value="female">
				  <label class="form-check-label" for="inlineRadio2">Female</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="mgen" id="inlineRadio3" value="other" >
				  <label class="form-check-label" for="inlineRadio3">Other</label>
				</div>
				</div>
				
			<div class="d-flex offset-md-6 my-2">
  				<button class="btn btn-outline-success">Register</button>
			</div>
	</form>
	</div>


	<%

	}
	
	if(memCheck!=null)
	{
%> 
<div class="container text-info">
<h2 class="text-center text-info">Check Member Details </h2>
	<form action="getUpForm" method="post">
		<div class="mb-3">
		  <label for="formGroupExampleInput" class="form-label">First Name :</label>
		  <input type="text" class="form-control" name="fname" id="fname" placeholder="Enter Your First Name" required>
		</div>
		<div class="mb-3">
		  <label for="formGroupExampleInput2" class="form-label">Last Name :</label>
		  <input type="text" class="form-control" name="lname" id="lname" placeholder="Enter Your Last Name" required>
		</div>
		<div class="mb-3">
		  <label for="formGroupExampleInput2" class="form-label">Phone No:</label>
		  <input type="text" class="form-control" oninput="input()" name="con" id="con" placeholder="Enter Your Mobile Number" required>
		</div>
		
			<div class="d-flex offset-md-6 my-2">
  				<button class="btn btn-outline-warning">Check Data</button>
			</div>
	</form>
	</div>


	<%

	}
	
	
	if(memdel!=null)
	{
%> 
<div class="container text-info">
<h2 class="text-center text-info">Delete Member Details </h2>
	<form action="delMem" method="post">
		<div class="mb-3">
		  <label for="formGroupExampleInput" class="form-label">First Name :</label>
		  <input type="text" class="form-control" name="fname" id="fname" placeholder="Enter Your First Name" required>
		</div>
		<div class="mb-3">
		  <label for="formGroupExampleInput2" class="form-label">Last Name :</label>
		  <input type="text" class="form-control" name="lname" id="lname" placeholder="Enter Your Last Name" required>
		</div>
		<div class="mb-3">
		  <label for="formGroupExampleInput2" class="form-label">Phone No:</label>
		  <input type="text" class="form-control" oninput="input()" name="con" id="con" placeholder="Enter Your Mobile Number" required>
		</div>
		
			<div class="d-flex offset-md-6 my-2">
  				<button class="btn btn-outline-danger">Delete</button>
			</div>
	</form>
	</div>


	<%

	}
	
	if(getmemUpForm!=null)
	{
%> 
<div class="container text-info">
<h2 class="text-center text-info">Enter New Details </h2>
	<form action="mReg" method="post">
		<div class="mb-3">
		  <label for="formGroupExampleInput" class="form-label">First Name :</label>
		  <input type="text" class="form-control" name="fname" id="fname" placeholder="Enter Your First Name" required>
		</div>
		<div class="mb-3">
		  <label for="formGroupExampleInput2" class="form-label">Last Name :</label>
		  <input type="text" class="form-control" name="lname" id="lname" placeholder="Enter Your Last Name" required>
		</div>
		<div class="mb-3">
		  <label for="formGroupExampleInput2" class="form-label">Phone No:</label>
		  <input type="text" class="form-control" oninput="input()" name="con" id="con" placeholder="Enter Your Mobile Number" required>
		</div>
		<div class="mb-3">
		  <label for="formGroupExampleInput2" class="form-label">Weight :</label>
		  <input type="text" class="form-control" oninput="input()" name="w" id="w" placeholder="Enter Your Weight in KG" required>
		</div>
		<div class="mb-3">
		  <label for="formGroupExampleInput2"  class="form-label">Height :</label>
		  <input type="text" class="form-control" oninput="input()" name="h" id="h" placeholder="Enter Your Height in feet" required>
		</div>
		<select class="form-select" name="program" id="program" aria-label="Default select example" required>
		  <option selected>Select Program</option>
		  <option value="Weight Loss">Weight Loss</option>
		  <option value="Muscle Gain">Muscle Gain</option>
		  <option value="Shredding">Shredding</option>
		</select>
		<div class="mb-3">
		  <label for="formGroupExampleInput2" class="form-label">Trainer Name :</label>
		  <input type="text" class="form-control" name="tname" id="tname" placeholder="Enter Your Trainer Name ">
		</div>
		<select class="form-select" name="session" id="session" aria-label="Default select example" required>
			  <option selected value="">Select Session :</option>
			  <option name="session" id="session" value="Morning">Morning</option>
			  <option name="session" id="session" value="Evening">Evening</option>
			  
			</select>
		<select class="form-select my-1" name="membership" id="membership" aria-label="Default select example">
			  <option selected value="">Select Membership :</option>
			  <option name="membership" id="membership" value="OneY">One Year  (80,000 PKR)</option>
			   <option name="membership" id="membership" value="SixM">Six Months (40,000 PKR)</option>(10,000PKR)
			  <option  name="membership" id="membership" value="ThreeM">Three Months (20,000 PKR)</option>
			  <option name="membership" id="membership" value="OneM">One Months (10,000 PKR)</option>
			</select>
			
			<div class="d-flex offset-md-5 my-1">
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="mgen" id="inlineRadio1" value="male">
				  <label class="form-check-label" for="inlineRadio1">Male</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="mgen" id="inlineRadio2" value="female">
				  <label class="form-check-label" for="inlineRadio2">Female</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="mgen" id="inlineRadio3" value="other" >
				  <label class="form-check-label" for="inlineRadio3">Other</label>
				</div>
				</div>
				
			<div class="d-flex offset-md-6 my-2">
  				<button class="btn btn-outline-success">Update Data</button>
			</div>
	</form>
	</div>


	<%

	}
	
	if(blist!=null)
	{
%> 
<h3 class="text text-light ">Booking List</h3>
<thead class="text text-center">
		<tr>
			<th scope="col">ID</th>
			<th scope="col">Member Name</th>
			<th scope="col">Machine Name</th>
			<th scope="col">Session</th>
		 </tr>
	 </thead>
<%

	for(Machines bm:blist)
	{
		
	%>
	<tbody class="text text-center text-secondary">
        <tr>
        <th scope="row"><%=bm.getMid()%></th>
        <td><%= bm.getMemname()%></td>
		<td><%= bm.getMname()%></td>	
		<td><%= bm.getBsession()%></td>
	</tr>
</tbody>
	<%

	}
	}
	
	if(mbook!=null)
	{
%> 
<div class="container text text-center text-secondary my-1 " >
	<span class="fs-3" style="color:green; text-align:left;"> Check Machine </span>
      <form method="post" action="mbooking" autocomplete="on">
			<div class="row">
			 <div class="col-8" >
		  <select class="form-select " style="height: 40px;width: 70%;" name="mname" id="mname" aria-label="Default select example"  required>
			  <option selected value="">Select Machine Name :</option>
			  <%
			  if(mlishow!=null){
				  for(Machines m:mlishow)
				  {
			  %>
			  <option name="<%=m.getMname() %>" id="<%=m.getMname() %>" value="<%=m.getMname() %>"><%=m.getMname() %></option>
			 
	<%}}%>
			</select>
		</div>
			
			<div class="col-4">
				<div class="d-flex offset-md-5">
  				<button class="btn btn-outline-info">Check</button>
			</div>
			</div>
			</div>
      </form>
</div>

	<%

	}
	
	if(mbookingForm!=null)
	{
%> 
<div class="container text text-center text-secondary my-3 " >
	<span class="fs-3" style="color:green; text-align:left;"> Book Machine </span>
      <form method="post" action="mbookingDone" autocomplete="on">
			<div class="row">
			  <div class="col">
			 <!--  <label class="text-warning">Select Session :</label> -->
				<select class="form-select" name="session" id="session" aria-label="Default select example" required> 
					<option>Select Session :</option>
					  <option name="session" id="session" value="Morning">Morning</option>
					  <option name="session" id="session" value="Evening">Evening</option>
				</select>
			  </div>
			</div>
			
				<div class="d-flex offset-md-5 my-2">
  				<button class="btn btn-outline-secondary">Book</button>
			</div>
      </form>
</div>

	<%

	}
	
	
	
	if(cbook!=null)
	{
%> 
<div class="container text text-center text-secondary my-3 " >
	<span class="fs-3" style="color:green; text-align:left;"> Cancel Machine </span>
      <form method="post" action="cbooking" autocomplete="on">
			<div class="row">
			 <div class="mb-3">
		  <select class="form-select" name="cid" id="cid" aria-label="Default select example" required>
			  <option selected value="">Select AnyOne :</option>
			  <%
			  if(mbookli!=null){
				  for(Machines mll:mbookli)
				  {
			  %>
			  <option name="<%=mll.getMid() %>" id="<%=mll.getMid() %>" value="<%=mll.getMid()%>"><%=mll.getMemname().toUpperCase()%> - <%=mll.getMname()%> - <%=mll.getBsession()%></option>
			 
	<%}}%>
			</select>
		</div>
				<div class="d-flex offset-md-5 my-2">
  					<button class="btn btn-outline-danger">Cancel</button>
				</div>
			</div>
      </form>
</div>

	<%

	}
	if(seeReserv!=null)
	{
%> 
<div class="container text text-center text-secondary my-3 " >
	<span class="fs-3" style="color:green; text-align:left;"> See Machine Reservation`s </span>
      <form method="post" action="seeRes" autocomplete="on">
			<div class="row">
			  <div class="col">
			 <!--  <label class="text-warning">Select Session :</label> -->
				<select class="form-select" name="seeRes" id="seeRes" aria-label="Default select example" required> 
					<option>Select Session :</option>
					  <option name="seeRes" id="seeRes" value="Morning">Morning</option>
					  <option name="seeRes" id="seeRes" value="Evening">Evening</option>
				</select>
			  </div>
			</div>
			
				<div class="d-flex offset-md-5 my-2">
  				<button class="btn btn-outline-secondary">Let`s See</button>
			</div>
      </form>
</div>

	<%

	}
	
	if(seeList!=null)
	{
%> 
<h3 class="text text-light ">Reservation List</h3>
<thead class="text text-center">
		<tr>
			<th scope="col">ID</th>
			<th scope="col">Member Name</th>
			<th scope="col">Machine Name</th>
			<th scope="col">Session</th>
			
		 </tr>
	 </thead>
<%

	for(Machines mm:seeList)
	{
		
	%>
	<tbody class="text text-center text-secondary">
        <tr>
        <th scope="row"><%=mm.getMid()%></th>
        <td><%= mm.getMemname()%></td>
		<td><%= mm.getMname()%></td>
		<td><%= mm.getBsession()%></td>
		
	</tr>
</tbody>
	<%

	}
	}
	
	}catch(Exception e)
	{
		e.printStackTrace();
	}

%>
	
	</table>

	</div>
	
</body>
</html>
<%@include file="footer.jsp" %>