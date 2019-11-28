<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">
    Member member = new Member();
    protected void Page_Load(object sender, EventArgs e)
    {
        Repeater1.DataSource =  member.SelectMemberList();
        Repeater1.DataBind();
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
div.wrapper{
	margin: 0 auto;
    padding: 60px 0;
    height:700px;
}
table, th, td {
	text-align:center;
	color: #000;
    margin: 0 auto;
    padding: 0;
    border-spacing: 0;
    border: 0;
    border-collapse: collapse;
    vertical-align: middle;
}
tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
.list-tb td {
    padding: 13px 30px;
    vertical-align: middle;
    height: 33px;
    border-bottom: 1px solid #888;
}
.list-tb th {
    padding: 20px 30px;
    background-color: #000;
    vertical-align: middle;
    color: #fff;
    text-align: center;
    font-size: 16px;
    font-weight: 500;
    height: 33px;
}

.MS_input_txt {
    line-height: 30px;
    height: 30px;
}

.skinbtn.point2 { 
	width: 158px;
    height: 50px;
    font-size: 16px;
    background: #000;
    border: 1px solid #000;
    color: #fff;
}
.a{margin: 0 auto; text-align:center; margin-top:50px;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="wrapper" style="background-color:white">
<h1 style="color:black; text-align:center; margin:40px 0;">회원목록</h1>
    <asp:Repeater ID="Repeater1" runat="server">
        <HeaderTemplate>
            <table class="list-tb" >
                <tbody>
                    <tr>
                        <th class="head-cell">아이디</th>
                        <th class="head-cell">이름</th>
                        <th class="head-cell">주소</th>
                        <th class="head-cell">이메일</th>
                        <th class="head-cell">전화번호</th>

                    </tr>
        </HeaderTemplate>
        <ItemTemplate>    
                <asp:TableRow>
                    <tr><td class="col-cell MS_input_txt"><%# Eval("id") %></td>
                    <td class="col-cell MS_input_txt"><%# Eval("name") %></td>
                    <td class="col-cell MS_input_txt"><%# Eval("addr") %></td>
                    <td class="col-cell MS_input_txt"><%# Eval("email") %></td>
                    <td class="col-cell MS_input_txt"><%# Eval("tel") %></td></tr>
                </asp:TableRow>
        </ItemTemplate>
        <FooterTemplate>
                </tbody>
            </table>
        </FooterTemplate>
    </asp:Repeater>
<div class="a">
	<a href="Index.aspx" class="skinbtn point2 l-login" style="padding:10px 35px; margin-right:10px;">확인</a>
</div>
</div>
</asp:Content>

