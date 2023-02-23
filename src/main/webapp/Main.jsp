<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link href="total.css" rel="stylesheet" type="text/css">
<style type="text/css">

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<title>메인 화면</title>

</head>
<%
	  HttpSession s = request.getSession();
      String userID = (String)session.getAttribute("userID");
      System.out.println(userID);
%>
   <nav class="navbar navbar-expand-lg" style="background-color: #9E1915; font-size:20px;">
  <div class="container-fluid">
    <a class="navbar-brand text-light" href="javascript:void(0)" onClick="javascript:main()">경희고등학교</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">
      <ul class="navbar-nav mb-2 mb-sm-0">
        <li class="nav-item">
          <a class="nav-link active text-light" aria-current="page" href="javascript:void(0)" onClick="javascript:monthly()">급식안내</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-light" href="javascript:void(0)" onClick="javascript:contentView()">게시판</a>
        </li>
        </ul>
        
        <ul class="navbar-nav" >
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-light" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            계정관리
          </a>
          <ul class="dropdown-menu">
          <%
           if(userID==null){
        %>
            <li><a class="dropdown-item" href="/userPage/userLogin.jsp">로그인</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="/userPage/userRegister.jsp">회원가입</a></li>
            <%
           }else{
        %>
           <li class="dropdown-item"> <%out.print(userID);%> </li>
           <li>
           <form method="post" action="/userCtrl?action=logout">
             <input class="dropdown-item" type="submit" value="로그아웃">
           </form>         
           </li>
         <%
        }
        %>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
<div class="container" style="margin-top : 50px;background-image: url("/contentPage/img/lion.png")" >
   
   <div class="row" style ="padding-bottom:10%;">
   	<video autoplay controls loop muted poster="poser.png" preload="auto">
  			<source src="movie.mp4" type="video/mp4">
		 </video>
   </div>
   <div class="row " style = "padding-bottom:10%;" >
      <div class ="col-7 bg-white border border-secondary rounded-1 shadow-lg align-content-around flex-wrap" style="margin:auto; ">
         
         <div style="margin-top:10%; font-size:2.5rem;">
            <div class="text-center"> 오늘의 급식 </div>
            <div class="text-center" style = "padding-bottom:10%; padding-left:10%; padding-right:10%;"  >${food}</div>
         </div>
      </div>
    </div>

</div>
<script>
	function monthly(){
	    let f = document.createElement('form');
	    f.setAttribute('method', 'post');
	    f.setAttribute('action', '/foodCtrl?action=monthly');
	    document.body.appendChild(f);
	    f.submit();
	}
	
	function contentView(){
	    let f = document.createElement('form');
	    f.setAttribute('method', 'post');
	    f.setAttribute('action', '/ContentsCtrl?action=list');
	    document.body.appendChild(f);
	    f.submit();
	}
	
	function main(userid){
	    let f = document.createElement('form');
	  	
	    let obj;
	    obj = document.createElement('input');
	    obj.setAttribute('type', 'hidden');
	    obj.setAttribute('name', 'userID');
	    obj.setAttribute('value', userid);
	    
	    f.appendChild(obj);
	    
	    f.setAttribute('method', 'post');
	    f.setAttribute('action', '/foodCtrl');
	    document.body.appendChild(f);
	    f.submit();
	}

	</script>
</body>
</html>