<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="JqueryAjaxExample.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title></title>

   <script src="//ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.3.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            var trHTML = '';
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/Default.aspx/BindEmployees",
                data: "{}",
                dataType: "json",
                success: function (result) {
                    for (var i = 0; i < result.d.length; i++) {
                       trHTML += "<tr><td>" + result.d[i].FirstName + "</td><td>" + result.d[i].LastName + "</td><td>" + result.d[i].City + "</td><td>" + result.d[i].Country + "</td></tr>";
                    }
                    $("#gvData").append(trHTML);
                },
                error: function (result) {
                    alert("Error");
                }
            });
                       
            Sort_Data();
           

           
        });//doc ready

        function Sort_Data()  //Sort Data start
        {
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
        } //Sort Data end

        function Search_Table(strKey, strGV) {  //Search  start
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
        }  //Search end



    </script>

</head>
<body>

    <form runat="server">
   Search :
   <asp:TextBox ID="txtSearch" runat="server" Font-Size="20px" onkeyup="Search_Table(this, 'gvData')"></asp:TextBox><br />
    <br />
        <hr />
     

       <table id="gvData">
            <thead>
            <tr>
                <th>FirstName</th>
                <th>LastName</th>
                <th>City</th>
                <th>Country</th>
            </tr>
        </thead>
        </table>
 
    </form>
</body>
</html>
