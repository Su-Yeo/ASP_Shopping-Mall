﻿<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <% 
                Session.Contents.RemoveAll();
                Session.Abandon();
                Response.Redirect("Index.aspx");
            %>
        </div>
    </form>
</body>
</html>
