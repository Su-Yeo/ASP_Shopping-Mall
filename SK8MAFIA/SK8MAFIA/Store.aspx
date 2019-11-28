<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">
    Product pro = new Product();

    protected void Page_Load(object sender, EventArgs e)
    {
        Repeater1.DataSource = pro.SelectProductList(); //rd 바인딩 
        Repeater1.DataBind(); //데이터 바인딩
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
* {margin:0; padding:0;}
div#storeInner{margin:50px; height:1700px;}
div.product dl.pro {
    border: 1px solid #c2c2c2;
    width: 30%;
    height: 500px;
    text-align: center;
    list-style: none;
    float:left;
    margin:24px;
    overflow: hidden;
}
a#target {
    vertical-align: top;
    text-decoration: none;
    color: #000;
}
div.product dl.pro dd {
    margin: 0 auto;
    width: 83%;
    font-family: 'notokr-regular';
    font-size: 20px;
    color: #000;
    overflow: hidden;
}
div.product dl.pro dt {
    width: 100%;
    font-family: 'notokr-regular';
    color: #000;
}
div.product dl.pro dt.title{font-size: 36px; padding: 8px 0;}
div.product dl.pro dt.text{font-size: 26px; padding-bottom: 5px;}
img#simg{
    max-width: 90%; 
    height: auto;
    border: 0;
    vertical-align: top;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="storeInner">
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <div class="product">
                <a href="Product.aspx?pid=<%# Eval("pid") %>" id="target">
	                <dl class="pro">
		                <dd><img src="<%# Eval("img") %>" id="simg"></dd>
		                <dt class="title"><b><%# Eval("name") %></b></dt>
		                <dt class="text"><%# Eval("price") %>원</dt>
	                </dl>
                </a>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
</asp:Content>

