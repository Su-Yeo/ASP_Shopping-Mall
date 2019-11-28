<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">
    Member member = new Member();
    protected void submit_Click(object sender, EventArgs e)
    {
        int r = member.Login(id.Text,passwd.Text);
        if (r == 0)
        {
            alert("존재하지 않는 아이디 입니다.","");     
        }else if (r==1)
        {
            alert("비밀번호가 맞지 않습니다.","");
        }
        else
        {
            Session["id"] = id.Text;
            alert("안녕하세요! "+id.Text+"님","location.href='Index.aspx';");
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
.member {
	height:650px;
    width: 579px;
    margin: 0 auto;
    padding: 100px 0;
}
.member h2 {
    color: #222;
    font-size: 28px;
}
.member .box {
    margin: 17px 0 0;
    padding: 53px 54px 59px;
    border: 1px solid #dcdcdc;
}
.member .box h3 {
    padding: 0 0 3px;
    color: #222;
    font-size: 20px;
    font-weight: normal;
}
.member .box .login {
    overflow: hidden;
}
.member .box .login .input-info {
    float: left;
}
.member .box .login .input-info div {
    position: relative;
    margin: 11px 0 0;
}
.member .box .login .input-info div .txt-frm {
    width: 290px;
    height: 36px;
    padding: 0 13px;
    border: 1px solid #ccc;
    color: #8c8c8c;
    font-size: 13px;
    line-height: 36px;
}
.member .box .login button {
    float: right;
    margin: 11px 0 0;
}
.skinbtn.point1.l-confirm, .skinbtn.point2.l-login, .skinbtn.point2.fi-id {
    width: 158px;
    height: 87px;
    font-size: 16px;
    font-weight: bold;
    line-height: 85px;
    margin:10px;
}
.skinbtn.point2 {
    background: #000;
    border: 1px solid #000;
    color: #fff;
    font-weight: bold;
}
.member .box .btn {
    margin: 16px 0 0;
    padding: 16px 0 0;
    border-top: 1px solid #dbdbdb;
    font-size: 0;
    text-align: center;
}
.skinbtn.base3.l-join, .skinbtn.default.l-findid, .skinbtn.default.l-findpw, .skinbtn.default.fi-pw, .skinbtn.default.fi-login {
    width: 149px;
    height: 44px;
    line-height: 42px;
    font-weight: bold;
}

.skinbtn.base3 {
    border: 1px solid #a3a3a3;
    color: #666;
}
.skinbtn {
    display: inline-block;
    *display: inline;
    *zoom: 1;
    height: 40px;
    padding: 0 5px;
    text-align: center;
    vertical-align: top;
    box-sizing: border-box;
    cursor: pointer;
    font-size: 12px;
}
.skinbtn.default {
    border: 1px solid #a3a3a3;
    color: #666;
}

.skinbtn + .skinbtn {
    margin: 0 0 0 10px;
}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
	<div class="member">
		<h2>로그인</h2>
		<div class="box">
			<h3>회원 로그인</h3>
			 <div class="login">
					<div class="input-info">
						<div>
                            <asp:TextBox ID="id" runat="server" MaxLength="20" CssClass="MS_login_id txt-frm"></asp:TextBox>
						</div>
						<div>
                            <asp:TextBox ID="passwd" runat="server" MaxLength="20" CssClass="MS_login_pw txt-frm"></asp:TextBox>
						</div>
					</div>
                    <asp:Button ID="submit" runat="server" Text="로그인" CssClass="skinbtn point2 l-login" OnClick="submit_Click" ValidationGroup="login"/>              
                    <asp:RequiredFieldValidator ID="idRequired" runat="server" ErrorMessage=" 아이디를 입력해주세요" ControlToValidate="id" ValidationGroup="login" ForeColor="Red" CssClass="idpw-info"></asp:RequiredFieldValidator>               
                    <asp:RequiredFieldValidator ID="passwdRequired" runat="server" ErrorMessage=" 비밀번호를 입력해주세요" ControlToValidate="passwd" ValidationGroup="login" ForeColor="Red" CssClass="idpw-info"></asp:RequiredFieldValidator>
				</div>

				<div class="btn">
					<a href="Member.aspx" class="skinbtn base3 l-join" id="btnJoinMember">회원가입</a>
					<a href="#" class="skinbtn default l-findid" id="btnFindId">아이디 찾기</a>
					<a href="#" class="skinbtn default l-findpw" id="btnFindPwd">비밀번호 찾기</a>
				</div>				
		</div>
	</div>
</div>
</asp:Content>

