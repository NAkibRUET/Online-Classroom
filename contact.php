<?php
	require_once('inc/top.php');
?>






	<!--SECTION STARTS HERE -->
	<!--Please, place all your div/box/anything inside the above SECTION-->
	<div class="section" style="">
		<div class="box50">
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
			 <h5 class="boxHeader">Contact Us:</h5>
			 <form method="post">
			 	<label for="nameOfUser">Name:</label>
			 	<input required id="nameOfUser" type="text" name="nameOfUser" placeholder="Enter your name" class="form-control" autocomplete="off">
			 	<br>
			 	<label for="email">Email:</label>
			 	<input required id="email" type="email" name="email" placeholder="Enter your email" class="form-control" autocomplete="off">
			 	<br>
			 	<label for="mobile">Subject:</label>
			 	<input required id="mobile" type="text" name="mobile" placeholder="Enter the subject of your message" class="form-control" autocomplete="off">
			 	<br>
			 	<label for="message">Message:</label>
			 	<textarea required id="message" class="form-control"  placeholder="Enter your message here" rows="5"></textarea>
				<br>
			 	<button type="submit" id="sendMessage" class="btn btn-success">Send Message</button>
			</form>
		</div>
		
	</div>
	<!--Please, place all your div/box/anything inside the above SECTION-->





<?php
	require_once('inc/footer.php');
?>