<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Reservation System</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body>
    <!-- Responsive navbar-->
    <%@ include file="header.jsp" %>

    <!-- Page content-->
    <div class="container">
        <div class="mt-5">
            <h3>Bill</h3>
        </div>
        <div class="container">
            <form>
                <input type="hidden" name="id" value="${reservation.id}">
                <div class="form-group row mb-2">
                    <label for="guestFullName" class="col-form-label col-sm-2">Guest Name</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control col-sm-10" id="guestFullName" name="guestFullName" value="${reservation.guestFullName}" readonly>    
                    </div>
                </div>
                <div class="form-group row mb-2">
                    <label for="fromDate" class="col-form-label col-sm-2">From Date</label>
                    <div class="col-sm-5">
                        <input type="date" class="form-control col-sm-10" id="fromDate" name="fromDate" value="${reservation.fromDate}" readonly>    
                    </div>
                </div>
                <div class="form-group row mb-2">
                    <label for="toDate" class="col-form-label col-sm-2">To Date</label>
                    <div class="col-sm-5">
                        <input type="date" class="form-control col-sm-10" id="toDate" name="toDate" value="${reservation.toDate}" readonly>    
                    </div>
                </div>
                <div class="form-group row mb-2">
                    <label for="roomType" class="col-form-label col-sm-2">Room</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control col-sm-10" id="roomType" name="roomType" value="${reservation.room.type}" readonly>
                    </div>
                </div>
                <div class="form-group row mb-2">
                    <label for="deposit" class="col-form-label col-sm-2">Deposit (PHP)</label>
                    <div class="col-sm-5">
                        <input type="number" class="form-control col-sm-10" id="deposit" name="deposit" value="${billing.deposit}" readonly>    
                    </div>
                </div>
                <div class="form-group row mb-2">
                    <label for="pax" class="col-form-label col-sm-2">Pax</label>
                    <div class="col-sm-5">
                        <input type="number" class="form-control col-sm-10" id="pax" name="pax" value="${reservation.pax}" readonly>    
                    </div>
                </div>
                <div class="form-group row mb-2">
                    <label for="miscellaneous" class="col-form-label col-sm-2">Miscellaneous (PHP)</label>
                    <div class="col-sm-5">
                        <input type="number" class="form-control col-sm-10" id="miscellaneous" name="miscellaneous" value="${billing.miscellaneous}" readonly>    
                    </div>
                </div>
                <div class="form-group row mb-2">
                    <label for="miscDescription" class="col-form-label col-sm-2">Misc Description</label>
                    <div class="col-sm-5">
                        <input type="text" class="form-control col-sm-10" id="miscDescription" name="miscDescription" value="${billing.miscDescription}" readonly>    
                    </div>
                </div>
                <div class="form-group row mb-2">
                    <label for="roomFee" class="col-form-label col-sm-2">Room Fee (PHP)</label>
                    <div class="col-sm-5">
                        <input type="number" class="form-control col-sm-10" id="roomFee" name="roomFee" value="${billing.roomFee}" readonly>    
                    </div>
                </div>
                <div class="form-group row mb-2">
                    <label for="total" class="col-form-label col-sm-2">Total (PHP)</label>
                    <div class="col-sm-5">
                        <input type="number" class="form-control col-sm-10" id="total" name="total" value="${billing.total}" readonly>    
                    </div>
                </div>
                <div class="form-group row mb-2">
                    <label for="vat" class="col-form-label col-sm-2">VAT (PHP) 12%</label>
                    <div class="col-sm-5">
                        <input type="number" class="form-control col-sm-10" id="vat" name="vat" value="${billing.vat}" readonly>    
                    </div>
                </div>
                <div class="form-group row mb-2">
                    <label for="checkoutTime" class="col-form-label col-sm-2">Check-Out Time</label>
                    <div class="col-sm-5">
                        <input type="datetime-local" class="form-control col-sm-10" id="checkoutTime" name="checkoutTime" value="${reservation.checkout}" readonly>    
                    </div>
                </div>
            </form>
        </div>
        <div class="container mt-3">
            <div class="alert alert-success" role="alert">
                Checked-Out Successfully
            </div>
        </div>
    </div>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js" type="text/javascript"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</body>
</html>