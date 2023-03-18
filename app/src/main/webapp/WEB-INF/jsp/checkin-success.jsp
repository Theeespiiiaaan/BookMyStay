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
            <h3>Check-In</h3>
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
                        <input type="number" class="form-control col-sm-10" id="deposit" name="deposit" value="${reservation.deposit}" readonly>    
                    </div>
                </div>
                <div class="form-group row mb-2">
                    <label for="pax" class="col-form-label col-sm-2">Pax</label>
                    <div class="col-sm-5">
                        <input type="number" class="form-control col-sm-10" id="pax" name="pax" value="${reservation.pax}" readonly>    
                    </div>
                </div>
                <div class="form-group row mb-2">
                    <label for="checkinTime" class="col-form-label col-sm-2">Check-In Time</label>
                    <div class="col-sm-5">
                        <input type="datetime-local" class="form-control col-sm-10" id="checkinTime" name="checkinTime" value="${reservation.checkin}" readonly>    
                    </div>
                </div>
            </form>
        </div>
        <div class="container mt-3">
            <div class="alert alert-success" role="alert">
                Checked-In Successfully
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