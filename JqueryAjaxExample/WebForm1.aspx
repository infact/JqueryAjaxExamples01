<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="JqueryAjaxExample.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
    table, td, th {
    border: 1px solid green;
}

th {
    background-color: #7f00ff;
    color: white;
}
        </style>
    <title>Jquery Ajax Example</title>
    <script src="//ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.blockUI/2.66.0-2013.10.09/jquery.blockUI.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "WebForm1.aspx/BindEmployees",
                data: "{}",
                dataType: "json",
                success: function (result) {
                    for (var i = 0; i < result.d.length; i++) {
                        $("#gvData").append("<tr><td>" + result.d[i].FirstName + "</td><td>" + result.d[i].LastName + "</td><td>" + result.d[i].City + "</td><td>" + result.d[i].Country + "</td></tr>");
                    }
                },
                error: function (result) {
                    alert("Error");
                }
            });







            $("th").click(function () {
                var columnIndex = $(this).index();
                var tdArray = $(this).closest("table").find("tr td:nth-child(" + (columnIndex + 1) + ")");
                tdArray.sort(function (p, n) {
                    var pData = $(p).text();
                    var nData = $(n).text();
                    return pData < nData ? -1 : 1;
                });
                tdArray.each(function () {
                    var row = $(this).parent();
                    $("#gvData").append(row);
                });
            });










           
        });//doc ready

        function Search_Gridview(strKey, strGV) {
            var strData = strKey.value.toLowerCase().split(" ");
            var tblData = document.getElementById(strGV);
            var rowData;
            for (var i = 1; i < tblData.rows.length; i++) {
                rowData = tblData.rows[i].innerHTML;
                var styleDisplay = 'none';
                for (var j = 0; j < strData.length; j++) {
                    if (rowData.toLowerCase().indexOf(strData[j]) >= 0)
                        styleDisplay = '';
                    else {
                        styleDisplay = 'none';
                        break;
                    }
                }
                tblData.rows[i].style.display = styleDisplay;
            }
        }







    </script>
</head>
<body>
   
    <br />
    <br />
    <form id="form1" runat="server">
       Search :
    <asp:TextBox ID="txtSearch" runat="server" Font-Size="20px" onkeyup="Search_Gridview(this, 'gvData')"></asp:TextBox><br />
    <br />
        <hr />

        <table id="gvData">
            <thead>
                <tr>
                <th>FirstName</th>
                  <th>LastName</th>
                  <th>City</th>
                  <th>Country</th>
                  <th></th>
                    </tr>
            </thead>
        </table>

    </form>
</body>
</html>

