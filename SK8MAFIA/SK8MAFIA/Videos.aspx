<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">
    Videos videos = new Videos();

    protected void Page_Load(object sender, EventArgs e)
    {
        Repeater1.DataSource = videos.SelectVideoList(); //rd 바인딩 
        Repeater1.DataBind(); //데이터 바인딩
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        * {margin:0; padding:0;}
        #inner{margin:70px; height:2100px;}
        iframe{display: inline; float: left; margin-right: 100px;}
        h1.title{color:black;}
        div#inner div.set dl.text dt.text {margin-top:10px; font-size: 25px; color:black;}
        div#inner div.set dl.text{display: block; height:315px;}
        div#inner div.set:first-child{margin-top:0;}
        div#inner div.set{margin-top:120px;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="inner">
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>     
            <div class="set">
                <iframe width="560" height="315" src="https://www.youtube.com/embed/<%# Eval("link") %>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	            <dl class="text">
		            <dt><h1 class="title"><%# Eval("title") %></h1></dt>
		            <dt class="text"><%# Eval("text") %></dt>
	            </dl>
            </div> 
        </ItemTemplate>
    </asp:Repeater>
    </div>
</asp:Content>

