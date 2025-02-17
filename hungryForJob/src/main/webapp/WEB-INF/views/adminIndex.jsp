<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script> <!-- Include SheetJS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script> <!-- Include Bootstrap for Modal -->
    <title>Dashboard</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f9;
        }

        h1 {
            margin-bottom: 20px;
        }

        .card-deck {
            display: flex;
            justify-content: space-around;
            gap: 20px;
            margin-bottom: 30px;
        }

        .card {
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 8px;
            cursor: pointer;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease;
            width: 30%;
        }

        .card:hover {
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        .card-title {
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .modal-body {
            display: flex;
            flex-direction: column;
        }

        .modal-body .section {
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 10px 0;
        }

        table, th, td {
            border: 1px solid #ddd;
            text-align: left;
        }

        th, td {
            padding: 8px;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        td img {
            width: 80px;
            height: 80px;
            object-fit: contain;
        }

        @media screen and (max-width: 768px) {
            .card-deck {
                flex-direction: column;
                align-items: center;
            }

            .card {
                width: 80%;
            }

            table {
                font-size: 12px;
            }

            td img {
                width: 50px;
                height: 50px;
            }
        }
    </style>

    <script>
        $(document).ready(function () {
            let downloadButtonVisible = false;

            // Event handler for clicking the cards
            $(".card").click(function() {
                var section = $(this).data('section');
                loadModalContent(section);
            });

            // Load section content into the modal body
            function loadModalContent(section) {
                $.ajax({
                    url: section + 'Details',  // Assuming URL mapping for AJAX
                    method: 'GET',
                    success: function (data) {
                        document.getElementById("modalBody").innerHTML = data;

                        // Conditionally show the Download button only for "Verification Pending"
                        if (section === "verificationPending") {
                            downloadButtonVisible = true;
                        } else {
                            downloadButtonVisible = false;
                        }

                        // Toggle the visibility of the download button
                        if (downloadButtonVisible) {
                            $("#exportToExcelBtn").show();
                        } else {
                            $("#exportToExcelBtn").hide();
                        }

                        // Show the modal using Bootstrap's modal method
                        var modal = new bootstrap.Modal(document.getElementById('modalPopup'));
                        modal.show();  // Show the modal
                    },
                    error: function (error) {
                        console.error("Error loading " + section + " details:", error);
                    }
                });
            }

            // Function to export Verification Pending Details to Excel
            $("#exportToExcelBtn").click(function() {
                const table = document.getElementById('pendingDetailsTable');
                const wb = XLSX.utils.table_to_book(table, { sheet: "Sheet1" });
                XLSX.writeFile(wb, 'VerificationPendingDetails.xlsx');
            });
        });

        // Toggle Status via AJAX
        function toggleStatus(gst_no, status) {
            var newStatus = status === 1 ? 0 : 1;
            $.ajax({
                url: '/updateCompanyStatus', // Update status URL
                method: 'POST',
                data: { gst_no: gst_no, status: newStatus },
                success: function () {
                    console.log("Status updated successfully!");
                },
                error: function () {
                    console.error("Error updating status.");
                }
            });
        }
    </script>
</head>
<body>

    <h1>Admin Dashboard</h1>

    <!-- Card Section -->
    <div class="card-deck">
        <div class="card" data-section="businessUsers">
            <div class="card-title">Active Company Details</div>
        </div>

        <div class="card" data-section="registerCompany">
            <div class="card-title">Register Company Details</div>
        </div>

        <div class="card" data-section="verificationPending">
            <div class="card-title">Verification Pending Details</div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="modalPopup" tabindex="-1" aria-labelledby="modalPopupLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalPopupLabel">Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="modalBody">
                    <!-- Content loaded via AJAX -->
                </div>
                <div class="modal-footer">
<!--                     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
 -->                    <!-- Initially hidden, will be shown for verificationPending section -->
                    <button id="exportToExcelBtn" class="btn btn-primary" style="display: none;">Download as Excel</button>
                </div>
            </div>
        </div>
    </div>

</body>
</html>