<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {
        uid.Text = Session["id"].ToString();
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        Notice notice = new Notice();
        int r = notice.InsertNotice(title.Text, text.Text, uid.Text);
        if (r == 1)
        {
            alert("글쓰기 완료","location.href='NoticeList.aspx'");
        }
    }

    void alert(string message, string etc)
    {
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("<script language='javascript' type='text/javascript'>");
        sb.Append("alert('");
        sb.Append(message);
        sb.Append("');");
        sb.Append(etc);
        sb.Append("</");
        sb.Append("script>");
        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
div.n{ width: 1100px; height: 1000px; margin: 0 auto; margin-top:50px; margin-bottom:50px;}
div.n h1 {
    font-size: 48px;
    color: #000;
    font-family: 'notokr-regular';
    padding-bottom: 35px;
}
table {
    width: 100%;
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
tr {
    display: table-row;
    vertical-align: inherit;
}
th {
    border-top: 2px solid #000;
    padding: 17px 0 16px 0;
}
tbody {
    display: table-row-group;
    vertical-align: top;
}
table td {
    padding: 17px 0 16px 0;
    color: #000;
    font-family: 'notokr-regular';
    font-size: 24px;
    border-top: 1px solid #dcdcdc;
    text-align: center;
}
table th.subject {
    font-family: 'notokr-regular';
    font-size: 30px;
    font-weight:normal;
    color: #000;
    text-align: left;
    padding-left: 20px;
}
table th.user {
	padding:10px;
    font-family: 'notokr-regular';
    font-size: 23px;
    font-weight:normal;
    color: #000;
    text-align: left;
}
table th.subject b{margin-right:20px;}
table th.date b{margin-right:20px;}
span.space{padding-right:30px;}
.skinbtn.point2 { 
	width: 158px;
    height: 50px;
    font-size: 16px;
    background: #000;
    border: 1px solid #000;
    color: #fff;
}
.a{margin: 0 auto; text-align:center; margin-top:50px;}

.input_txt {
	font-size: 30px;
	width:90%;
	border: 1px solid #888;
}

textarea{
	font-size: 24px;
	resize:none;
	width:100%;
	height:600px;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="n">
<h1><a href="NoticeList">게시판</a></h1>

    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableHeaderCell CssClass="subject">
                <b>제목</b>
                <asp:TextBox ID="title" runat="server" CssClass="input_txt"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage=" /* 제목을 입력해주세요." ControlToValidate="title" Font-Size="20px" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </asp:TableHeaderCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell CssClass="user">
                <span class="space"><b>작성자</b><asp:Literal ID="uid" runat="server"/></span>
            </asp:TableHeaderCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:TextBox ID="text" runat="server" TextMode="MultiLine"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
	<div class="a">
        <asp:Button ID="submit" runat="server" CssClass="skinbtn point2 l-login" Text="확인" OnClick="submit_Click" />
		<a href="NoticeList.aspx" class="skinbtn point2 l-login" style="padding:13px 60px; margin-left:10px;">취소</a>
	</div>
</div>
</asp:Content>

