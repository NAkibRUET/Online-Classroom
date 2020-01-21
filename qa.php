<?php
    require_once('inc/top.php');
    if(empty($user)){
        header('Location: login.php');
    }
        
    $msg="";
    if(isset($_POST['submit'])){
        $qaHeading = $_POST['qaHeading'];
        $qaDetails = $_POST['qaDetails'];
        $qa = mysqli_query($con, "INSERT INTO `qa_post` (`id`, `title`, `user`, `userType`, `details`, `time`, `vote`) VALUES (NULL, '$qaHeading', '$user', '$userType', '$qaDetails', NOW(), '0');");
        if($qa){
            $msg = "<div class='alertSuccess'>
                        <i class='fa fa-times'></i> Successfully Posted!
                </div>";
        }
        else{
            $msg = "<div class='alertDanger'>
                        <i class='fa fa-times'></i> Something went wrong! Please try again.
                </div>";
        }
    }
?>

<!--SECTION STARTS HERE -->
	<!--Please, place all your div/box/anything inside the above SECTION-->
	<div class="section" style="">
		<div class="box80">
		 <h5 class="boxHeader">Create New Post:</h5>
            <?php
                if(isset($msg))echo $msg;
            ?>
            <form method="post">
                <label style="color:blue;" for="qaHeading">Heading:</label>
                <input required id="qaHeading" type="text" name="qaHeading" placeholder="Enter a title of your post" class="form-control">
                <br>
                <label style="color:blue;" for="qaDetails">Details:</label>
                <textarea required id="qaDetails" name="qaDetails" class="form-control" rows="6">
                </textarea>
                <script>
                        CKEDITOR.replace( 'qaDetails' );
                </script>               
			 	<br>
			 	<button type="submit" name="submit" id="postBtn" class="btn btn-info">Post</button>
            </form>
		</div>
        <div class="box80" style="margin-top:20px;">
		    <h5 class="boxHeader">Recent Q&A:</h5>
        <?php
            

            $qa_data = mysqli_query($con, "SELECT * FROM `qa_post` ORDER BY id DESC");
            if(mysqli_num_rows($qa_data)>0){
                while($row = mysqli_fetch_array($qa_data)){
                    $id = $row['id'];
                    $title = $row['title'];
                    $time = $row['time'];
                    $time = date('d-M h:i A', strtotime($time));

                    $userEmail = $row['user'];
                    $TypeofUser = $row['userType'];
                    if($TypeofUser == 'teacher'){
                        $teacher_info = mysqli_query($con, "SELECT * FROM teacher_register WHERE email = '$userEmail'");
                        $row = mysqli_fetch_array($teacher_info);
                        $teacher_name = $row['name'];
                ?>
                    
                    <a style="text-decoration: none;" href="qa_details.php?id=<?php echo $id; ?>"><div class="reviewBox hoverEffect paged-element" style="margin-bottom:10px;">
                    <div class="quoteSignOne"></div>
                    <div class="quoteSignTwo"></div>
                    <p style="font-weight: bold;"><?php echo $title?></p>
                    <h1><?php echo $time;?></h1>
                    <h1>by <span style="color:Maroon;"><?php echo $teacher_name; ?></span></h1>
                    </div></a>
                <?php
                    }
                    else if($TypeofUser == 'student'){
                        $student_info = mysqli_query($con, "SELECT * FROM student_register WHERE email = '$userEmail'");
                        $row = mysqli_fetch_array($student_info);
                        $student_name = $row['name'];
                ?>
                    
                    
                    <a style="text-decoration: none;" href="qa_details.php?id=<?php echo $id; ?>"><div class="reviewBox hoverEffect paged-element" style="margin-bottom:10px;">
                    <div class="quoteSignOne"></div>
                    <div class="quoteSignTwo"></div>
                    <p style="font-weight: bold;"><?php echo $title?></p>
                    <h1><?php echo $time;?></h1>
                    <h1>by <span style="color:RebeccaPurple;"><?php echo $student_name; ?></span></h1>
                    </div></a>
                    
                    <!--<a href="qa_details.php?id=<?php echo $id; ?>" style="text-decoration:none;"><div style="background:#A7CDF2; padding:15px; font-weight:bold; margin-top:10px; "><h5 style="width: 500px;"><?php echo $title; ?> - <i>by <small style="color: blue;"><?php echo $student_name ?></small></i> </h5></div></a>-->
                <?php
                    }

                }
            }
            else{
        ?>
            <h6 style="color:#7f7f7f; font-style: italic;">Nothing to show yet.</h6>
        <?php
            }
        ?>
        </div>
	</div>
	<!--Please, place all your div/box/anything inside the above SECTION-->
    
    <script type="text/javascript">
        ClassicEditor
            .create( document.querySelector( '#editor' ) )
            .then( editor => {
                console.log( editor );
            } )
            .catch( error => {
                console.error( error );
            } );
    </script>
<?php
	require_once('inc/footer.php');
?>