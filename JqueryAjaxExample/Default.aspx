<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="JqueryAjaxExample.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title></title>

    <%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>--%>
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
  <%--  <script src="https://cdn.datatables.net/1.10.9/css/jquery.dataTables.min.css"></script>--%>

 <script>

     $(document).ready(function () {
         var jsonrecords;
         $.ajax({
             type: "POST",
             url: "Default.aspx/FetchData",
             contentType: "application/json; charset=utf-8",
             dataType: "json",
             success: function (response) {
                 // $("#Content").text(response.d);
                 jsonrecords = response.d
                 $('#example').DataTable({
                     "ajax": jsonrecords
                 });
             },
             failure: function (response) {
                 alert(response.d);
             }

         });

         



     });

 </script>
</head>
<body>
<form id="frm" method="post">
    <div id="Content">
    </div>
    <table id="example" class="display" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Extn.</th>
                <th>Start date</th>
                <th>Salary</th>
            </tr>
        </thead>
 
        <tfoot>
            <tr>
                <th>Name</th>
                <th>Position</th>
                <th>Office</th>
                <th>Extn.</th>
                <th>Start date</th>
                <th>Salary</th>
            </tr>
        </tfoot>
    </table>
</form>

 

</body>
</html>
