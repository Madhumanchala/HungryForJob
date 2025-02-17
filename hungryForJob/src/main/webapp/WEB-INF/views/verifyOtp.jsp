<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="Recruitment Management Application">
  <meta name="author" content="Comunus Technologies">
  <meta name="generator" content="Comunus Technologies">
  <link rel="icon" href="images/favicon.png" type="image/x-icon">
  <title>OTP Verification | TAG HRMSBUDDY </title>
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/login.css" rel="stylesheet">
  <link href="css/bg.css" rel="stylesheet">
  <link href="fonts/css/all.min.css" rel="stylesheet">
  <script src="js/jquery-3.4.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <link href="plugins/general/toastr/build/toastr.css" rel="stylesheet" type="text/css" />
  <script src="plugins/general/toastr/build/toastr.min.js" type="text/javascript"></script>
  <script type="text/javascript">
    $(function() {
      $("#user_otp").css('text-align', 'center');

      $(".resend").on("click", function(e) {
        e.preventDefault();
        $('.rsb').fadeOut('fast');
        $.ajax({
          url: "<?= base_url('password/otp_resend'); ?>",
          type: "POST",
          data: {
            "user_id": "<?php if (!empty($_SESSION['temp_user_id'])) {
                          echo $_SESSION['temp_user_id'];
                        } else {
                        }; ?>"
          },
          dataType: 'JSON',
          success: function(resp) {
            if (resp.status == true) {
              $(".card-title").after("<p class='text-success' style='text-align: center; font-weight: bold;'>" + resp.msg + "</p>");
              console.log($(".card-title"));
              $('.timer-main').fadeIn('fast');
              if ($(".rsb").not(":visible")) {
                var counter = 60;
                var interval = setInterval(function() {
                  counter--;
                  if (counter <= 0) {
                    clearInterval(interval);
                    $('#timer').html("00:00");
                    return;
                  } else {
                    if (counter > 9) {
                      $('#time').text("00:" + counter);
                    } else {
                      $('#time').text("00:0" + counter);
                    }
                  }
                }, 1000);
              }

              setTimeout(function() {
                $('.rsb').fadeIn('fast');
                $('.timer-main').fadeOut('fast');
              }, 60000);

            } else {
              $('.rsb').fadeIn('fast');
              $("#user_otp").after("<p class='text-danger' style='text-align: center; font-weight: bold;'>" + resp.msg + "</p>");

            }
          }
        });
      });

      if ($("p.text-danger").is(":visible")) {
        $("p.text-danger").css('text-align', 'center');
      }

    });
  </script>
</head>

<body class="login">
  <div class="bgImage"></div>
  <svg class="blobCont">
    <image xlink:href="images/rms_bg.jpg" mask="url(#mask)" width="100%" height="100%" preserveAspectRatio="xMidYMid slice" />
    <defs>
      <filter id="gooey" height="130%">
        <feGaussianBlur in="SourceGraphic" stdDeviation="15" result="blur" />
        <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 18 -7" result="goo" />
      </filter>
    </defs>
    <mask id="mask" x="0" y="0">
      <g style="filter: url(#gooey)">
        <circle class="blob" cx="10%" cy="10%" r="80" fill="white" stroke="white" />
        <circle class="blob" cx="50%" cy="10%" r="40" fill="white" stroke="white" />
        <circle class="blob" cx="17%" cy="15%" r="70" fill="white" stroke="white" />
        <circle class="blob" cx="90%" cy="20%" r="120" fill="white" stroke="white" />
        <circle class="blob" cx="30%" cy="25%" r="30" fill="white" stroke="white" />
        <circle class="blob" cx="50%" cy="60%" r="80" fill="white" stroke="white" />
        <circle class="blob" cx="70%" cy="90%" r="10" fill="white" stroke="white" />
        <circle class="blob" cx="90%" cy="60%" r="90" fill="white" stroke="white" />
        <circle class="blob" cx="30%" cy="90%" r="80" fill="white" stroke="white" />
        <circle class="blob" cx="10%" cy="10%" r="80" fill="white" stroke="white" />
        <circle class="blob" cx="50%" cy="10%" r="20" fill="white" stroke="white" />
        <circle class="blob" cx="17%" cy="15%" r="70" fill="white" stroke="white" />
        <circle class="blob" cx="40%" cy="20%" r="120" fill="white" stroke="white" />
        <circle class="blob" cx="30%" cy="25%" r="30" fill="white" stroke="white" />
        <circle class="blob" cx="80%" cy="60%" r="80" fill="white" stroke="white" />
        <circle class="blob" cx="17%" cy="10%" r="100" fill="white" stroke="white" />
        <circle class="blob" cx="40%" cy="60%" r="90" fill="white" stroke="white" />
        <circle class="blob" cx="10%" cy="50%" r="80" fill="white" stroke="white" />
      </g>
    </mask>
  </svg>
  <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-12 col-lg-9 mx-auto">
        <div class="card card-signin shadow-lg ">
          <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-6">
              <div class="card-body2">
                <img src="images/logo.png" class="mx-auto d-block">
                <h5 class="card-title text-center text-uppercase">OTP Verification</h5>

                <form autocomplete="off" action="<?= base_url('forgotPassword/validate_otp'); ?>" method="post">
                  <div class="col-md-12">
                    <div class="form-group">
                      <input type="text" name="user_otp" id="user_otp" class="form-control" placeholder="Enter OTP" autofocus required>
                    </div>
                  </div>
                  <div class="clearfix"></div>
                  <div class="col-md-12">
                    <button class="btn btn-md btn-primary btn-block text-uppercase btn-rounded" type="next">Verify</button>
                  </div>
                </form>
                <div class="row" style="margin-top: 8px; text-align: center;">
                  <div class="col-md-12">
                    <div class="timer-main" align="center" style="display:none;">
                      <span id="timer">
                        <span id="time">00:60</span>
                      </span>
                    </div>
                    <button class="btn btn-sm rsb">Not Received OTP ? <span class="text-primary resend">Resend</span></button>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-sm-9 col-md-5 col-lg-6 loginbg">
              <img src="images/rms.jpg" class="img-fluid">
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
<script>
  
</script>

</html>