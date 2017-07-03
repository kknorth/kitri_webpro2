<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<script>
	/* 	function statusChangeCallback(response) {
	 		console.log('statusChangeCallback'); console.log(response); 
	 		// response 객체는 현재 로그인 상태를 나타내는 정보를 보여준다. 
	 		// 앱에서 현재의 로그인 상태에 따라 동작하면 된다. 
	 		// FB.getLoginStatus().의 레퍼런스에서 더 자세한 내용이 참조 가능하다. 
	 		if (response.status === 'connected') { 
	 			// 페이스북을 통해서 로그인이 되어있다. 
	 			testAPI(); 
	 			} else if (response.status === 'not_authorized') { 
	 				// 페이스북에는 로그인 했으나, 앱에는 로그인이 되어있지 않다. 
	 				document.getElementById('status').innerHTML = 'Please log ' + 'into this app.'; 
	 			} else { 
	 					// 페이스북에 로그인이 되어있지 않다. 따라서, 앱에 로그인이 되어있는지 여부가 불확실하다. 
	 					document.getElementById('status').innerHTML = 'Please log ' + 'into Facebook.'; 
	 			} 
	 		} */
		function facebookRegist() { 
			// 페이스북 로그인 상태 체크 
			FB.getLoginStatus(function(response){ 
				if (response.status == "connected") { 
					// 페이스북 로그인 YES! and 앱 허가 YES! alert("페이스북 로그인 YES! and 앱 허가 YES!"); 
					handleFacebookRegist(response); 
					} else if (
							response.status == "not_authorized") 
					{ // 페이스북 로그인 YES! but 앱 허가 NO! alert("페이스북 로그인 YES! but 앱 허가 NO!"); 
					FB.login(function(response) { 
						handleFacebookRegist(response); }, 
						{scope: 'publish_stream, email, user_birthday, user_likes'}); 
					} else {	
						// 페이스북 로그아웃 상태. 
						alert("페이스북 로그인 NO!"); 
						FB.login(function(response) { 
							handleFacebookRegist(response); }, 
							{scope: 'publish_stream, email, user_birthday, user_likes'}); 
						} 
				});	
			}
		  
		/* function checkLoginState() {
			    FB.getLoginStatus(function(response) {
			      statusChangeCallback(response);
			    });
			} */
		  
		  window.fbAsyncInit = function() {
			    FB.init({
			      appId      : '349635012119334',
			      cookie     : true,
			   // 쿠키가 세션을 참조할 수 있도록 허용 
			      xfbml      : true,
			   // 소셜 플러그인이 있으면 처리 
			      version    : 'v2.8'
			    });
			    FB.AppEvents.logPageView();   
			  };
		
			 

		  // SDK를 비동기적으로 호출 
		  (function(d, s, id){
		     var js, fjs = d.getElementsByTagName(s)[0];
		     if (d.getElementById(id)) {return;}
		     js = d.createElement(s); js.id = id;
		     js.src = "//connect.facebook.net/en_US/sdk.js";
		     fjs.parentNode.insertBefore(js, fjs);
		   }(document, 'script', 'facebook-jssdk'));
		  
		  
			// 로그인이 성공한 다음에는 간단한 그래프API를 호출한다. 
	 		// 이 호출은 statusChangeCallback()에서 이루어진다. 
	 		function handleFacebookRegist(response) {
	 			console.log('Welcome! Fetching your information.... '); 
	 			var accessToken = response.authResponse.accessToken;
				var userId, userName, fbId, userBirth;
	 			FB.api('/me', function(response) { 
	 				userId = user.email; 
	 				userName = user.name; 
	 				fbId = user.id;
	 				
	 				$.ajax({
						type:"post",
						url:"ajax 로 호출할 url",
						dataType:"jsonp",
						jsonp:"callback",
						data:{
							userId : userId
						},
						beforeSend: function() {
							$('#ajax_load_indicator').fadeIn('fast');
						},
						success: function(data) {
							if (data.result == true) {
								alert("이미 가입이 되어있습니다.");
								return;
							} else {
								if (confirm("Facebook 계정으로 가입하시겠습니까?\n\rFacebook 계정으로 가입시 추가정보를 입력하셔야 합니다.")) {
									var $form = $("
								");
									$form.attr("action","페이스북에서 받은 정보를 post로 넘길 url");
									$form.attr("method","post");
									$form.appendTo("body");
									$form.append("");
									$form.append("");
									$form.append("");
									//$form.append("");    // mm/dd/yyyy 형식으로 받음.(짤라서 쓰던가 하믄 됨.)
									$form.submit();
								}
								return;
							}
						},
						error: function(data, status, err) {
							alert("서버와의 통신이 실패했습니다.");
							return;
						},
						complete: function() {
							$('#ajax_load_indicator').fadeOut();
						}
					});
	 		
	 				console.log(JSON.stringify(response));
	 				console.log('아이디 : ' + response.id);
	 				console.log('Successful login for : ' + response.name); 
	 				
	 				document.getElementById('name').innerHTML = 
	 					'Thanks for logging in, ' + response.name + '!'; 
	 				document.getElementById('id').innerHTML = 
	 					'yourID, ' + response.id + '!'; 
	 			}); 
	 			
	 		}
	 		 
					
					
	 		 
	 		

	 			
	</script>
		   
	<!-- 아래는 소셜 플러그인으로 로그인 버튼을 넣는다. 이 버튼은 자바스크립트 SDK에 그래픽 기반의 로그인 버튼을 넣어서 클릭시 FB.login() 함수를 실행하게 된다. --> 
	
	<!-- <fb:login-button 
	  scope="public_profile,email"
	  onlogin="checkLoginState();">
	</fb:login-button>

	<div id="fb-root"></div> -->	
		
	<div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="true" data-use-continue-as="false"></div>
	
	<div id="name"> </div><br/>
	<div id="id"></div>

</body>
</html>

