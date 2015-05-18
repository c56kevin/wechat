<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tongji.aspx.cs" Inherits="web.tongji" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    1、您了解群众性精神文明创建活动吗？  <br />
         A、非常了解<asp:Label ID="lb1_1" runat="server"></asp:Label>
         B、了解一些<asp:Label ID="lb1_2" runat="server"></asp:Label>
         C、不了解 <asp:Label ID="lb1_3" runat="server"></asp:Label>
    2、您认为群众性精神文明创建活动的效果如何？    
        <asp:Label ID="lb2_1" runat="server"></asp:Label>
         <asp:Label ID="lb2_2" runat="server"></asp:Label>
         <asp:Label ID="lb2_3" runat="server"></asp:Label>
        3、您认为群众性精神文明创建活动最有效的工作方式有哪些？（多选）
    </div>
    </form>
</body>
</html>
