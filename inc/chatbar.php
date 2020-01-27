<?php
require_once('./db.php');
if(!empty($user)){?>
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
					  <a href="chat.php?username=<?php echo $email ?>" class="list-group-item list-group-item-action"><span style="color: RebeccaPurple;"><?php echo $name; ?></span></a>
					 <?php
						}
					 ?>
					</div>
				</div>
			</div>
		<?php } ?>