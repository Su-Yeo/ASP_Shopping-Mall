<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">
    Member member = new Member();
    private static int flag = 0;
    protected void bt_Click(object sender, EventArgs e)
    {
        int cnt = member.IdCheck(id.Text);
        if (cnt != 0)
        {   flag = 0;
            idText.Text = " * 이미 사용중인 아이디 입니다.";
            idText.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            flag = 1;
            idText.Text = " * 사용 가능한 아이디 입니다.";
            idText.ForeColor = System.Drawing.Color.Black;
        }
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        if (flag == 0){
            idText.Text = " * 아이디 중복을 체크해주세요.";
            idText.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            string email = email1.Text + "@" +email2.Text;
            member.InsertMember(id.Text,password1.Text,name.Text,address.Text,phone.Text,email);
            alert("안녕하세요! "+id.Text+"님");
        }

    }

    void alert(string message)
    {
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("<script language='javascript' type='text/javascript'>");
        sb.Append("alert('");
        sb.Append(message);
        sb.Append("');location.href='Login.aspx'</");
        sb.Append("script>");
        ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
div.wrapper{
	margin: 0 auto;
    padding: 60px 0;
}
table, th, td {
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
.person-tb td {
    padding: 13px;
    vertical-align: middle;
}
.person-tb th {
    padding: 13px 26px;
    background-color: #000;
    vertical-align: top;
    color: #fff;
    text-align: left;
    font-size: 14px;
    font-weight: 500;
}
.person-tb th{
    height: 33px;
    border-bottom: 1px solid #e9e9e9;
}
.person-tb td {
    height: 33px;
    border-bottom: 1px solid #888;
}
.normal-input {
    width: 265px;
}

.small-input, .normal-input, .large-input {
    height: 31px;
    line-height: 31px;
    border: 1px solid #888;
    padding: 0 10px;
}
.MS_input_txt {
    margin-right: 5px;
    padding: 2px 0 0 2px;
    line-height: 31px;
    height: 31px;
}
input, select {
    outline: none;
    font-family: Malgun Gothic,'맑은 고딕',Helvetica,AppleGothic,dotum,'돋움',sans-serif;
    color: #717171;
}

.cbtn {
    border: 1px solid #717171;
    display: inline-block;
    font-size: 14px;
    color: #000;
    background-color:#fff;
    min-width: 98px;
    text-align: center;
    margin-right: 5px;
    padding: 1px 0 0 0;
    height: 31px;
    line-height: 31px;
}

.person-tb .head-cell {
    position: relative;
    padding-top: 6px;
}
.person-tb .col-cell.social .MS_select:first-child {
    margin-left: 0;
}

.person-tb .col-cell.social .MS_select {
    margin: 0 5px;
}
.person-tb .MS_select {
    height: 33px;
    padding: 0 0 0 10px;
}
.person-tb .col-cell.social .MS_radio {
    margin-left: 20px;
    margin-right: 5px;
}
tr.borderTop{
	border-top: 1px solid #888;
}
.skinbtn.point2 { 
	width: 158px;
    height: 50px;
    font-size: 16px;
    background: #000;
    border: 1px solid #000;
    color: #fff;
}
.a{margin: 0 auto; text-align:center; margin-top:30px;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="wrapper" style="background-color:white">
<h1 style="color:black; text-align:center; margin-bottom:40px;">회원가입</h1>
    <asp:Table ID="Table1" runat="server" CssClass="person-tb">
        <asp:TableRow CssClass="borderTop">
            <asp:TableHeaderCell><div class="head-cell"><span class="empha"></span>이름</div></asp:TableHeaderCell>
            <asp:TableCell>
                 <div class="col-cell">
                     <asp:TextBox ID="name" runat="server" CssClass="MS_input_txt normal-input" MaxLength="30" ></asp:TextBox>
                     <asp:RequiredFieldValidator ID="nameRequired" runat="server" ErrorMessage=" * 입력해주세요" ControlToValidate="name" ValidationGroup="member" ForeColor="Red" CssClass="idpw-info" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell><div class="head-cell"><span class="empha"></span>아이디</div></asp:TableHeaderCell>
            <asp:TableCell>
                <div class="col-cell">
                    <asp:TextBox ID="id" runat="server" CssClass="MS_input_txt normal-input" MaxLength="20"></asp:TextBox>
                    <asp:Button ID="bt" runat="server" Text="중복확인" OnClick="bt_Click" CssClass="cbtn form" ValidationGroup="id"/>
                    <asp:Label ID="idText" runat="server" Text="" CssClass="idpw-info"></asp:Label>
                    <asp:RequiredFieldValidator ID="idRequired" runat="server" ErrorMessage=" * 입력해주세요" ControlToValidate="id" ValidationGroup="id" ForeColor="Red" CssClass="idpw-info" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    
                </div>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell>
                <div class="head-cell"><span class="empha"></span>비밀번호</div>
            </asp:TableHeaderCell>
            <asp:TableCell>
                <div class="col-cell">
                    <asp:TextBox ID="password1" runat="server" CssClass="MS_input_txt normal-input" MaxLength="20"></asp:TextBox>
                    <span class="idpw-info">* 비밀번호는 4~20자로 입력해 주세요.</span>
                    <asp:RequiredFieldValidator ID="pwRequired" runat="server" ErrorMessage=" * 입력해주세요" ControlToValidate="password1" ValidationGroup="member" ForeColor="Red" CssClass="idpw-info" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell>
                <div class="head-cell"><span class="empha"></span>비밀번호 확인</div>
            </asp:TableHeaderCell>
            <asp:TableCell>
                <div class="col-cell">
                    <asp:TextBox ID="password2" runat="server" CssClass="MS_input_txt normal-input" MaxLength="20"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage=" * 비밀번호가 맞지 않습니다." ControlToValidate="password1" ControlToCompare="password2" ValidationGroup="member" ForeColor="Red" CssClass="idpw-info" SetFocusOnError="true"></asp:CompareValidator>
                </div>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell>
                <div class="head-cell"><span class="empha"></span>집주소</div>
            </asp:TableHeaderCell>
            <asp:TableCell>
                <div class="col-cell">
                    <asp:TextBox ID="address" runat="server" CssClass="MS_input_txt normal-input" MaxLength="100"></asp:TextBox><asp:RequiredFieldValidator ID="addrRequired" runat="server" ErrorMessage=" * 입력해주세요" ControlToValidate="address" ValidationGroup="member" ForeColor="Red" CssClass="idpw-info" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </div>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell>
                <div class="head-cell"><span class="empha"></span>이메일</div>
            </asp:TableHeaderCell>
            <asp:TableCell>
                <div class="col-cell">
                    <div class="col-cell email-area">
                        <asp:TextBox ID="email1" runat="server" CssClass="MS_input_txt normal-input" MaxLength="20"></asp:TextBox>
		                <span>@</span>
                        <asp:DropDownList ID="email2" runat="server" CssClass="MS_select MS_email" style="margin-right:5px;">
                            <asp:ListItem>naver.com</asp:ListItem>
                            <asp:ListItem>nate.com</asp:ListItem>
                            <asp:ListItem>gmail.com</asp:ListItem>
                            <asp:ListItem>hanmail.net</asp:ListItem>
                            <asp:ListItem Value="direct">직접입력</asp:ListItem>
                        </asp:DropDownList><asp:RequiredFieldValidator ID="emailRequired" runat="server" ErrorMessage=" * 입력해주세요" ControlToValidate="email1" ValidationGroup="member" ForeColor="Red" CssClass="idpw-info" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>                                  
		            </div>
                </div>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableHeaderCell style="border-bottom:1px solid black;">
                <div class="head-cell"><span class="empha"></span>휴대폰</div>
            </asp:TableHeaderCell>
            <asp:TableCell>
                <div class="col-cell">
                    <asp:TextBox ID="phone" runat="server" CssClass="MS_input_txt normal-input" MaxLength="13"></asp:TextBox>
			        <span class="idpw-info"> * - 포함</span>
                    <asp:RequiredFieldValidator ID="phoneRequired" runat="server" ErrorMessage=" * 입력해주세요" ControlToValidate="phone" ValidationGroup="member" ForeColor="Red" CssClass="idpw-info" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="* 잘못된 번호입니다." ControlToValidate="phone" ValidationGroup="member" ForeColor="Red" CssClass="idpw-info" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^\d{3}-\d{3,4}-\d{4}$"></asp:RegularExpressionValidator>
		        </div>
            </asp:TableCell>
        </asp:TableRow>
</asp:Table>
<div class="a">
    <asp:Button ID="submit" runat="server" Text="회원가입" CssClass="skinbtn point2 l-login" ValidationGroup="member" OnClick="submit_Click"/>
</div>
</div>
</asp:Content>

