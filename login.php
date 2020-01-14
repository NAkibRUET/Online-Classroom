<?php
	require_once('inc/top.php');
?>






	<!--SECTION STARTS HERE -->
	<!--Please, place all your div/box/anything inside the above SECTION-->
	<div class="section" style="">
		<div class="box30">

			<!--For Alert Messages Use the Following-->
			<!--Error / UnSuccessful Event
			
			 <div class="alertDanger">
			  	<i class="fa fa-times"></i> Type The Message Here
			 </div>

			-->

			<!--Successful Event / Success Message

			 <div class="alertSuccess">
			  	<i class="fa fa-check"></i> Type The Message Here
			 </div>

			-->
			 <h5 class="boxHeader">Login:</h5>
			 
			 <form method="post">
			 	<label for="email">Email:</label>
			 	<input required id="email" type="email" name="email" placeholder="Enter your email" class="form-control" autocomplete="off">
			 	<br>
			 	<label for="password">Password:</label>
			 	<input required id="password" type="password" name="password" placeholder="Enter your password"  class="form-control">
			 	<br>
			 	<div class="user-option">
					<div class="checkbox pull-left">
						<label><input type="checkbox" name="remember_me" value="yes"> Remember me</label>
					</div>
					<div class="pull-right forgot-password">
						<a href="#">Forgot password?</a>
					</div>
				</div>
				<br>
				<br>
			 	<button type="submit" id="loginBtn" class="btn btn-success">Login</button>
			 </form>
		</div>
		<br>
		<center><a href="signup.html" class="btn btn-primary createAccountButton">Create New Account</button></a>
	</div>
	<!--Please, place all your div/box/anything inside the above SECTION-->





<?php
	require_once('inc/footer.php');
?>