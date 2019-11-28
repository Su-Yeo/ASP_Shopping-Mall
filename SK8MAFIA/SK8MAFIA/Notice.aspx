<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

    protected void Table1_PreRender(object sender, EventArgs e)
    {
        if (Session["id"]!=null&&Session["id"].ToString().Equals(Request["uid"].ToString()))
        {
            TableRow tr = (TableRow)GridView1.Rows[0].Cells[0].FindControl("tableBtn");
            tr.Visible = true;
        }
        else
        {
            TableRow tr = (TableRow)GridView1.Rows[0].Cells[0].FindControl("tableBtn");
            tr.Visible = false;
        }
    }

    protected void deleteBtn_Click(object sender, EventArgs e)
    {
        Response.Write("<script>alert('삭제되었습니다.');location.href='NoticeList.aspx';</");
        Response.Write("script>");
    }

    protected void list_Click(object sender, EventArgs e)
    {
        Response.Write("<script>location.href='NoticeList.aspx';</");
        Response.Write("script>");
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
div.n{ width: 1100px; min-height: 900px; margin: 0 auto; margin-top:50px; margin-bottom:50px;}
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
    text-align:center;
}
.wrttd {
    padding: 17px 0 16px 0;
    color: #000;
    font-family: 'notokr-regular';
    font-size: 24px;
    border-top: 1px solid #dcdcdc;
    text-align:left;
    padding-left:10px;
	height:600px;
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
    margin:10px;
}
.a{margin: 0 auto; text-align:center; margin-top:50px;}

.input_txt {
    font-family:"notokr-regular";
	font-size: 30px;
	width:90%;
}
.wrt_write{
    font-family:"notokr-regular";
	font-size: 26px;
	resize:none;
	width:100%;
	height:600px;
}
textarea{
    font-family:"notokr-regular";
	font-size: 26px;
	resize:none;
	width:100%;
	height:600px;
}
table.tb th.date {
	padding:10px;
    font-family: 'notokr-regular';
    font-size: 23px;
    font-weight:normal;
    color: #000;
    text-align: right;
}
.datetxt {
    font-family: 'notokr-regular';
    font-size: 23px;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="n">
        <a href="NoticeList.aspx"><h1>게시판</h1></a>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1" AutoGenerateColumns="False" DataKeyNames="nid,uid" ShowHeader="false" Width="100%" ForeColor="Black">
        <Columns>      
            
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" Visible="false"/>
           
            <asp:TemplateField HeaderText="" SortExpression="nid">
                <ItemTemplate>
                    <asp:Table ID="rtable" runat="server" CssClass="tb" OnPreRender="Table1_PreRender">
                        <asp:TableRow CssClass="tr">
                            <asp:TableHeaderCell CssClass="subject th">
                                <b>제목</b><asp:Label ID="TextBox1" runat="server" Text='<%# Bind("title") %>' CssClass="input_txt"/>
                            </asp:TableHeaderCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="tr">
                            <asp:TableHeaderCell CssClass="th date">
                                <span class="space"><b>작성자 </b><asp:Label ID="TextBox2" runat="server" 
                                    Text='<%# Bind("uid") %>' ReadOnly="True" CssClass="datetxt"/></span>
				                <span><b>작성일 </b><asp:Label ID="TextBox3" runat="server" 
                                    Text='<%# Bind("date","{0:yyyy-MM-dd}") %>' ReadOnly="true" CssClass="datetxt"/>
                            </asp:TableHeaderCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="tr">
                            <asp:TableCell CssClass="wrttd">
                                <asp:Label ID="text" runat="server" TextMode="MultiLine" CssClass="wrt_write" Text='<%# Bind("text") %>'></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow ID="tableBtn" CssClass="tr">
                            <asp:TableCell>
                                <asp:Button ID="editBtn" runat="server" CommandName="Edit" 
                                    Text="수정" CssClass="skinbtn point2 l-login">
                                </asp:Button>
                                <asp:Button ID="list" runat="server" Text="목록" CssClass="skinbtn point2 l-login" OnClick="list_Click"/>
                                <asp:Button ID="deleteBtn" runat="server" CommandName="Delete" 
                                    Text="삭제" OnClick="deleteBtn_Click" CssClass="skinbtn point2 l-login">
                                </asp:Button>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Table ID="rtable" runat="server" CssClass="tb" OnPreRender="Table1_PreRender">
                        <asp:TableRow CssClass="tr">
                            <asp:TableHeaderCell CssClass="subject th">
                                <b>제목</b><asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("title") %>' CssClass="input_txt"/>
                            </asp:TableHeaderCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="tr">
                            <asp:TableHeaderCell CssClass="th date">
                                <span class="space"><b>작성자 </b><asp:TextBox ID="TextBox2" runat="server" 
                                    Text='<%# Bind("uid") %>' ReadOnly="True" CssClass="datetxt"/></span>
				                <span><b>작성일 </b><asp:TextBox ID="TextBox3" runat="server" 
                                    Text='<%# Bind("date","{0:yyyy-MM-dd}") %>' ReadOnly="true" CssClass="datetxt"/>
                            </asp:TableHeaderCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="tr">
                            <asp:TableCell CssClass="td">
                                <asp:TextBox ID="text" runat="server" TextMode="MultiLine" 
                                    Text='<%#Eval("text")%>'></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow ID="tableBtn" CssClass="tr">
                            <asp:TableCell>
                                <asp:Button ID="updateBtn" runat="server" CommandName="Update" 
                                    Text="완료" CssClass="skinbtn point2 l-login">
                                </asp:Button>
                                <asp:Button ID="list" runat="server" Text="목록" CssClass="skinbtn point2 l-login" OnClick="list_Click">
                                </asp:Button>
                                <asp:Button ID="deleteBtn" runat="server" CommandName="Delete" 
                                    Text="삭제" OnClick="deleteBtn_Click" CssClass="skinbtn point2 l-login">
                                </asp:Button>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </EditItemTemplate>
            </asp:TemplateField>           
        </Columns>

        <RowStyle BackColor="White"></RowStyle>
    </asp:GridView>
    </div>
    <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" DeleteMethod="DeleteNotice" InsertMethod="InsertNotice" SelectMethod="SelectNoticeInfo" TypeName="Notice" UpdateMethod="UpdateNotice">
        <DeleteParameters>
            <asp:Parameter Name="nid" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nid" Type="String"></asp:Parameter>
            <asp:Parameter Name="title" Type="String"></asp:Parameter>
            <asp:Parameter Name="text" Type="String"></asp:Parameter>
            <asp:Parameter Name="uid" Type="String"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="nid" DefaultValue="1" Name="nid" Type="String"></asp:QueryStringParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="nid" Type="String"></asp:Parameter>
            <asp:Parameter Name="title" Type="String"></asp:Parameter>
            <asp:Parameter Name="text" Type="String"></asp:Parameter>
            <asp:Parameter Name="date" Type="String"></asp:Parameter>
            <asp:Parameter Name="uid" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>

