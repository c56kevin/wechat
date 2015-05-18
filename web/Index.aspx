<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="web.Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>黑龙江省农村精神文明调查问卷</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/main.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <asp:View ID="View1" runat="server">
                        <script type="text/javascript">
                            //检查是否全部回答问题
                            function checkNull() {

                                if ($("#DropDownList1").val() == "-1") {
                                    alert("请选择市（地）！");
                                    $("#DropDownList1").focus();
                                    return false;
                                }
                                if ($("#DropDownList2").val() == "-1") {
                                    alert("请选择县（市、区）！");
                                    $("#DropDownList2").focus();
                                    return false;
                                }
                                if ($("#TextBox1").val() == "") {
                                    alert("请填写镇！");
                                    $("#TextBox1").focus();
                                    return false;
                                }
                                if ($("#TextBox2").val() == "") {
                                    alert("请填写村！");
                                    $("#TextBox2").focus();
                                    return false;
                                }
                                if ($("#zhiwu").val() == "") {
                                    alert("请填写职务！");
                                    $("#zhiwu").focus();
                                    return false;
                                }
                                for (var i = 1; i <3; i++) {
                                    var aa = "";
                                    var a = $(":radio[name='radio" + i + "']:checked")
                                    if (a.length == 0) {
                                        alert("请回答单选" + i + "题！");
                                        $(":radio[name='radio" + i + "']").focus();
                                        return false;
                                    }
                                }
                                for (var i = 3; i < 11; i++) {
                                    var isCheck = false;
                                    for (var j = 1; j < 9; j++) {
                                        var a = $("#radio" + i + "0" + j);
                                        if (a && a.attr("checked")) {
                                            isCheck = true;
                                            break;
                                        }
                                    }
                                    if (isCheck == false) {
                                        alert("请回答多选第" + i + "题！");
                                        $("#radio" + i + "01").focus();
                                        return false;
                                    }
                                }
                                return true;
                            }
                            function ReSet() {
                                document.getElementById("TextBox1").value = "";
                                document.getElementById("TextBox2").value = "";
                                document.getElementById("TextBox3").value = "";
                                document.getElementById("TextBox4").value = "";
                                document.getElementById("DropDownList1").value = "";
                            }

                        </script>
                        <div class="main">

                            <div class="con">
                                <div class="con-from">
                                    <table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="49" class="f14 Txt_cu">您所在</td>
                                            <td width="121">
                                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                                            </td>
                                            <td width="74"><span class="f14 Txt_cu">市（地）</span></td>
                                            <td width="117">
                                                <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
                                            </td>
                                            <td width="96"><span class="f14 Txt_cu">县（市、区）</span></td>
                                            <td width="180">
                                                <asp:TextBox ID="TextBox1" runat="server" MaxLength="100"></asp:TextBox>
                                            </td>
                                            <td width="59"><span class="f14 Txt_cu">镇</span></td>
                                            <td width="175">
                                                <asp:TextBox ID="TextBox2" runat="server" MaxLength="100"></asp:TextBox>
                                            </td>
                                            <td width="29"><span class="f14 Txt_cu">村</span></td>
                                        </tr>
                                        <tr>
                                            <td width="49" class="f14 Txt_cu">
                                                职务：
                                            </td>
                                            <td width="175" colspan="7">
                                                <asp:TextBox ID="zhiwu" runat="server" MaxLength="100"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="con-li">
                                    <ul>
                                        <li>
                                            <table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td colspan="5" class="f14 Txt_cu">1、您了解群众性精神文明创建活动吗？  </td>
                                                </tr>
                                                <tr>
                                                    <td width="180" height="50">
                                                        <input type="radio" runat="server" name="radio1" id="radio101" value="A" />
                                                        A、非常了解 </td>
                                                    <td width="180">
                                                        <input type="radio" runat="server" name="radio1" id="radio102" value="B" />
                                                        B、了解一些 </td>
                                                    <td width="180"><input type="radio" runat="server" name="radio1" id="radio103" value="C" />C、不了解</td>
                                                    <td width="180">&nbsp;</td>
                                                    <td width="180" height="30">&nbsp;</td>
                                                </tr>
                                            </table>
                                        </li>
                                        <li>
                                            <table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td colspan="5" class="f14 Txt_cu">2、您认为群众性精神文明创建活动的效果如何？  </td>
                                                </tr>
                                                <tr>
                                                    <td width="180" height="50">
                                                        <input type="radio" runat="server" name="radio2" id="radio201" value="A" />
                                                        A、很好</td>
                                                    <td width="180">
                                                        <input type="radio" runat="server" name="radio2" id="radio202" value="B" />
                                                        B、一般</td>
                                                    <td width="180">
                                                        <input type="radio" runat="server" name="radio2" id="radio203" value="C" />
                                                        C、不太好</td>
                                                    <td width="180">
                                                       </td>
                                                    <td width="180" height="30">&nbsp;</td>
                                                </tr>
                                            </table>
                                        </li>
                                        <li>
                                            <table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td colspan="5" class="f14 Txt_cu">3、您认为群众性精神文明创建活动最有效的工作方式有哪些？（多选）</td>
                                                </tr>
                                                <tr>
                                                    <td width="180" height="50">
                                                        <input type="checkbox" runat="server" name="radio3" value="A" id="radio301" />
                                                        A、开大会 </td>
                                                    <td width="180">
                                                        <input type="checkbox" runat="server" name="radio3" value="B" id="radio302" />
                                                        B、抓典型</td>
                                                    <td width="180">
                                                        <input type="checkbox" runat="server" name="radio3" value="C" id="radio303" />
                                                        C、组织活动</td>
                                                    <td width="180">
                                                        <input type="checkbox" runat="server" name="radio3" value="D" id="radio304" />
                                                        D、加大宣传</td>
                                                    <td width="180" height="30">
                                                        <input type="checkbox" runat="server" name="radio3" value="E" id="radio305" />
                                                        E、利用网络等新兴媒体</td>
                                                     <td width="180" height="30">
                                                        <input type="checkbox" runat="server" name="radio3" value="E" id="radio306" />
                                                        F、其他</td>
                                                </tr>
                                            </table>
                                        </li>
                                       
                                        <li>
                                            <table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td colspan="5" class="f14 Txt_cu">4、您认为群众性精神文明创建活动最受欢迎的形式有哪些？（多选）</td>
                                                </tr>
                                                <tr>
                                                    <td width="180" height="50">
                                                        <input type="checkbox" runat="server" name="radio4" value="A" id="radio401" />
                                                        A、启动仪式</td>
                                                    <td width="180">
                                                        <input type="checkbox" runat="server" name="radio4" value="B" id="radio402" />
                                                         B、知识讲座</td>
                                                    <td width="180">
                                                        <input type="checkbox" runat="server" name="radio4" value="C" id="radio403" />
                                                        C、现场活动</td>
                                                    <td width="180">
                                                        <input type="checkbox" runat="server" name="radio4" value="D" id="radio404" />
                                                       D、学习宣传</td>
                                                    <td width="180" height="30">  <input type="checkbox" runat="server" name="radio4" value="E" id="radio405" />
                                                        E、网上创建</td>
                                                    <td width="180" height="30"><input type="checkbox" runat="server" name="radio4" value="F" id="radio406" />
                                                        F、其他</td>
                                                </tr>
                                            </table>
                                        </li>
                                        <li>
                                            <table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td colspan="4" class="f14 Txt_cu">5、您认为群众性精神文明创建活动最有效的管理方式有哪些？（多选）</td>
                                                </tr>
                                                <tr>
                                                    <td width="180" height="50">
                                                        <input type="checkbox" runat="server" name="radio4" value="A" id="radio501" />
                                                        A、建立制度</td>
                                                    <td width="180">
                                                        <input type="checkbox" runat="server" name="radio4" value="B" id="radio502" />
                                                         B、网上创建</td>
                                                    <td width="180">
                                                        <input type="checkbox" runat="server" name="radio4" value="C" id="radio503" />
                                                        C、动态管理</td>
                                                    <td width="180">
                                                        <input type="checkbox" runat="server" name="radio4" value="D" id="radio504" />
                                                       D、定期交流</td>
                                                    <td width="180" height="30">  <input type="checkbox" runat="server" name="radio4" value="E" id="radio505" />
                                                        E、以评促创</td>
                                                    <td width="180" height="30"><input type="checkbox" runat="server" name="radio4" value="F" id="radio506" />
                                                        F、其他</td>
                                                </tr>
                                            </table>
                                        </li>
                                        <li>
                                            <table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td colspan="5" class="f14 Txt_cu">6、您认为群众性精神文明创建活动最大的成效有哪些？（多选）</td>
                                                </tr>
                                                <tr>
                                                    <td width="180" height="50">
                                                        <input type="checkbox" runat="server" name="radio6" value="A" id="radio601" />
                                                        A、提升素质</td>
                                                    <td width="180">
                                                        <input type="checkbox" runat="server" name="radio6" value="B" id="radio602" />
                                                        B、服务中心</td>
                                                    <td width="180">
                                                        <input type="checkbox" runat="server" name="radio6" value="C" id="radio603" />
                                                        C、改善民生</td>
                                                    <td width="180">
                                                        <input type="checkbox" runat="server" name="radio6" value="D" id="radio604" />
                                                        D、优化环境</td>
                                                    <td width="180" height="30">
                                                        <input type="checkbox" runat="server" name="radio6" value="E" id="radio605" />
                                                        E、加强管理</td>
                                                     <td width="180" height="30">
                                                        <input type="checkbox" runat="server" name="radio6" value="F" id="radio606" />
                                                       F、营造氛围</td>
                                                     <td width="180" height="30">
                                                        <input type="checkbox" runat="server" name="radio6" value="G" id="radio607" />
                                                       G、其他</td>
                                                </tr>
                                            </table>
                                        </li>
                                       <li>
                                            <table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td colspan="5" class="f14 Txt_cu">7、您认为群众性精神文明创建活动最有生命力的品牌有哪些？（多选）</td>
                                                </tr>
                                                <tr>
                                                    <td width="180" height="50">
                                                        <input type="checkbox" runat="server" name="radio7" value="A" id="radio701" />
                                                        A、创建文明城市、文明村镇、文明单位和文明行业</td>
                                                    <td width="180">
                                                        <input type="checkbox" runat="server" name="radio7" value="B" id="radio702" />
                                                        B、讲文明树新风活动</td>
                                                    <td width="180">
                                                        <input type="checkbox" runat="server" name="radio7" value="C" id="radio703" />
                                                        C、道德模范和身边好人评选</td>
                                                    <td width="180">
                                                        <input type="checkbox" runat="server" name="radio7" value="D" id="radio704" />
                                                        D、志愿服务活动 E、未成年人思想道德建设</td>
                                                    <td width="180" height="30">
                                                        <input type="checkbox" runat="server" name="radio7" value="E" id="radio705" />
                                                        E、未成年人思想道德建设</td>
                                                     <td width="180" height="30">
                                                        <input type="checkbox" runat="server" name="radio7" value="F" id="radio706" />
                                                       F、我们的节日主题活动</td>
                                                     <td width="180" height="30">
                                                        <input type="checkbox" runat="server" name="radio7" value="G" id="radio707" />
                                                       G、军警民共建共育活动</td>
                                                     <td width="180" height="30">
                                                        <input type="checkbox" runat="server" name="radio7" value="G" id="radio708" />
                                                        H、网络文明传播</td>
                                                     <td width="180" height="30">
                                                        <input type="checkbox" runat="server" name="radio7" value="G" id="radio709" />
                                                      I、其他</td>
                                                </tr>
                                            </table>
                                        </li>
                                         <li>
                                            <table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td colspan="5" class="f14 Txt_cu">8、您认为群众性精神文明创建活动应该坚持的原则有哪些？（多选）</td>
                                                </tr>
                                                <tr>
                                                    <td width="180" height="50">
                                                        <input type="checkbox" runat="server" name="radio8" value="A" id="radio801" />
                                                        A、围绕中心、服务大局</td>
                                                    <td width="180">
                                                        <input type="checkbox" runat="server" name="radio8" value="B" id="radio802" />
                                                        B、创建为民、创建利民</td>
                                                    <td width="180">
                                                        <input type="checkbox" runat="server" name="radio8" value="C" id="radio803" />
                                                        C、立足实际、开拓创新</td>
                                                    <td width="180">
                                                        <input type="checkbox" runat="server" name="radio8" value="D" id="radio804" />
                                                        D、发挥群众主体作用、夯实基层基础</td>
                                                    <td width="180" height="30">
                                                        <input type="checkbox" runat="server" name="radio8" value="E" id="radio805" />
                                                        E、重在日常、经常、平常</td>
                                                     <td width="180" height="30">
                                                        <input type="checkbox" runat="server" name="radio8" value="F" id="radio806" />
                                                       F、其他</td>
                                                     
                                                </tr>
                                            </table>
                                        </li>

                                         <li>
                                            <table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td colspan="5" class="f14 Txt_cu">9、您认为群众性精神文明创建活动应该坚持的原则有哪些？（多选）</td>
                                                </tr>
                                                <tr>
                                                    <td width="180" height="50">
                                                        <input type="checkbox" runat="server" name="radio9" value="A" id="radio901" />
                                                        A、工作理念还需要进一步创新</td>
                                                    <td width="180">
                                                        <input type="checkbox" runat="server" name="radio9" value="B" id="radio902" />
                                                        B、工作内容还需要进一步深化</td>
                                                    <td width="180">
                                                        <input type="checkbox" runat="server" name="radio9" value="C" id="radio903" />
                                                        C、工作形式还需要进一步活化</td>
                                                    <td width="180">
                                                        <input type="checkbox" runat="server" name="radio9" value="D" id="radio904" />
                                                        D、工作领域还需要进一步拓展</td>
                                                    <td width="180" height="30">
                                                        <input type="checkbox" runat="server" name="radio9" value="E" id="radio905" />
                                                        E、工作机制还需要进一步完善</td>
                                                     <td width="180" height="30">
                                                        <input type="checkbox" runat="server" name="radio9" value="F" id="radio906" />
                                                       F、其他</td>
                                                     
                                                </tr>
                                            </table>
                                        </li>
                                         <li>
                                            <table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td colspan="5" class="f14 Txt_cu">10、您认为群众性精神文明创建活动需要从哪些方面进行创新？（多选）</td>
                                                </tr>
                                                <tr>
                                                    <td width="180" height="50">
                                                        <input type="checkbox" runat="server" name="radio10" value="A" id="radio1001" />
                                                        A、创新理念</td>
                                                    <td width="180">
                                                        <input type="checkbox" runat="server" name="radio10" value="B" id="radio1002" />
                                                        B、创新载体</td>
                                                    <td width="180">
                                                        <input type="checkbox" runat="server" name="radio10" value="C" id="radio1003" />
                                                        C、创新内容</td>
                                                    <td width="180">
                                                        <input type="checkbox" runat="server" name="radio10" value="D" id="radio1004" />
                                                        D、创新领域</td>
                                                    <td width="180" height="30">
                                                        <input type="checkbox" runat="server" name="radio10" value="E" id="radio1005" />
                                                        E、创新管理</td>
                                                     <td width="180" height="30">
                                                        <input type="checkbox" runat="server" name="radio10" value="F" id="radio1006" />
                                                       F、其他</td>
                                                     
                                                </tr>
                                            </table>
                                        </li>
                                        <li>
                                            <table  width="900" border="0" align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td colspan="5" class="f14 Txt_cu">
                                                        11、您对群众性精神文明创建活动还有哪些好的意见建议？<br />
                                                       
                                                       <asp:TextBox ID="jianyi" runat="server" TextMode="MultiLine" MaxLength="500" Rows="10" Columns="50"></asp:TextBox>
                                                        </td>
                                                </tr>
                                            </table>
                                        </li>

                                    </ul>
                                </div>
                                <div class="con-btn">
                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" OnClientClick="return checkNull();"><img src="images/btn.jpg" width="141" height="81" /></asp:LinkButton>
                                </div>
                            </div>
                            <div class="footer">
                                <table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="center">版权所有：东北网</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <style>
                            .hii { display: none; }
                        </style>
                        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" CssClass="hii" />
                        <div class="main">
                            <div class="header"></div>
                            <div class="con">
                                <div class="con-from">
                                    <table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="f14 Txt_cu" align="center">正在加载试题</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <script type="text/javascript">
                            window.onload = function () { $("#Button1").click(); };
                        </script>
                    </asp:View>
                </asp:MultiView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
