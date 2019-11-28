<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
section {
    width: 100%;
    height: 900px;
}
section div.inner {
	width:85%;
    height: 100%;
    margin: 0 auto;
    position: relative;
    
}
section div.inner dl.text dd {
 	width:50%;
    padding-top: 110px;
}
img, video {
    max-width: 100%;
    border: 0;
    vertical-align: top;
    float:left;
}
section div.inner dl.text dt.title {
    font-size: 70px;
    color: #000;
    font-family: 'notokr-regular';
    padding-top: 110px;
}
section div.inner dl.text dt {
    color: #000;
    width: 40%;
    float:right;
}
section div.inner dl.text dt.text {
    font-size: 25px;
    color: #333;
    font-family: 'notokr-regular';
}
dl {
    display: block; 
    margin-block-start: 1em;
    margin-block-end: 1em;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<section style="background-color:white">
	<div class="inner">
		<dl class="text">
			<dd><img src="./images/about.JPG"></dd>
			<dt class="title"><b>SK8MAFIA</b></dt>
			<dt class="text">
			<br>저희는 스케이트보드 판매뿐만 아니라 스케이트보드에 대한 영상과 함께 새롭고 쉬운 강좌를 제공하고 있습니다.<br>
저희는 여러분의 의견을 존중하고 언제든 환영합니다.<br>
저희는 스케이트보드에 관심이 있거나 아직 접해보지 못한 분들을 위해 항상 노력하겠습니다.<br>
처음 시작할 때와 똑같은 마음으로, 항상 보더의 입장에서 생각하고 보더와 함께 성장해 나가고자 합니다.<br>
단순히 최저가를 제시하거나 상품과 서비스를 효율적으로 공급하는 것에 만족하지 않고, 보드씬의 발전을 위한 역할을 계속해 나가겠습니다.
			</dt>
		</dl>
	</div>
</section>
</asp:Content>

