<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu</title>
</head>
<body>
	<%
		HttpSession s = request.getSession();
		String userID = (String)s.getAttribute("userID");
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
				<%
				if(userID==null){
				%>
					<a class="nav-link dropdown-toggle text-light" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						계정관리
					</a>
					<ul class="dropdown-menu">
				            <li><a class="dropdown-item" href="/userPage/userLogin.jsp">로그인</a></li>
				            <li><hr class="dropdown-divider"></li>
				            <li><a class="dropdown-item" href="/userPage/userRegister.jsp">회원가입</a></li>
				    </ul>
				<%
         		}else{
        		%>
        			<a class="nav-link dropdown-toggle text-light" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						<%out.print(userID);%>
					</a>
					<ul class="dropdown-menu">
						<li>
           					<form method="post" action="/UserCtrl?action=logout">
								<input class="dropdown-item" type="submit" value="로그아웃">
							</form>
						</li>
					</ul>
				<%
         		}
				 %>
				</li>
			</ul>
		</div>
	</div>
</nav>

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