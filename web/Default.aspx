<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="web._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
            <asp:View runat="server">
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
                        for (var i = 1; i < 28; i++) {
                            var aa = "";
                            var a = $(":radio[name='radio" + i + "']:checked")
                            if (a.length == 0) {
                                alert("请回答单选" + i  + "题！");
                                $(":radio[name='radio" + i + "']").focus();
                                return false;
                            }
                        }
                        for (var i = 28; i < 35; i++) {
                            var isCheck = false;
                                for (var j = 1; j < 6; j++) {
                                    var a = $("#radio"+i+"0"+j);
                                    if (a && a.attr("checked")) {
                                        isCheck = true;
                                        break;
                                    }
                                }
                            if (isCheck == false) {
                                alert("请回答多选第" + i + "题！");
                                $("#radio"+i+"01").focus();
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
<div class="header"></div>
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
</table>
</div>
<div class="con-li">
<ul>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">1、您的性别是?</td>
    </tr>
  <tr>
    <td width="180" height="50"><input type="radio" runat="server" name="radio1" id="radio101" value="A" />
    A、男</td>
    <td width="180"><input type="radio" runat="server" name="radio1" id="radio102" value="B" />
    B、女</td>
    <td width="180">&nbsp;</td>
    <td width="180">&nbsp;</td>
    <td width="180" height="30">&nbsp;</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">2、您的年龄是?</td>
    </tr>
  <tr>
    <td width="180" height="50"><input type="radio" runat="server" name="radio2" id="radio201" value="A" />
    A、18岁以下</td>
    <td width="180"><input type="radio" runat="server" name="radio2" id="radio202" value="B" />
    B、18岁—35岁</td>
    <td width="180"><input type="radio" runat="server" name="radio2" id="radio203" value="C" /> C、36岁-65岁</td>
    <td width="180"><input type="radio" runat="server" name="radio2" id="radio204" value="D" /> D、65岁以上</td>
    <td width="180" height="30">&nbsp;</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">3、您的学历是?</td>
    </tr>
  <tr>
    <td width="180" height="50"><input type="radio" runat="server" name="radio3" id="radio301" value="A" />
    A、初中及以下</td>
    <td width="180"><input type="radio" runat="server" name="radio3" id="radio302" value="B" />
    B、高中、职高、中专或中技</td>
    <td width="180"><input type="radio" runat="server" name="radio3" id="radio303" value="C" /> C、大专</td>
    <td width="180"><input id="Radio1" type="radio" runat="server" name="radio3" value="D" /> D、大学本科</td>
    <td width="180" height="30"><input id="Radio2" type="radio" runat="server" name="radio3" value="E" /> E、研究生及以上</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">4、您对当前本地农村乡风民风满意吗？</td>
    </tr>
  <tr>
    <td width="180" height="50"><input id="Radio3" type="radio" runat="server" name="radio4" value="A" />
    A、满意</td>
    <td width="180"><input id="Radio4" type="radio" runat="server" name="radio4" value="B" />
    B、比较满意</td>
    <td width="180"><input id="Radio5" type="radio" runat="server" name="radio4" value="C" /> C、不满意</td>
    <td width="180">&nbsp;</td>
    <td width="180" height="30">&nbsp;</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">5、您对党在农村现行政策的落实状况满意吗？  </td>
    </tr>
  <tr>
    <td width="180" height="50"><input id="Radio6" type="radio" runat="server" name="radio5" value="A" />
    A、非常满意 </td>
    <td width="180"><input id="Radio7" type="radio" runat="server" name="radio5" value="B" />
    B、比较满意</td>
    <td width="180"><input id="Radio8" type="radio" runat="server" name="radio5" value="C" /> C、不够满意</td>
    <td width="180"><input id="Radio9" type="radio" runat="server" name="radio5" value="D" /> D、很不满意</td>
    <td width="180" height="30">&nbsp;</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">6、您对所在村的环境卫生满意吗？</td>
    </tr>
  <tr>
    <td width="180" height="50"><input id="Radio10" type="radio" runat="server" name="radio6" value="A" />
    A、满意</td>
    <td width="180"><input id="Radio11" type="radio" runat="server" name="radio6" value="B" />
    B、比较满意</td>
    <td width="180"><input id="Radio12" type="radio" runat="server" name="radio6" value="C" /> C、不满意</td>
    <td width="180">&nbsp;</td>
    <td width="180" height="30">&nbsp;</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">7、您对所在村的社会治安满意吗？ </td>
    </tr>
  <tr>
    <td width="180" height="50"><input id="Radio13" type="radio" runat="server" name="radio7" value="A" />
    A、满意</td>
    <td width="180"><input id="Radio14" type="radio" runat="server" name="radio7" value="B" />
    B、比较满意</td>
    <td width="180"><input id="Radio15" type="radio" runat="server" name="radio7" value="C" /> C、不满意</td>
    <td width="180">&nbsp;</td>
    <td width="180" height="30">&nbsp;</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">8、您认为农村秸秆应该如何处理？</td>
    </tr>
  <tr>
    <td width="180" height="50"><input id="Radio16" type="radio" runat="server" name="radio8" value="A" />
    A、焚烧</td>
    <td width="180"><input id="Radio17" type="radio" runat="server" name="radio8" value="B" />
    B、养畜</td>
    <td width="180"><input id="Radio18" type="radio" runat="server" name="radio8" value="C" /> C、能源化利用</td>
    <td width="180"><input id="Radio19" type="radio" runat="server" name="radio8" value="D" /> D、还田 </td>
    <td width="180" height="30">&nbsp;</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">9、您愿意接受的思想教育方式是什么？</td>
    </tr>
  <tr>
    <td width="180" height="50"><input id="Radio20" type="radio" runat="server" name="radio9" value="A" />
    A、听报告</td>
    <td width="180"><input id="Radio21" type="radio" runat="server" name="radio9" value="B" />
    B、讲身边故事</td>
    <td width="180"><input id="Radio22" type="radio" runat="server" name="radio9" value="C" /> C、看影片</td>
    <td width="180"><input id="Radio23" type="radio" runat="server" name="radio9" value="D" /> D、文明户评选</td>
    <td width="180" height="30"><input id="Radio24" type="radio" runat="server" name="radio9" value="E" /> E、其他</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">10、您所在村的干群关系如何？</td>
    </tr>
  <tr>
    <td width="180" height="50"><input id="Radio25" type="radio" runat="server" name="radio10" value="A" />
    A、很好</td>
    <td width="180"><input id="Radio26" type="radio" runat="server" name="radio10" value="B" />
    B、一般</td>
    <td width="180"><input id="Radio27" type="radio" runat="server" name="radio10" value="C" /> C、不好 </td>
    <td width="180">&nbsp;</td>
    <td width="180" height="30">&nbsp;</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">11、您是通过何种方式了解党的路线方针政策、国内外大事的？</td>
    </tr>
  <tr>
    <td width="180" height="50"><input id="Radio28" type="radio" runat="server" name="radio11" value="A" />
    A、电视 </td>
    <td width="180"><input id="Radio29" type="radio" runat="server" name="radio11" value="B" />
    B、报纸</td>
    <td width="180"><input id="Radio30" type="radio" runat="server" name="radio11" value="C" /> C、会议传达</td>
    <td width="180"><input id="Radio31" type="radio" runat="server" name="radio11" value="D" /> D、与人交谈</td>
    <td width="180" height="30"><input id="Radio32" type="radio" runat="server" name="radio11" value="E" /> E、网络</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">12、您村上有文化广场或综合文化站并经常开展活动吗？</td>
    </tr>
  <tr>
    <td width="180" height="50"><input id="Radio33" type="radio" runat="server" name="radio12" value="A" />
    A、有，经常开展</td>
    <td width="180"><input id="Radio34" type="radio" runat="server" name="radio12" value="B" />
    B、有，不经常开展</td>
    <td width="180"><input id="Radio35" type="radio" runat="server" name="radio12" value="C" /> C、没有</td>
    <td width="180">&nbsp;</td>
    <td width="180" height="30">&nbsp;</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">13、您村上有图书室并经常更换图书吗？</td>
    </tr>
  <tr>
    <td width="180" height="50"><input id="Radio36" type="radio" runat="server" name="radio13" value="A" />
    A、有，经常更换</td>
    <td width="180"><input id="Radio37" type="radio" runat="server" name="radio13" value="B" />
    B、有，不经常更换</td>
    <td width="180"><input id="Radio38" type="radio" runat="server" name="radio13" value="C" /> C、没有 </td>
    <td width="180">&nbsp;</td>
    <td width="180" height="30">&nbsp;</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="6" class="f14 Txt_cu">14、您农闲时会选择哪种生活方式？</td>
    </tr>
  <tr>
    <td width="180" height="50"><input id="Radio39" type="radio" runat="server" name="radio14" value="A" />
    A、学习手艺</td>
    <td width="180"><input id="Radio40" type="radio" runat="server" name="radio14" value="B" />
    B、外出务工</td>
    <td width="180"><input id="Radio41" type="radio" runat="server" name="radio14" value="C" /> C、打牌消磨时间</td>
    <td width="180"><input id="Radio42" type="radio" runat="server" name="radio14" value="D" /> D、参加文化活动</td>
    <td width="180" height="30"><input id="Radio43" type="radio" runat="server" name="radio14" value="E" /> E、参加体育健身活动</td>
    <td width="180" height="30"><input id="Radio44" type="radio" runat="server" name="radio14" value="F" /> F、其他</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">15、您愿意参加村里组织的义务劳动吗？</td>
    </tr>
  <tr>
    <td width="180" height="50"><input id="Radio45" type="radio" runat="server" name="radio15" value="A" />
    A、愿意</td>
    <td width="180"><input id="Radio46" type="radio" runat="server" name="radio15" value="B" />
    B、不愿意</td>
    <td width="180">&nbsp;</td>
    <td width="180">&nbsp;</td>
    <td width="180" height="30">&nbsp;</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3" class="f14 Txt_cu">16、您村里是否有信教人员和宗教活动? </td>
    </tr>
  <tr>
    <td width="220" height="50"><input id="Radio47" type="radio" runat="server" name="radio16" value="A" />
    A、有信教人员并有宗教活动</td>
    <td width="220"><input id="Radio48" type="radio" runat="server" name="radio16" value="B" />
    B、有个别信教人员，但没有宗教活动</td>
    <td width="220"><input id="Radio49" type="radio" runat="server" name="radio16" value="C" /> C、都没有</td>
  </tr>
</table>
</li><li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">17、您村里办一次喜事每户平均花多少钱（含住房）？</td>
    </tr>
  <tr>
    <td width="180" height="50"><input id="Radio50" type="radio" runat="server" name="radio17" value="A" />
    A、5万元以下</td>
    <td width="180"><input id="Radio51" type="radio" runat="server" name="radio17" value="B" />
    B、5万—10万元</td>
    <td width="180"><input id="Radio52" type="radio" runat="server" name="radio17" value="C" /> C、10万—20万元</td>
    <td width="180"><input id="Radio53" type="radio" runat="server" name="radio17" value="D" /> D、20万—30万元</td>
    <td width="180" height="30"><input id="Radio54" type="radio" runat="server" name="radio17" value="E" /> E、30万元以上</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">18、您村里办一次丧事每户平均花多少钱（含住房）？</td>
    </tr>
  <tr>
    <td width="180" height="50"><input id="Radio55" type="radio" runat="server" name="radio18" value="A" />
    A、5000元以下</td>
    <td width="180"><input id="Radio56" type="radio" runat="server" name="radio18" value="B" />
    B、5000—1万元</td>
    <td width="180"><input id="Radio57" type="radio" runat="server" name="radio18" value="C" /> C、1万—2万元</td>
    <td width="180"><input id="Radio58" type="radio" runat="server" name="radio18" value="D" /> D、2万—3万元</td>
    <td width="180" height="30"><input id="Radio59" type="radio" runat="server" name="radio18" value="E" /> E、3万元以上</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">19、您了解普通法律常识的渠道是什么？</td>
    </tr>
  <tr>
    <td width="180" height="50"><input id="Radio60" type="radio" runat="server" name="radio19" value="A" />
    A、村里组织的法律培训</td>
    <td width="180"><input id="Radio61" type="radio" runat="server" name="radio19" value="B" />
    B、阅读法律书籍</td>
    <td width="180"><input id="Radio62" type="radio" runat="server" name="radio19" value="C" /> C、看电视、听广播、上网等</td>
    <td width="180"><input id="Radio63" type="radio" runat="server" name="radio19" value="D" /> D、其他</td>
    <td width="180" height="30">&nbsp;</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">20、您村里是否有阅报栏、宣传栏、科普栏并能经常更换内容？</td>
    </tr>
  <tr>
    <td width="180" height="50"><input id="Radio64" type="radio" runat="server" name="radio20" value="A" />
    A、有，并能经常更换</td>
    <td width="180"><input id="Radio65" type="radio" runat="server" name="radio20" value="B" />
    B、有，但很少更换</td>
    <td width="180"><input id="Radio66" type="radio" runat="server" name="radio20" value="C" /> C、没有</td>
    <td width="180">&nbsp;</td>
    <td width="180" height="30">&nbsp;</td>
  </tr>
</table>
</li><li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">21、您了解本村村规民约的主要内容吗？</td>
    </tr>
  <tr>
    <td width="180" height="50"><input id="Radio67" type="radio" runat="server" name="radio21" value="A" />
    A、很清楚</td>
    <td width="180"><input id="Radio68" type="radio" runat="server" name="radio21" value="B" />
    B、了解</td>
    <td width="180"><input id="Radio69" type="radio" runat="server" name="radio21" value="C" /> C、不了解</td>
    <td width="180"><input id="Radio70" type="radio" runat="server" name="radio21" value="D" /> D、没有村规民约</td>
    <td width="180" height="30">&nbsp;</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">22、您村里有道德评议会、红白理事会、禁赌协会等群众自治组织并发挥作用吗？</td>
    </tr>
  <tr>
    <td width="180" height="50"><input id="Radio71" type="radio" runat="server" name="radio22" value="A" />
    A、有，能发挥作用</td>
    <td width="180"><input id="Radio72" type="radio" runat="server" name="radio22" value="B" />
    B、有，不大能发挥作用</td>
    <td width="180"><input id="Radio73" type="radio" runat="server" name="radio22" value="C" /> C、没有</td>
    <td width="180">&nbsp;</td>
    <td width="180" height="30">&nbsp;</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">23、您所在村的村务公开情况如何？</td>
    </tr>
  <tr>
    <td width="180" height="50"><input id="Radio74" type="radio" runat="server" name="radio23" value="A" />
    A、有宣传栏公示</td>
    <td width="180"><input id="Radio75" type="radio" runat="server" name="radio23" value="B" />
    B、基本公开</td>
    <td width="180"><input id="Radio76" type="radio" runat="server" name="radio23" value="C" /> C、不公开</td>
    <td width="180"><input id="Radio77" type="radio" runat="server" name="radio23" value="D" /> D、不知道</td>
    <td width="180" height="30">&nbsp;</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3" class="f14 Txt_cu">24、您认为封建迷信活动在农村影响如何？</td>
    </tr>
  <tr>
    <td width="220" height="50"><input id="Radio78" type="radio" runat="server" name="radio24" value="A" />
    A、没人相信</td>
    <td width="220"><input id="Radio79" type="radio" runat="server" name="radio24" value="B" />
    B、影响不大，只有很少一部分人相信</td>
    <td width="220"><input id="Radio80" type="radio" runat="server" name="radio24" value="C" /> C、泛滥成灾，绝大部分人相信</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">25、您觉得推进整村合并符合农民利益吗？</td>
    </tr>
  <tr>
    <td width="180" height="50"><input id="Radio81" type="radio" runat="server" name="radio25" value="A" />
    A、符合</td>
    <td width="180"><input id="Radio82" type="radio" runat="server" name="radio25" value="B" />
    B、不符合</td>
    <td width="180"><input id="Radio83" type="radio" runat="server" name="radio25" value="C" /> C、不知道</td>
    <td width="180">&nbsp;</td>
    <td width="180" height="30">&nbsp;</td>
  </tr>
</table>
</li><li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">26、您愿意参加农村合作社等组织吗？</td>
    </tr>
  <tr>
    <td width="180" height="50"><input id="Radio84" type="radio" runat="server" name="radio26" value="A" />
    A、愿意</td>
    <td width="180"><input id="Radio85" type="radio" runat="server" name="radio26" value="B" />
    B、不愿意</td>
    <td width="180">&nbsp;</td>
    <td width="180">&nbsp;</td>
    <td width="180" height="30">&nbsp;</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">27、您对所在地农村社区服务中心服务满意吗？</td>
    </tr>
  <tr>
    <td width="180" height="50"><input id="Radio86" type="radio" runat="server" name="radio27" value="A" />
    A、满意</td>
    <td width="180"><input id="Radio87" type="radio" runat="server" name="radio27" value="B" />
    B、不满意</td>
    <td width="180">&nbsp;</td>
    <td width="180">&nbsp;</td>
    <td width="180" height="30">&nbsp;</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">28、您最希望在城乡共建中城市送什么下乡？ （多选）</td>
    </tr>
  <tr>
    <td width="180" height="50">
        <input type="checkbox" runat="server" name="radio28" value="A" id="radio2801"/>
    A、文化 </td>
    <td width="180"><input type="checkbox" runat="server" name="radio28" value="B" id="radio2802"/>
    B、科技</td>
    <td width="180"><input type="checkbox" runat="server" name="radio28" value="C" id="radio2803"/> C、医疗</td>
    <td width="180"><input type="checkbox" runat="server" name="radio28" value="D" id="radio2804"/> D、教育</td>
    <td width="180" height="30"><input type="checkbox" runat="server" name="radio28" value="E" id="radio2805"/> E、其他</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">29、您认为外出务工农民家庭最关注的问题是什么? （多选）</td>
    </tr>
  <tr>
    <td width="180" height="50"><input type="checkbox" runat="server" name="radio29" value="A" id="radio2901"/>
    A、留守孩子的培养</td>
    <td width="180"><input type="checkbox" runat="server" name="radio29" value="B" id="radio2902"/>
    B、夫妻关系的和谐</td>
    <td width="180"><input type="checkbox" runat="server" name="radio29" value="C" id="radio2903"/> C、空巢老人的赡养</td>
    <td width="180">&nbsp;</td>
    <td width="180" height="30">&nbsp;</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">30、您认为外出务工农民在城里最需求的是什么? （多选）</td>
    </tr>
  <tr>
    <td width="180" height="50"><input type="checkbox" runat="server" name="radio30" value="A" id="radio3001"/>
    A、住房</td>
    <td width="180"><input type="checkbox" runat="server" name="radio30" value="B" id="radio3002"/>
    B、户口</td>
    <td width="180"><input type="checkbox" runat="server" name="radio30" value="C" id="radio3003"/> C、技能</td>
    <td width="180"><input type="checkbox" runat="server" name="radio30" value="D" id="radio3004"/> D、文化生活</td>
    <td width="180" height="30"><input type="checkbox" runat="server" name="radio30" value="E" id="radio3005"/> E、社会公共服务 </td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">31、您认为自己现在最需要学习的内容是？（多选）</td>
    </tr>
  <tr>
    <td width="180" height="50"><input type="checkbox" runat="server" name="radio31" value="A" id="radio3101"/>
    A、有关政策、法律</td>
    <td width="180"><input type="checkbox" runat="server" name="radio31" value="B" id="radio3102"/>
    B、农业科技知识和实用技术</td>
    <td width="180"><input type="checkbox" runat="server" name="radio31" value="C" id="radio3103"/> C、外出打工所需技能</td>
    <td width="180"><input type="checkbox" runat="server" name="radio31" value="D" id="radio3104"/> D、其他</td>
    <td width="180" height="30">&nbsp;</td>
  </tr>
</table>
</li><li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="4" class="f14 Txt_cu">32、您认为哪些乡贤文化需要大力弘扬？（多选）</td>
    </tr>
  <tr>
    <td width="220" height="50"><input type="checkbox" runat="server" name="radio32" value="A" id="radio3201"/>
    A、历代名贤积淀下来的思想观念和文化传统</td>
    <td width="180"><input type="checkbox" runat="server" name="radio32" value="B" id="radio3202"/>
    B、民间艺术</td>
    <td width="180"><input type="checkbox" runat="server" name="radio32" value="C" id="radio3203"/> C、乡土文化能人</td>
    <td width="180"><input type="checkbox" runat="server" name="radio32" value="D" id="radio3204"/> D、成功人士返乡支持农村建设</td>
  </tr>
</table>
</li>
<li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" class="f14 Txt_cu">33、您认为上级党委政府应从哪些方面进一步加大对农村发展的指导和支持？ （多选）</td>
    </tr>
  <tr>
    <td width="180" height="50"><input type="checkbox" runat="server" name="radio33" value="A" id="radio3301"/>
    A、加大资金投入力度</td>
    <td width="180"><input type="checkbox" runat="server" name="radio33" value="B" id="radio3302"/>
    B、民居改造规划</td>
    <td width="180"><input type="checkbox" runat="server" name="radio33" value="C" id="radio3303"/> C、道路、桥梁修建</td>
    <td width="180"><input type="checkbox" runat="server" name="radio33" value="D" id="radio3304"/> D、文化设施兴建</td>
    <td width="180" height="30"><input type="checkbox" runat="server" name="radio33" value="E" id="radio3305"/> E、河道河塘整治</td>
  </tr>
</table>
</li><li>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="3" class="f14 Txt_cu">34、您认为农村精神文明建设应从哪些方面加强？（多选）</td>
    </tr>
  <tr>
    <td width="220" height="50"><input type="checkbox" runat="server" name="radio34" value="A" id="radio3401" />
    A、整治脏乱差、改善村容村貌</td>
    <td width="220"><input type="checkbox" runat="server" name="radio34" value="B" id="radio3402" />
    B、治理环境污染、改善生态环境</td>
    <td width="220"><input type="checkbox" runat="server" name="radio34" value="C" id="radio3403" /> C、整治社会治安、治理黄赌毒</td>
  </tr>
    <tr>
    <td width="220"><input type="checkbox" runat="server" name="radio34" value="D" id="radio3404" /> D、繁荣农村文化、丰富文化生活</td>
    <td width="220" height="30"><input type="checkbox" runat="server" name="radio34" value="E" id="radio3405" /> E、整治封建迷信、反对大操大办</td>
    <td width="220">&nbsp;</td>
  </tr>
</table>
</li>
</ul>
</div>
<div class="con-btn">
    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" OnClientClick="return checkNull();"><img src="images/btn.jpg" width="141" height="81" /></asp:LinkButton></div>
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
            <asp:View runat="server">
                <style>
                    .hii {
                        display:none;
                    }
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
