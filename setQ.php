<?php
    require_once('inc/top.php');
    if(empty($user)){
        header('Location: login.php');
    }
    else if($userType=='student'){
        header('Location: index.php');   
    }
    if(isset($_GET['id'])){
        $exam_id = $_GET['id'];
    }   

    if(isset($_POST['publishResult'])){
        $pq = mysqli_query($con, "SELECT DISTINCT student FROM `answer_submit` WHERE exam_id = '$exam_id';"); 
        if(mysqli_num_rows($pq)>0){
            while($row = mysqli_fetch_array($pq)){
                $student = $row['student'];
                $px = mysqli_query($con, "SELECT * FROM `answer_submit` WHERE exam_id = '$exam_id' AND student = '$student' AND correct = '1'");
                $count = mysqli_num_rows($px);
                $insert = mysqli_query($con, "INSERT INTO `online_exam_result`(`id`, `exam_id`, `student`, `mark`) VALUES (NULL,'$exam_id','$student','$count')");
            }
        }
    }

    date_default_timezone_set("Asia/Dhaka");
    $exam_query = mysqli_query($con, "SELECT * FROM `online_exam` WHERE `id` = '$exam_id'");
    if(mysqli_num_rows($exam_query)>0){
        $row = mysqli_fetch_array($exam_query);
        $title = $row['title'];
        $class = $row['class'];
        $section = $row['section'];
        $className = $class.' - '.$section;
        $subject = $row['subject'];
        $teacher = $row['teacher'];
        $noq = $row['no_of_question'];
        $start_date = $row['date'];
        $start_time = $row['start'];
        $start_timeObj =new DateTime($start_time);
        $end_time = $row['end'];
        $current_date = date('Y-m-d');
        $current_time = date('H:i:s');    
        
        $fl = 0;
        if($current_date == $start_date){
            if($current_time > $start_time){
                if($current_time < $end_time){
                    $fl = 2;
                }
                else{
                    $fl = 1;
                }

            }
        }
        else if($current_date>$start_date){
            $fl = 1;
        }
        //$time_difference = new DateTime(date('Y-m-d H:i:s', strtotime($time_difference)));
        
    }

    $msg="";
    if(isset($_POST['addQ'])){
        $Q_query = mysqli_query($con, "SELECT * FROM `exam_questions` WHERE `exam_id` = '$exam_id'");
        $count = mysqli_num_rows($Q_query);

        $question = $_POST['question'];
        $op1 = $_POST['op1'];
        $op2 = $_POST['op2'];
        $op3 = $_POST['op3'];
        $op4 = $_POST['op4'];
        $ans = $_POST['ans'];
        $duration = ($count+1)*30;
        $end_time = $start_timeObj->modify('+'.$duration.' seconds');
        $end_time = $end_time->format("H:i:s");
        $q_no = $count + 1; 

        $qa = mysqli_query($con, "INSERT INTO `exam_questions`(`id`, `exam_id`, `q_no`, `question`, `answer`, `option1`, `option2`, `option3`, `option4`, `end`) VALUES (NULL, '$exam_id','$q_no', '$question', '$ans', '$op1', '$op2', '$op3', '$op4', '$end_time');");
        if($qa){
            $msg = "<div class='alertSuccess'>
                        <i class='fa fa-check'></i> Successfully Added!
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
            <h5 class="boxHeader">Title: <?php echo $title; ?></h5>
            <h6><b>Subject:</b> <?php echo $subject; ?></h6>
            <h6><b>Class:</b> <?php echo $className; ?></h6>
            <h6><b>Number of question:</b> <?php echo $noq; ?></h6>
            <h6><b>Start Time:</b> <?php echo date('d M', strtotime($start_date)); ?> - <?php echo date('h:i A', strtotime($start_time)); ?></h6>
            <h6><b>Question:</b></h6>
            <?php
                $Questions_query = mysqli_query($con, "SELECT * FROM `exam_questions` WHERE `exam_id` = '$exam_id'");
                if(mysqli_num_rows($Questions_query)>0){
                    $i=1;
                    while($row = mysqli_fetch_array($Questions_query)){
                        $ques = $row['question'];
                        $option1 = $row['option1'];
                        $option2 = $row['option2'];
                        $option3 = $row['option3'];
                        $option4 = $row['option4'];
                        $answer = $row['answer'];
            ?>
            <h6><?php echo $i; ?>. <?php echo $ques; ?></h6>
            <div class="form-inline">
                <?php echo 'A) '.$option1; ?>&nbsp;
                <?php echo 'B) '.$option2; ?>&nbsp;
                <?php echo 'C) '.$option3; ?>&nbsp;
                <?php echo 'D) '.$option4; ?>&nbsp;
            </div>
            <h6>Answer: <?php echo $answer; ?></h6>
            <?php
                        $i++;
                    }
                }
                if(isset($msg))echo $msg;
                if($fl==0){
            ?>

            <form method="post">
                <label for="questionid">Add question:</label>
                <input type="text" name="question" required id="questionid" placeholder="Enter the Question" class="form-control">
                <br>
                <div class="form-inline">
                    <input type="text" name="op1" placeholder="option A" class="form-control">&nbsp;&nbsp;
                    <input type="text" name="op2" placeholder="option B" class="form-control">&nbsp;&nbsp;
                    <input type="text" name="op3" placeholder="option C" class="form-control">&nbsp;&nbsp;
                    <input type="text" name="op4" placeholder="option D" class="form-control">&nbsp;
                    <select required name="ans" class="form-control">
                        <option value="" disabled selected>Correct Answer</option>
                        <option value="A">A</option>
                        <option value="B">B</option>
                        <option value="C">C</option>
                        <option value="D">D</option>
                    </select> 
                </div>
                <br>
                <button type="submit" class="btn btn-primary" name="addQ">Add</button>
            </form>
        <?php }
             else if($fl==1){
        ?>
            <form method="post">
                <button type="submit" class="btn btn-danger" name="publishResult">Publish Result</button>
            </form>
        <?php
             }
         ?>
        </div>
    </div>
<?php
	require_once('inc/footer.php');
?>