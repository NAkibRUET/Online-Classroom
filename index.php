<?php
	require_once('inc/top.php');
?>





	<!--SECTION STARTS HERE -->
	<!--Please, place all your div/box/anything inside the above SECTION-->
	<div class="section" style="">
		<div class="row">
			<div class="col-md-10">
				<div class="box90">
				 <h5>Demo</h5>
				 <form>
				 	<input type="text" name="" class="form-control">
				 	<input type="text" name="" class="form-control">
				 	<input type="text" name="" class="form-control">
				 </form>
				</div>
			</div>
			<?php if(!empty($user)){?>
			<div class="col-md-2">
				<div class="box2nd95" style="">
					<h6 class="box2ndHeader">Chat with Members:</h6>
					<div class="list-group" style="max-height: 300px;position: relative; overflow-y: scroll;">
					<?php 
						$qr= mysqli_query($con, "SELECT * FROM teacher_register ORDER BY id DESC");
						while($row=mysqli_fetch_array($qr)){
							$name = $row['name'];
							$email = $row['email'];
					?>
					  <a href="chat.php?username=<?php echo $email ?>" class="list-group-item list-group-item-action"><span style="color: maroon;"><?php echo $name; ?></span></a>
					 <?php
						}
					 ?>
					</div>
					<div class="list-group" style="max-height: 300px;position: relative; overflow-y: scroll;">
					<?php 
						$qr= mysqli_query($con, "SELECT * FROM student_register ORDER BY id DESC");
						while($row=mysqli_fetch_array($qr)){
							$name = $row['name'];
							$email = $row['email'];
					?>
					  <a href="chat.php?username=<?php echo $email ?>" class="list-group-item list-group-item-action"><span style="color: teal;"><?php echo $name; ?></span></a>
					 <?php
						}
					 ?>
					</div>
				</div>
			</div>
		<?php } ?>
		</div>
		
		
	</div>
	<!--Please, place all your div/box/anything inside the above SECTION-->




<?php
	require_once('inc/footer.php');
?>