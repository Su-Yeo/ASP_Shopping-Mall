<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="media/vidbg.js"></script>
<style>
div#main{
	height:800px;
	background-color:#000;
}
div#main section {
  height: 600px;
  background-color: #fff;
  -webkit-transform-style: preserve-3d;
  transform-style: preserve-3d;
}
div#main div.button{font-size:60px; text-align:center; margin-top:40px;}
div#main div.button a{background:#fff; color:black; padding:0 40px 10px 40px; border-radius: 20px;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="main">
	<section class="video" data-vidbg-bg="mp4: media/skate.mp4, poster: media/fallback.jpg" data-vidbg-options="loop: true, muted: true, overlay: false">
	</section>
	<div class="button"><a href="Videos.aspx">▶ MORE VIDEOS</a></div>
</div>
</asp:Content>

