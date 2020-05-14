<?php
  include 'component/pages/connect.php';

  // login ***************

   $errors = "";

  // Prepare our SQL, preparing the SQL statement will prevent SQL injection.
  if (isset($_POST['login_user'])) {
    if ($stmt = $con->prepare('SELECT id, matricule, name, password FROM user WHERE email = ?')) {
      $stmt->bind_param('s', $_POST['email']);
      $stmt->execute();
      // Store the result so we can check if the account exists in the database.
      $stmt->store_result();
      if ($stmt->num_rows > 0) {
        $stmt->bind_result($id, $matricule, $name, $password);
        $stmt->fetch();
        if (sha1($_POST['password']) == $password) {
          session_regenerate_id();
          $_SESSION['loggedin'] = TRUE;
          $_SESSION['name'] = $name;
          $_SESSION['matricule'] = $matricule;
          

          header("location: component/pages/home.php");

        } else {
          $errors = "<div class='well-custom-danger'> Wrong username/password! </div>";
        }
      } else {
        $errors = "<div class='well-custom-danger'> Wrong username/password! </div>";
      }


      $stmt->close();

    }
    
  }
    if (!isset($_SESSION['name'])) {
    $loginCred = "<a href='component/pages/login.php'>
            <button class='btn btn-danger btn-xs'> <b> login </b>
            </button></a>";
    $logout = "<a href='component/pages/signup.php'>
            <button class='btn btn-danger btn-xs'> <b>signup</b>
            </button></a>";
  }else{
    header("location: component/pages/home.php");
  }


// *******************
 
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>educForum</title>
  <link rel="icon" href="resources/logo.png">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="component/fa/css/all.min.css">
  <!-- Bootstrap core CSS -->
  <link href="component/css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="component/css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="component/css/style.css" rel="stylesheet">
</head>

<body class="bg">
  <nav class="navbar navbar-custom">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="glyphicon glyphicon-menu-hamburger"></span>                       
        </button>
        <a class="logo navbar-brand row" href="">
          <div class="col-sm-1 ">
            <img class="img-responsive main_logo" src="resources/logo.png">
          </div>
          <div class="col-sm-4">
            <b>EducForum</b>
          </div> 
        </a>
      </div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav">
          
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li>
              <?=$loginCred ?>
            
          </li>
          <li>
            <?=$logout ?>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Start here-->
  <div style=" margin: 9%; color: white;">
    <div class="row">

      <article class="col-sm-6">
        <br>
        <div class="text-left">
            <h1>Share & grow the world's knowledge!</h1>

            <p class="moto text-justify">
              We want to connect the people who have knowledge to the people who need it, to bring together people with different perspectives so they can understand each other better, and to empower everyone to share their knowledge.
            </p>

         </div>
      </article>
      <!--Section -->
      <section class="col-sm-6 mb-6">
          <!--Section heading-->
          <h2 class="color h1-responsive font-weight-bold text-center my-4">
          </h2>
          <!--Section description-->
          <p class="color text-left w-responsive mx-auto mb-5"></p>

          <div class="row hoverable">

              <!--Grid column-->
              <div class=" col-md-9 mb-md-0 mb-5">
                  <form name="contact-form" action="index.php" method="POST">
                      <div id="status">
                        <?=$errors?>
                      </div>
                      <!--Grid row-->
                      <div class="row">

                          <!--Grid column-->
                          <div class="col-md-6">
                              <div class="md-form mb-0 form-group">
                                  <input type="email" id="email" name="email" class="input_land form-control" required>
                                  <label for="email" class="label_color">Your  email</label>
                              </div>
                          </div>
                          <!--Grid column-->
                          <!--Grid column-->
                          <div class="col-md-6">
                              <div class="md-form mb-0 form-group">
                                  <input type="password" id="password" name="password" class="form-control" required>
                                  <label for="password" class="input_land label_color"> Your Password</label>
                              </div>
                          </div>
                          <!--Grid column-->

                      </div>
                      <!--Grid row-->
                      <div class="text-right text-md-left">
                        <input type="submit" class="btn btn-lg btn-danger" value="Send" name="login_user">
                      </div>

                  </form>

                  
                  
              </div>
              <!--Grid column-->

          </div>

      </section>
      <!--Section -->
      

    </div>
  </div>
  <!-- END here-->

  <!-- SCRIPTS -->
 <script type="text/javascript" src="component/js/jquery-3.4.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="component/js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="component/js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="component/js/mdb.min.js"></script>
 
</body>

</html>
