<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Example.master" CodeBehind="WebForm1.aspx.cs" Inherits="JqueryAjaxExample.Summary.WebForm1" %>


  

    <asp:Content ContentPlaceHolderID="PageContent" Runat="Server">



          <%--<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>--%>
    <script src="//ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.1.min.js"></script>
   <%-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.blockUI/2.66.0-2013.10.09/jquery.blockUI.min.js"></script>--%>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/summary/WebForm1.aspx/BindEmployees",
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




       Search :
    <asp:TextBox ID="txtSearch" runat="server" Font-Size="20px" onkeyup="Search_Gridview(this, 'gvData')"></asp:TextBox><br />
    <br />
        <hr />
     

       <table ID="gvData" runat="server" CellPadding="12" >
                    <tr>
						<th>Company</th>
						<th>Contact</th>
						<th>Phone</th>
						<th>Email</th>
						<th>Status</th>
						<th>Graduation Date</th>
						<th></th>
					 </tr>

        </table>

    </asp:Content>

