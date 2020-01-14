
<?php
	require_once('inc/top.php');
?>





	<!--SECTION STARTS HERE -->
	<!--Please, place all your div/box/anything inside the above SECTION-->

	<div class="section" style="">
		<div class="box40">
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
			 <h5 class="boxHeader">Sign Up:</h5>
			 <form method="post">
			 	<label for="nameOfUser">Name:</label>
			 	<input required id="nameOfUser" type="text" name="nameOfUser" placeholder="Enter your name" class="form-control" autocomplete="off">
			 	<br>
			 	<label for="email">Email:</label>
			 	<input required id="email" type="email" name="email" placeholder="Enter your email" class="form-control" autocomplete="off">
			 	<br>
			 	<label for="mobile">Mobile No:</label>
			 	<input required id="mobile" type="text" name="mobile" placeholder="Enter your mobile no" class="form-control" autocomplete="off">
			 	<br>
			 	<label for="password">Password:</label>
			 	<input required id="password" type="password" name="password" placeholder="Enter your password"  class="form-control">
			 	<br>
			 	<label for="RetypePassword">Re-Type Password:</label>
			 	<input required id="RetypePassword" type="password" name="RetypePassword" placeholder="Enter your password again"  class="form-control">
			 	<br>
			 	<div class="user-option">
					<div class="checkbox">
						<label><input type="checkbox" name="remember_me" value="yes"> I agree to the <a href="#">Term & Conditions</a></label>
					</div>
				</div>
				<br>
			 	<button type="submit" id="signUpBtn" class="btn btn-success">Create Account</button>
			</form>
		</div>
		
	</div>
	<!--Please, place all your div/box/anything inside the above SECTION-->






<?php
	require_once('inc/footer.php');
?>