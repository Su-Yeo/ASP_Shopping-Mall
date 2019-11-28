<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void deleteBtn_Click(object sender, EventArgs e)
    {
        Response.Write("<script>alert('탈퇴되었습니다.');location.href='Index.aspx';</");
        Response.Write("script>");
        Session.Contents.RemoveAll();
        Session.Abandon();
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
div.wrapper{
	margin: 0 auto;
    padding: 60px 0;
    height:700px;
}
table.persion-tb, table.persion-tb th, table.persion-tb td {
    width:40%;
	color: #000;
    margin: 0 auto;
    padding: 0;
    border-spacing: 0;
    border: 0;
    border-collapse: collapse;
    vertical-align: middle;
    padding: 10px;
    font-size: 20px;
    border-bottom: 1px solid #888;
}
table.persion-tb tr {
    padding:7px 0;
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
.person-tb td {
    padding: 13px;
    vertical-align: middle;
}

.person-tb td {
    height: 33px;
    border-bottom: 1px solid #888;
    width:70%;
}
.normal-input {
    width: 400px;
}

.small-input, .normal-input, .large-input {
    height: 31px;
    line-height: 31px;
    border: 0px solid #888;
    padding: 0 10px;
}
.MS_input_txt {
    margin-right: 5px;
    padding: 2px 0 0 2px;
    line-height: 31px;
    height: 31px;
}
input, select {
    font-size:20px;
    outline: none;
    font-family: Malgun Gothic,'맑은 고딕',Helvetica,AppleGothic,dotum,'돋움',sans-serif;
    color: #717171;
}
.cbtn {
    display: inline-block;
    font-size: 11px;
    color: #000;
    min-width: 98px;
    height: 31px;
    line-height: 32px;
    border: 1px solid #000;
    text-align: center;
    -webkit-transition: all 0.3s ease;
    transition: all 0.3s ease;
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
table.persion-tb .th{
    font-size: 20px;
    background-color: black;
    color: white;
    width: 30%;
}
.a{margin: 0 auto; text-align:center; margin-top:50px;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="wrapper" style="background-color:white">
    <h1 style="color:black; text-align:center; margin:40px 0;">회원정보</h1>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1" AutoGenerateColumns="False" DataKeyNames="id" ShowHeader="false" Width="100%" ForeColor="Black" BorderStyle="None">
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"  Visible="false"/>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Table ID="Table1" runat="server" CssClass="persion-tb">
                        <asp:TableRow CssClass="borderTop tr">
                            <asp:TableHeaderCell CssClass="th">
                                <div class="head-cell"><span class="empha"></span>이름</div>
                            </asp:TableHeaderCell>
                            <asp:TableCell CssClass="td">
                                <div class="col-cell">
                                    <div class="MS_input_txt normal-input">
                                        <asp:Literal ID="name" runat="server"  Text='<%# Bind("name") %>'></asp:Literal>
                                    </div>
                                </div>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="tr">
                            <asp:TableHeaderCell CssClass="th">
                                <div class="head-cell"><span class="empha"></span>아이디</div>
                            </asp:TableHeaderCell>
                            <asp:TableCell CssClass="td">
                                <div class="col-cell">
                                    <div class="MS_input_txt normal-input">
                                        <asp:Literal ID="id" runat="server"  Text='<%# Bind("id") %>'></asp:Literal></div>
                                </div>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="tr">
                            <asp:TableHeaderCell CssClass="th">
                                <div class="head-cell"><span class="empha"></span>집주소</div>
                            </asp:TableHeaderCell>
                            <asp:TableCell CssClass="td">
                                <div class="col-cell">
                                    <div class="MS_input_txt normal-input">
                                        <asp:Literal ID="addr" runat="server"  Text='<%# Bind("addr") %>'></asp:Literal></div>
                                </div>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="tr">
                            <asp:TableHeaderCell CssClass="th">
                                <div class="head-cell"><span class="empha"></span>이메일</div>
                            </asp:TableHeaderCell>
                            <asp:TableCell CssClass="td">
                                <div class="col-cell email-area">
                                    <div class="MS_input_txt normal-input">
                                        <asp:Literal ID="email" runat="server"  Text='<%# Bind("email") %>'></asp:Literal></div>
                                </div>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="tr">
                            <asp:TableHeaderCell CssClass="th">
                                <div class="head-cell"><span class="empha"></span>휴대폰</div>
                            </asp:TableHeaderCell>
                            <asp:TableCell CssClass="td">
                                <div class="col-cell">
                                    <div class="MS_input_txt normal-input">
                                        <asp:Literal ID="tel" runat="server"  Text='<%# Bind("tel") %>'></asp:Literal></div>
                                </div>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                <div class="a">
                    <asp:TableCell>
                        <asp:Button ID="editBtn" runat="server" CommandName="Edit" 
                            Text="정보수정" CssClass="skinbtn point2 l-login">
                        </asp:Button>
                        <asp:Button ID="deleteBtn" runat="server" CommandName="Delete" 
                            Text="회원탈퇴" CssClass="skinbtn point2 l-login" OnClick="deleteBtn_Click">
                        </asp:Button>
                    </asp:TableCell>
                </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Table ID="Table1" runat="server" CssClass="persion-tb table">
                        <asp:TableRow CssClass="borderTop tr">
                            <asp:TableHeaderCell CssClass="th">
                                <div class="head-cell"><span class="empha"></span>이름</div>
                            </asp:TableHeaderCell>
                            <asp:TableCell CssClass="td">
                                <div class="col-cell">
                                    <div class="MS_input_txt normal-input">
                                        <asp:TextBox ID="name" runat="server"  Text='<%# Bind("name") %>'></asp:TextBox>
                                    </div>
                                </div>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="tr">
                            <asp:TableHeaderCell CssClass="th">
                                <div class="head-cell"><span class="empha"></span>아이디</div>
                            </asp:TableHeaderCell>
                            <asp:TableCell CssClass="td">
                                <div class="col-cell">
                                    <div class="MS_input_txt normal-input">
                                        <asp:TextBox ID="id" runat="server"  Text='<%# Bind("id") %>' ReadOnly="true"></asp:TextBox></div>
                                </div>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="tr">
                            <asp:TableHeaderCell CssClass="th">
                                <div class="head-cell"><span class="empha"></span>비밀번호</div>
                            </asp:TableHeaderCell>
                            <asp:TableCell CssClass="td">
                                <div class="col-cell">
                                    <div class="MS_input_txt normal-input">
                                        <asp:TextBox ID="passwd" runat="server"  Text='<%# Bind("passwd") %>'></asp:TextBox></div>
                                </div>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="tr">
                            <asp:TableHeaderCell CssClass="th">
                                <div class="head-cell"><span class="empha"></span>집주소</div>
                            </asp:TableHeaderCell>
                            <asp:TableCell CssClass="td">
                                <div class="col-cell">
                                    <div class="MS_input_txt normal-input">
                                        <asp:TextBox ID="addr" runat="server"  Text='<%# Bind("addr") %>'></asp:TextBox></div>
                                </div>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="tr">
                            <asp:TableHeaderCell CssClass="th">
                                <div class="head-cell"><span class="empha"></span>이메일</div>
                            </asp:TableHeaderCell>
                            <asp:TableCell CssClass="td">
                                <div class="col-cell email-area">
                                    <div class="MS_input_txt normal-input">
                                        <asp:TextBox ID="email" runat="server"  Text='<%# Bind("email") %>'></asp:TextBox></div>
                                </div>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="tr">
                            <asp:TableHeaderCell CssClass="th">
                                <div class="head-cell"><span class="empha"></span>휴대폰</div>
                            </asp:TableHeaderCell>
                            <asp:TableCell CssClass="td">
                                <div class="col-cell">
                                    <div class="MS_input_txt normal-input">
                                        <asp:TextBox ID="tel" runat="server"  Text='<%# Bind("tel") %>'></asp:TextBox></div>
                                </div>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                <div class="a">
                    <asp:TableCell>
                        <asp:Button ID="updateBtn" runat="server" CommandName="Update" 
                            Text="정보수정" CssClass="skinbtn point2 l-login">
                        </asp:Button>
                        <asp:Button ID="deleteBtn" runat="server" CommandName="Delete" 
                            Text="회원탈퇴" CssClass="skinbtn point2 l-login" OnClick="deleteBtn_Click">
                        </asp:Button>
                    </asp:TableCell>
                </div>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" DeleteMethod="DeleteMember" SelectMethod="SelectMemberInfo" TypeName="Member" UpdateMethod="UpdateMember">
        <DeleteParameters>           
            <asp:Parameter Name="id" Type="String"></asp:Parameter>
        </DeleteParameters>
        <SelectParameters>
            <asp:SessionParameter SessionField="id" DefaultValue="0" Name="id" Type="String"></asp:SessionParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="id" Type="String"></asp:Parameter>
            <asp:Parameter Name="passwd" Type="String"></asp:Parameter>
            <asp:Parameter Name="name" Type="String"></asp:Parameter>
            <asp:Parameter Name="addr" Type="String"></asp:Parameter>
            <asp:Parameter Name="tel" Type="String"></asp:Parameter>
            <asp:Parameter Name="email" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:ObjectDataSource>
</div>
</asp:Content>

