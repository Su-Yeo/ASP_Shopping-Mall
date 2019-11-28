<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
section#sub03-s01 {
    height: 1052px;
    width: 100%;
    background-color:white;
}
article, aside, details, figcaption, figure, footer, hgroup, menu, section {
    display: block;
}
section#sub03-s01 div.inner {
    width: 1100px;
    height: 100%;
    margin: 0 auto;
}
section#sub03-s01 div.inner h1 {
    font-size: 48px;
    color: #000;
    font-family: 'notokr-regular';
    padding-top: 75px;
    padding-bottom: 35px;
}
section#sub03-s01 div.inner div.search-menu {
    height: 55px;
    background: #111;
    position: relative;
}

div {
    display: block;
}
form {
    display: block;
    margin-top: 0em;
}

.search-menu > .btn01 {
    position: absolute;
    right: 36px;
    top: 25px;
    background: #fff;
    font-size: 14px;
    color: #000;
    font-family: 'notokr-regular';
    width: 54px;
    height: 30px;
}
table {
    margin: 0;
    padding: 0;
    border-spacing: 0;
    border: 0;
    border-collapse: collapse;
    word-break: break-all;
}
thead {
    display: table-header-group;
    vertical-align: middle;
    color:black;
}
section#sub03-s01 .inner table tr:last-child {
    padding:0;
    margin:0;
}

tr {
    display: table-row;
    vertical-align: inherit;
}
th {
    border-top: 1px solid #a19e9c;
    padding: 17px 0 16px 0;
}
tbody {
    display: table-row-group;
    vertical-align: middle;
}
section#sub03-s01 .inner table td {
    padding: 17px 0 16px 0;
    font-family: 'notokr-regular';
    font-size: 14px;
}
section#sub03-s01 .inner table td.subject {
    font-family: 'notokr-regular';
    font-size: 16px;
    color: #fff;
    text-align: center;
    padding-left: 20px;
}
section#sub03-s01 .inner ul.pager {
    height: 27px;
    margin-top: 55px;
    width: 100%;
    text-align: center;
}
ul, ol, dl {
    list-style: none;
}
section#sub03-s01 .inner ul.pager li {
    display: inline-block;
    margin: 0 10px;
}
section#sub03-s01 .inner ul.pager li.active a {
    font-weight: bold;
    color: #000;
    border-bottom: 1px solid #000;
}

section#sub03-s01 .inner ul.pager li a {
    font-family: 'notokr-regular';
    font-size: 14px;
    color: #7a7674;
}
tbody tr td.subject a {
    vertical-align: top;
    text-decoration: none;
    color: #000;
}
.write{ 
	position: absolute;
    right: 36px;
    top: 10px;
    background: #fff;
    font-size: 15px;
    font-weight:bold;
    color: #000;
    font-family: 'notokr-regular';
    padding:10px 15px;
}
.number{
    margin:0 auto;
}
.number span{
    padding:5px;
    font-family:"맑은 고딕",나눔고딕,굴림,돋움,sans-serif;
}
.number a{
    padding:5px;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section id="sub03-s01">
<div class="inner">
	<h1>게시판</h1>
     <%if (Session["id"] != null)
         { %>
	<div class="search-menu">
		<div class="notice-menu"></div>
       
		    <a href="NoticeWrite.aspx" class="write">글쓰기</a>
       
	</div>
     <% }%>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="nid" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" BackColor="#CCCCCC" BorderStyle="None" ForeColor="Black" Height="500px" Width="100%">

        <Columns>
            <asp:BoundField DataField="nid" HeaderText="번호" SortExpression="nid" ControlStyle-Width="70px" ItemStyle-HorizontalAlign="Center" HeaderStyle-Height="40px" ItemStyle-Height="40px" />
            <asp:HyperLinkField Target="_self" DataTextField="title" ControlStyle-ForeColor="Black" HeaderText="제목" DataNavigateUrlFormatString="Notice.aspx?nid={0}&uid={1}" DataNavigateUrlFields="nid,uid" ControlStyle-Width="500px" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="date" HeaderText="작성일" SortExpression="date" ControlStyle-Width="130px" DataFormatString="{0:yyyy-MM-dd}" ItemStyle-HorizontalAlign="Center" />
        </Columns>

        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" BorderStyle="None"></HeaderStyle>

        <PagerStyle HorizontalAlign="Center" BackColor="#FFFFFF" ForeColor="Black" Width="0px" CssClass="number"></PagerStyle>

        <RowStyle BackColor="White" ForeColor="Black"></RowStyle>

    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:MyAspDB %>' SelectCommand="SELECT [nid], [title], [date], [uid] FROM [Notice] ORDER BY [nid] DESC"></asp:SqlDataSource>
    
</div>
</section>
</asp:Content>

