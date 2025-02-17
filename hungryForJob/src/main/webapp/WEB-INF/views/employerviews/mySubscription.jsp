<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Hungry for Job</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  <!-- Favicons -->
  <link href="employer/img/favicon.png" rel="icon">
  <link href="employer/img/apple-touch-icon.png" rel="apple-touch-icon">
  <!-- Vendor CSS Files -->
  <link href="employer/css/bootstrap.min.css" rel="stylesheet">
  <link href="employer/fonts/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="employer/css/font-awesome.min.css" rel="stylesheet">
  <link href="employer/css/select2.min.css" rel="stylesheet" />
  <link href="employer/css/nice-select.css" rel="stylesheet">
  <link href="employer/css/richtext.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="employer/css/dataTables.bootstrap5.css" />
  <link href="employer/css/bootstrap-datepicker.min.css" rel="stylesheet" />
  <link href="employer/css/style.css" rel="stylesheet">

</head>

<body>
  <main id="main">
    <section class="section-inner advancedsearch-section ">
      <div class="container">
        <div class="row ">
          <div class="col-xl-3 col-lg-4 col-md-4  ">

            <div class="card-register company-profile p-2">
              <div class="card-content sidebar ">
                <div class="card-search">
                  <div class="searchprfile">
                    <div class="profileImg">
                      <img src="employer/img/profile-img.jpg" alt="">
                    </div>
                    <div class="profilTxt">
                      <h4><a href="#">ComUnus</a> </h4>
                      <h5>mahendra.puli@comunus.in</h5>
                    </div>
                  </div>
                </div>
                <div class="line2"></div>
                <div class="content-txt">
                  <div class="row">
                    <div class="vertical-menu">
                      <a href="company-profile.html"> <img src="" alt=""> Company Profile</a>
                      <a href="my-subscription.html" class="active"><img src="" alt=""> My Subscription</a>
                      <a href="settting.html"><img src="" alt=""> Settting </a>
                    </div>

                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-xl-9 col-lg-8 col-md-8">

            <div class="billing-profile mb-4">
              <div class="card-listinner d-flex justify-content-between align-items-center">
                <div>
                  <h4>Billing Profile</h4>
                  <p class="mb-0">Add your registered GST number and company details that would appear on your future
                    invoices.</p>
                </div>
                <div>
                  <button class="add-gst-button" data-bs-toggle="modal" data-bs-target="#gstin-add">Add GSTIN
                    number</button>
                </div>
              </div>
            </div>
            <div class="billing-history">
              <div class="card">
                <div class="d-flex justify-content-between align-items-center p-4 pb-1">
                  <h4>Billing History</h4>
                  <div class="form-group1">
                    <div class="formchecks">
                      <ul>
                        <li>
                          <input type="radio" class="btn-check" name="billing-history" id="All" checked>
                          <label class="btn" for="All"><span>All</span>
                          </label>
                        </li>
                        <li>
                          <input type="radio" class="btn-check" name="billing-history" id="Success">
                          <label class="btn" for="Success"><span>Success </span>
                          </label>
                        </li>
                        <li>
                          <input type="radio" class="btn-check" name="billing-history" id="Pending">
                          <label class="btn" for="Pending"><span>Pending </span>
                          </label>
                        </li>
                        <li>
                          <input type="radio" class="btn-check" name="billing-history" id="Failed">
                          <label class="btn" for="Failed"><span>Failed </span>
                          </label>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="line2"></div>
                <div class="col-12 p-3">
                  <div class="table-responsive1">
                    <div id="no-more-tables p-1">
                      <table id="billing-list" class="table billing-list" style="width:100%;">
                        <thead>
                          <tr>
                            <th>Date</th>
                            <th>Plan Details</th>
                            <th>Expires on</th>
                            <th>Amount</th>
                            <th>Status</th>
                            <th>Action</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td data-title="Client Name">23-07-2024<br> <small>04:30:00PM</small> </td>
                            <td data-title="User Name"> 1 Year Plan</td>
                            <td data-title="Email ID"> -</td>
                            <td data-title="Mobile Number">&#8377; 14,800</td>
                            <td data-title="Status"> <span class="status pending"> Pending </span> </td>
                            <td data-title="Action"> <a href="">Retry Payment</a></td>
                          </tr>

                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
    </section>

  </main><!-- End #main -->
  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="container">
      <div class="copyright">
        <ul>
          <li><a href="#"> About Us </a> </li>
          <li><a href="#"> Contact Us</a> </li>
        </ul>
        <p>Copyright © 2024. Hungry for job all right reserved</p>
      </div>
    </div>
  </footer><!-- End Footer -->
  <!--GSTIN Add  Modal   -->
  <div class="modal fade" id="gstin-add" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  ">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Add GSTIN Number</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body pe-4 ps-4 py-4">
          <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
              <div class="form-group">
                <label for="Industry" class="form-label required">GSTIN Number</label>
                <input type="text" name="Industry" id="Industry" class="form-control" placeholder="Enter Industry">
              </div>
            </div>

          </div>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn" data-bs-dismiss="modal">Cancel</button>
          <button type="button" class="btns">Submit</button>
        </div>

      </div>
    </div>
  </div>

  <script src="employer/js/jquery.min.js"></script>
  <script src="employer/js/popper.min.js"></script>
  <script src="employer/js/bootstrap.min.js"></script>
  <script src="employer/js/select2.min.js"></script>
  <script src="employer/js/moment.min.js"></script>
  <script src="employer/js/nice-select.min.js"></script>
  <script src="employer/js/dataTables.js"></script>
  <script src="employer/js/dataTables.bootstrap5.js"></script>
  <script src="employer/js/bootstrap-datepicker.min.js"></script>
  <script src="employer/js/jquery.richtext.js"></script>
  <script src="employer/js/main.js"></script>

  <script>
    $(document).ready(function () {
      $('#billing-list').dataTable({
      });
    });

  </script>
</body>

</html>