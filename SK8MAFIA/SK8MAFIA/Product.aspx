<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">
    Product pro = new Product();

    protected void Page_Load(object sender, EventArgs e)
    {
        string pid = Request["pid"].ToString();
        pro.SelectProductInfo(pid);
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
* {margin:0; padding:0;}
div#storeInner{margin:50px; height:1100px;}
div.product dl{
	height: 970px;
    list-style: none;
    margin-top:24px;
}
div.product dl.img {
    overflow:hidden;
	border: 1px solid #c2c2c2; 
    width: 65%;
    float:left;
    text-align: center;
}
div.product dl.info {
	border: 0px solid #c2c2c2; 
    width: 30%;
    float:right;
    text-align: center;
}
a#target {
	width: 85%;
    height: 50px;
    font-size: 20px;
    background: #fff;
    border: 1px solid #000;
    color: #000;
    margin-top:20px;
    text-align: center;
    text-decoration: none;
    padding:13px 60px;
    display: inline-block;
}
div.product dl.img dd {
    width: 100%;
    font-family: 'notokr-regular';
    font-size: 20px;
    color: #000;
    overflow: hidden;
}
div.product dl.info dt {
    width: 100%;
    font-family: 'notokr-regular';
    color: #000;
}
div.product dl.info dt.title{font-size: 36px; padding-top:150px; padding-left:30px; text-align: left;}
div.product dl.info dt.text{font-size: 26px; padding:30px 0 0 30px; text-align: left;}
img{
    max-width: 80%;
    border: 0;
    vertical-align:middle;
}
.product_quantity_container {
	padding-left:30px;
	text-align: left;
    margin-top: 43px;
    display: block;
    position: relative;
    box-sizing: border-box;
}
.product_quantity_container span {
    display: inline-block;
    font-size: 14px;
    font-weight: 600;
    color: #232323;
    vertical-align: middle;
}
.product_quantity {
    display: inline-block;
    width: 122px;
    height: 41px;
    border: solid 1px #b5b5b5;
    overflow: hidden;
    padding-left: 11px;
    vertical-align: middle;
    margin-left: 14px;
}
input[type=number]::-webkit-inner-spin-button {  
    height: 40px; 
}
.product_quantity input {
    display: block;
    width: 100%;
    height: 41px;
    border: none;
    outline: none;
    font-size: 18px;
    font-weight: 400;
    color: #232323;
    text-align: left;
    padding-left: 9px;
    line-height: 39px;
}
.skinbtn.point2 { 
	width: 85%;
    height: 50px;
    font-size: 20px;
    background: #000;
    border: 1px solid #000;
    color: #fff;
    margin-top:40px;
    text-align: center;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="storeInner">
<div class="product">
	<dl class="img">
		<dd><img src="<%=pro.Img %>"></dd>
	</dl>
</div>
<div class="product">
	<dl class="info">
		<dt class="title"><b><%=pro.Name %></b></dt>
		<dt class="text"><%=pro.Price %>원</dt>
		<dt class="product_quantity_container">
			<span>Quantity</span>
			<div class="product_quantity clearfix">
				<input type="number" pattern="[1-9]*" min=1 value=1 name="quantity">
				<input type="hidden" value="<%= pro.Pid %>" name="pid">
			</div>
		</dt>
		<dd><input type="submit" class="skinbtn point2" value="Add to Cart"></dd>
		<dt><a href="Store.aspx" id="target">Back to catalog</a></dt>
	</dl>
</div>
</div>
</asp:Content>

