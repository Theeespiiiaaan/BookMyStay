<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

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
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
    <!-- Responsive navbar-->
    <%@ include file="header.jsp" %>

    <!-- Page content-->
    <div class="container">
        <div class="mt-5">
            <h3>Reservations</h3>
        </div>
        <div class="container">
            <table class="table table-hover table-sm">
                <thead>
                  <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Guest Name</th>
                    <th scope="col">Guest ID</th>
                    <th scope="col">From</th>
                    <th scope="col">To</th>
                    <th scope="col">Room</th>
                    <th scope="col">Pax</th>
                    <th scope="col">Status</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody>
                    <c:forEach var = "res" items="${reservations}">
                        <tr>
                            <th scope="row"><c:out value="${res.id}" /></th>
                            <td><c:out value="${res.guestFullName}" /></td>
                            <td><c:out value="${res.guestId}" /></td>
                            <td><fmt:formatDate pattern = "MM/dd/yyyy" value = "${res.fromDate}" /></td>
                            <td><fmt:formatDate pattern = "MM/dd/yyyy" value = "${res.toDate}" /></td>
                            <td><c:out value="${res.room.type}" /></td>
                            <td><c:out value="${res.pax}" /></td>
                            <td><c:out value="${res.status}" /></td>
                            <td>
                                <c:if test="${res.status == 'PENDING'}">
                                    <a href="/delete-reservation?reservationId=${res.id}" onclick="return confirm('Are you sure to delete?');" class="btn btn-danger btn-sm rounded-2" type="button" data-toggle="tooltip" data-placement="top" title="Delete">
                                        <em class="fa fa-trash"></em>
                                    </a>
                                </c:if>
                                <c:if test="${res.status != 'PENDING'}">
                                    <a class="btn btn-secondary btn-sm rounded-2" type="button" data-toggle="tooltip" data-placement="top" title="Not valid for delete">
                                        <em class="fa fa-trash"></em>
                                    </a>
                                </c:if>
                                <c:if test="${res.status == 'PENDING'}">
                                    <a href="/checkin?reservationId=${res.id}" class="btn btn-primary btn-sm rounded-2" type="button" data-toggle="tooltip" data-placement="top" title="Check-In">
                                        <em class="fa fa-sign-in"></em>
                                    </a>
                                </c:if>
                                <c:if test="${res.status != 'PENDING'}">
                                    <a class="btn btn-secondary btn-sm rounded-2" type="button" data-toggle="tooltip" data-placement="top" title="Not valid for check-in">
                                        <em class="fa fa-sign-in"></em>
                                    </a>
                                </c:if>
                                <c:if test="${res.status == 'CHECKED-IN'}">
                                    <a href="/checkout?reservationId=${res.id}"  class="btn btn-secondary btn-sm rounded-2" type="button" data-toggle="tooltip" data-placement="top" title="Check-Out">
                                        <em class="fa fa-sign-out"></em>
                                    </a>
                                </c:if>
                                <c:if test="${res.status != 'CHECKED-IN'}">
                                    <a class="btn btn-secondary btn-sm rounded-2" type="button" data-toggle="tooltip" data-placement="top" title="Not valid for check-out">
                                        <em class="fa fa-sign-out"></em>
                                    </a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</body>
</html>