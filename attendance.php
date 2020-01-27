<?php
    require_once('inc/top.php');
    if(empty($user)){
        header('Location: login.php');
    }
        
    $msg="";
    if(isset($_POST['submit'])){
        $class = $_POST['class'];
        $section = $_POST['section'];
        $check = mysqli_query($con, "SELECT * FROM attendance_info WHERE teacher = '$user' AND class = '$class' AND section = '$section'");
        if(mysqli_num_rows($check)>0){
            $msg = "<div class='alertDanger'>
                        <i class='fa fa-times'></i> You have already created an attendace sheet for this class
                </div>";
        }
        else{
            $qr = mysqli_query($con, "INSERT INTO `attendance_info` (`id`, `teacher`, `class`, `section`) VALUES (NULL, '$user', '$class', '$section');");
            if($qr){
                $msg = "<div class='alertSuccess'>
                            <i class='fa fa-check'></i> Successfully Created!
                    </div>";
            }
            else{
                $msg = "<div class='alertDanger'>
                            <i class='fa fa-times'></i> Something went wrong! Please try again.
                    </div>";
            }
        }
}
?>

<!--SECTION STARTS HERE -->
	<!--Please, place all your div/box/anything inside the above SECTION-->
	<div class="section" style="">
        <div class="row">
            <div class="col-md-10">
                <?php 
                    if($userType == 'teacher'){
                ?>
        		<div class="box80">
        		 <h5 class="boxHeader">Create New Attendance Sheet:</h5>
                    <?php
                        if(isset($msg))echo $msg;
                    ?>
                    <form method="post">
                        <label style="color:blue;" for="class">Class:</label>
                        <select required id="class" name="class" class="form-control">
                            <option value="" disabled selected>Select Class</option>
                            <option value="Level 1 Term 1">Level 1 Term 1</option>
                            <option value="Level 1 Term 2">Level 1 Term 2</option>
                            <option value="Level 2 Term 1">Level 2 Term 1</option>
                            <option value="Level 2 Term 2">Level 2 Term 2</option>
                            <option value="Level 3 Term 1">Level 3 Term 1</option>
                            <option value="Level 3 Term 2">Level 3 Term 2</option>
                            <option value="Level 4 Term 1">Level 4 Term 1</option>
                            <option value="Level 4 Term 2">Level 4 Term 2</option>
                        </select>
                        <br>
                        <label style="color:blue;" for="section">Section:</label>
                        <select required id="section" name="section" class="form-control">
                            <option value="" disabled selected>Select Section</option>
                            <option value="A">A</option>
                            <option value="B">B</option>
                        </select>               
        			 	<br>
        			 	<button type="submit" name="submit" id="createBtn" class="btn btn-info">Create</button>
                    </form>
        		</div>
                <div class="box80" style="margin-top:20px;">
        		    <h5 class="boxHeader">Your Attendance Sheets:</h5>
                <?php
                    

                    $attendence_data = mysqli_query($con, "SELECT * FROM `attendance_info` WHERE teacher = '$user'");
                    if(mysqli_num_rows($attendence_data)>0){
                        while($row = mysqli_fetch_array($attendence_data)){
                            $id = $row['id'];
                            $class = $row['class'];
                            $section = $row['section'];

                            $className = $class .' - '.$section . ' Section';
                ?>
                    <a href="daily_attendance.php?id=<?php echo $id; ?>" style="text-decoration:none;"><div style="background:#A7CDF2; padding:15px; font-weight:bold; margin-top:10px; "><?php echo $className; ?></div></a>
                <?php

                        }
                    }
                    else{
                ?>
                    <h6 style="color:#7f7f7f; font-style: italic;">You haven't created anything yet.</h6>
                <?php
                    }
                ?>
                </div>
                <?php
                }
                else if($userType=='student'){
                ?>
                <div class="box80" style="margin-top:20px;">
                    <h5 class="boxHeader">Your Attendance Sheets:</h5>
                <?php
                    $qx = mysqli_query($con, "SELECT * FROM attendance_info WHERE section = '$studentSection' AND class = '$studentClass'");
                    if(mysqli_num_rows($qx)>0){
                        while($row = mysqli_fetch_array($qx)){
                            $id = $row['id'];
                            $class = $row['class'];
                            $section = $row['section'];
                            $teacher = $row['teacher'];
                            $teacher_info = mysqli_query($con, "SELECT * FROM teacher_register WHERE email = '$teacher'");
                            $row = mysqli_fetch_array($teacher_info);
                            $teacher_name = $row['name'];
                            $className = $class .' - '.$section . ' Section - '.$teacher_name.' Sir';
                ?>
                    <a href="daily_attendance.php?id=<?php echo $id; ?>" style="text-decoration:none;"><div style="background:#A7CDF2; padding:15px; font-weight:bold; margin-top:10px; "><?php echo $className; ?></div></a>
                <?php

                        }
                    }
                    else{
                ?>
                    <h6 style="color:#7f7f7f; font-style: italic;">There is no attendance info available for your class</h6>
                <?php
                    }
                ?>
                </div>
                <?php
                }
                ?>
                
            </div>
            <?php
                require_once('inc/chatbar.php');
            ?>
        </div>
	</div>
	<!--Please, place all your div/box/anything inside the above SECTION-->

<?php
	require_once('inc/footer.php');
?>