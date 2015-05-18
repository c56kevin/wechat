using System;
using System.Configuration;
using System.Collections.Generic;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;



namespace OftenClass
{
    public static class _OftenClass
    {
        
        /// <summary>
        /// 添加脚本
        /// </summary>
        /// <param name="pa">页面实例</param>
        /// <param name="a">脚本内容</param>
        public static void PlayJS(Page pa, string a)
        {
            ScriptManager.RegisterStartupScript(pa, pa.GetType(), "_error", a, true);
        }

        public static bool CheckNull(Page pa, string content, string name)
        {
            bool b = true;
            if (content.Equals(""))
            {
                Alert(pa,"请填写"+name + "!");
                b = false;
            }
            return b;
        }
        /// <summary>
        /// 验证邮箱格式
        /// </summary>
        /// <param name="email">需要验证的字符串</param>
        /// <returns>是否合格</returns>
        public static bool CheckEmail(string email)
        {
            Regex re = new Regex("\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*");
            if (!re.IsMatch(email))
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        /// <summary>
        /// 弹出提示
        /// </summary>
        /// <param name="a">要提示的内容</param> 
        /// <param name="pa">页面实例</param>
        public static void Alert(Page pa, string a)
        {
            ScriptManager.RegisterStartupScript(pa, pa.GetType(), "_error", "alert('" + a + "');", true);
        }
        /// <summary>
        /// 弹出确认框(url1选是，url2选否)
        /// </summary>
        /// <param name="a">要提示的内容</param>
        /// <param name="url1">选是跳转到的页面</param>
        /// <param name="url2">选否跳转到的页面</param>
        /// <param name="pa">页面实例</param>
        public static void Confirm(Page pa, string a, string url1, string url2)
        {
            string Content = a.ToString();
            ScriptManager.RegisterStartupScript(pa, pa.GetType(), "_error", "if(confirm(\"" + Content + "\")) { window.location.href = \"" + url1 + "\" } else { window.location.href =\"" + url2 + "\"}", true);

        }
        /// <summary>
        /// 过滤换行和回车
        /// </summary>
        /// <param name="content">要过滤的内容</param>
        /// <returns>过滤后的内容</returns>       
        public static string Chr(string content)
        {
            return content.Replace("<", "&lt;").Replace(">", "&gt;").Replace("VbCrLf", "<br>").Replace("vblf", "<br>").Replace("\f", "<br>").Replace("\r\n", "<br>").Replace("<br><br>", "<br>").Replace("&quot;", "'").Replace(" ", "&nbsp;&nbsp;");
        }
        public static string RelaceScript(string content)
        {
            if (string.IsNullOrEmpty(content))
                return content;

            string pattern = @"<script[\s\S]+</script*>";

            Regex reg = new Regex(pattern, System.Text.RegularExpressions.RegexOptions.IgnoreCase);
            Match m = reg.Match(content);
            while (m.Success)
            {
                content = content.Replace(m.Value, "");
                m = reg.Match(content);
            }
            return content;
        }
        /// <summary>
        /// 还原换行和回车
        /// </summary>
        /// <param name="content">要还原的内容</param>
        /// <returns>还原后的内容</returns>
        public static string Chrb(string content)
        {
            if (content.Equals(""))
            {
                return "";
            }
            else
            {
                return content.Replace("<br>", "\r\n").Replace("<br />", "\r\n").Replace("'", "&quot;").Replace("&nbsp;&nbsp;", " ").Replace("&gt;", ">").Replace("&lt;", "<");
            }
        }

        /// <summary>
        /// 关闭弹出窗口
        /// </summary>
        /// <param name="pa">页面实例</param>
        public static void WinClose(Page pa)
        {
            ScriptManager.RegisterStartupScript(pa, pa.GetType(), "_error", "window.close();", true);
        }

        /// <summary>
        /// 跳转页
        /// </summary>
        /// <param name="pa">页面实例</param>
        /// <param name="content">要跳转的Url</param>
        public static void Go(Page pa, string url1)
        {
            ScriptManager.RegisterStartupScript(pa, pa.GetType(), "_error", "window.location.href = \"" + url1 + "\";", true);
        }
        /// <summary>
        /// 跳转页
        /// </summary>
        /// <param name="pa">页面实例</param>
        /// <param name="a">要跳转的提示内容</param>
        /// <param name="content">要跳转的Url</param>
        public static void Go1(Page pa, string a, string url1)
        {
            ScriptManager.RegisterStartupScript(pa, pa.GetType(), "_error", "alert('" + a + "');window.location.href = \"" + url1 + "\";", true);
        }
        /// <summary>
        /// 换长字符串为...
        /// </summary>
        /// <param name="content">要替换的内容</param>
        /// <param name="length1">保留长度（不含...）</param>
        /// <returns>替换后的内容</returns>
        public static string ChangeLength(string content, int length1)
        {
            if (content.Length > length1)
            {
                content = content.Substring(0, (length1 - 1)) + "...";
            }
            return content;
        }

        /// <summary>
        /// 返回ListItemCollection选择值结果
        /// </summary>
        /// <param name="it">控件的ListItemCollection</param>
        /// <returns>选择值的int[]结果</returns>
        public static int[] GetListItemCheckedInt(ListItemCollection li)
        {
            List<int> list = new List<int>();
            for (int i = 0; i < li.Count; i++)
            {
                if (li[i].Selected == true)
                {
                    list.Add(int.Parse(li[i].Value));
                }
            }
            int[] cc = list.ToArray();
            list.Clear();
            return cc;
        }
        
        /// <summary>
        /// 返回ListItemCollection选择值结果
        /// </summary>
        /// <param name="it">控件的ListItemCollection</param>
        /// <returns>选择ListItem的text的string[]结果</returns>
        public static string[] GetListItemCheckedString(ListItemCollection li)
        {
            List<string> list = new List<string>();
            for (int i = 0; i < li.Count; i++)
            {
                if (li[i].Selected == true)
                {
                    list.Add(li[i].Text);
                }
            }
            string[] cc = list.ToArray();
            list.Clear();
            return cc;
        }
        /// <summary>
        /// 返回ListItemCollection选择值结果
        /// </summary>
        /// <param name="it">控件的ListItemCollection</param>
        /// <param name="type">为"string"选择ListItem的text,为"int"选择ListItem的value</param>
        /// <returns>选择的结果（用','分隔）</returns>
        public static string GetListItemCheckedText(ListItemCollection Items, string type)
        {
            string value = "";
            for (int i = 0; i < Items.Count; i++)
            {
                if (Items[i].Selected == true)
                {
                    switch (type)
                    {
                        case "string":
                            value += Items[i].Text + ",";
                            break;
                        case "int":
                            value += Items[i].Value + ",";
                            break;
                    }

                }
            }
            return value;
        }
        /// <summary>
        /// 设置ListItemCollection项的选择
        /// </summary>
        /// <param name="it">控件的ListItemCollection</param>
        /// <param name="values">判断选择项值或文本集合</param>
        /// <param name="type">"string"ListItem.text/"int"ListItem.value</param>

        public static void SetListItemChecked(ListItemCollection Items, object[] values, string type)
        {
            for (int j = 0; j < values.Length; j++)
            {
                for (int i = 0; i < Items.Count; i++)
                {
                    switch (type)
                    {
                        case "string":
                            if (Items[i].Text == values[j].ToString())
                            {
                                Items[i].Selected = true;
                            }
                            break;
                        case "int":
                            if (Items[i].Value == values[j].ToString())
                            {
                                Items[i].Selected = true;
                            }
                            break;
                        default:
                            break;
                    }
                }
            }
        }
        /// <summary>
        /// 去除文本末尾的","
        /// </summary>
        /// <param name="value">要去掉","的文本</param>
        /// <returns>去掉后的文本</returns>
        public static string Deld(string value)
        {
            if (value.Length > 0)
            {
                if (value.Substring(value.Length - 1, 1) == ",")
                {
                    value = value.Substring(0, value.Length - 1);
                }
            }
            return value;

        }

    }

    public static class _CookiesClass
    {
        //region 操作cookies的方法 1.设置cookies; 2.获取cookies; 3.删除cooies; 4.设置cookies到期日
        /// <summary>
        /// 设置Cookies
        /// </summary>
        /// <param name="cookiesName">cookies名称</param>
        /// <param name="key">cookies项的名称</param>
        /// <param name="value">cookies项的值</param>
        /// <param name="days">到期日,多少天后cookies到期</param>
        public static void SetCookies(string cookiesName, string key, string value, int days)
        {
            //获取cookies
            HttpCookie isCookies = System.Web.HttpContext.Current.Request.Cookies[cookiesName];
            //判断cookies是否存在
            if (isCookies != null)
            {
                //项是否存在
                if (isCookies.Values.Get(key) != null)
                {//存在的话删除后再添加
                    isCookies.Values.Remove(key);//删除项
                    isCookies.Values.Add(key, value);//添加项
                }
                else
                {//不存在直接添加项
                    isCookies.Values.Add(key, value);
                }
                System.Web.HttpContext.Current.Response.AppendCookie(isCookies);//确定写入cookie中
            }
            else//不存在则创建cookies
            {
                HttpCookie cookies = new HttpCookie(cookiesName);//创建cookies
                cookies.Expires = DateTime.Now.AddDays(days);//设置到期日
                cookies.Values.Add(key, value);//添加项到cookies中
                System.Web.HttpContext.Current.Response.AppendCookie(cookies);//确定写入cookie中
            }
        }

        /// <summary>
        /// 获取Cookies
        /// </summary>
        /// <param name="cookiesName">cookies名称</param>
        /// <param name="key">项名称</param>
        /// <returns></returns>
        public static string GetCookies(string cookiesName, string key)
        {
            HttpCookie isCookies = System.Web.HttpContext.Current.Request.Cookies[cookiesName];
            if (isCookies != null)
            {
                return isCookies.Values.Get(key);
            }
            else
            {
                return "";
            }
        }

        /// <summary>
        /// 删除Cookies,如key为空,则删除整个cookies,否则删除key子键
        /// </summary>
        /// <param name="cookiesName">cookies名称</param>
        /// <param name="key">项名称,如为空则删除整个cookies</param>
        public static void DeleteCookies(string cookiesName, string key)
        {
            HttpCookie isCookies = System.Web.HttpContext.Current.Request.Cookies[cookiesName];
            if (isCookies != null)
            {
                if (key.Trim() == "" || key == null)
                {
                    isCookies.Values.Clear();
                }
                else
                {
                    isCookies.Values.Remove(key);
                }
                System.Web.HttpContext.Current.Response.AppendCookie(isCookies);
            }
        }

        /// <summary>
        /// 设置Cookies到期日
        /// </summary>
        /// <param name="cookiesName">cookies名称</param>
        /// <param name="days">到期日,多少天后cookies到期</param>
        public static void SetExpires(string cookiesName, int days)
        {
            HttpCookie isCookies = System.Web.HttpContext.Current.Request.Cookies[cookiesName];
            if (isCookies != null)
            {
                isCookies.Expires = DateTime.Now.AddDays(days);
                System.Web.HttpContext.Current.Response.AppendCookie(isCookies);
            }
        }
    }
    /// <summary>
    /// 对称算法加解密
    /// 2009/03/20 CuiXiaohan
    /// </summary>
    public static class _EncryptAndDecrypt
    {
        /// <summary>
        /// 解密
        /// </summary>
        /// <param name="LogText">解密字符</param>
        /// <returns></returns>
        public static string Decrypt(string LogText)
        {
            return Decrypt(LogText, "InternetKnowledgeContest");
        }

        /// <summary>
        /// 解密
        /// </summary>
        /// <param name="LogText">解密字符</param>
        /// <param name="sKey">密钥</param>
        /// <returns></returns>
        public static string Decrypt(string Text, string sKey)
        {
            DESCryptoServiceProvider provider1 = new DESCryptoServiceProvider();
            int num1 = Text.Length / 2;
            byte[] buffer1 = new byte[num1];
            for (int num2 = 0; num2 < num1; num2++)
            {
                int num3 = Convert.ToInt32(Text.Substring(num2 * 2, 2), 0x10);
                buffer1[num2] = (byte)num3;
            }
            provider1.Key = Encoding.ASCII.GetBytes(FormsAuthentication.HashPasswordForStoringInConfigFile(sKey, "md5").Substring(0, 8));
            provider1.IV = Encoding.ASCII.GetBytes(FormsAuthentication.HashPasswordForStoringInConfigFile(sKey, "md5").Substring(0, 8));
            MemoryStream stream1 = new MemoryStream();
            CryptoStream stream2 = new CryptoStream(stream1, provider1.CreateDecryptor(), CryptoStreamMode.Write);
            stream2.Write(buffer1, 0, buffer1.Length);
            stream2.FlushFinalBlock();
            return Encoding.Default.GetString(stream1.ToArray());
        }

        /// <summary>
        /// 加密
        /// </summary>
        /// <param name="Text">加密字符</param>
        /// <returns></returns>
        public static string Encrypt(string Text)
        {
            return Encrypt(Text, "InternetKnowledgeContest");
        }

        /// <summary>
        /// 加密
        /// </summary>
        /// <param name="Text">加密字符</param>
        /// <param name="sKey">密钥</param>
        /// <returns></returns>
        public static string Encrypt(string Text, string sKey)
        {
            DESCryptoServiceProvider provider1 = new DESCryptoServiceProvider();
            byte[] buffer1 = Encoding.Default.GetBytes(Text);
            provider1.Key = Encoding.ASCII.GetBytes(FormsAuthentication.HashPasswordForStoringInConfigFile(sKey, "md5").Substring(0, 8));
            provider1.IV = Encoding.ASCII.GetBytes(FormsAuthentication.HashPasswordForStoringInConfigFile(sKey, "md5").Substring(0, 8));
            MemoryStream stream1 = new MemoryStream();
            CryptoStream stream2 = new CryptoStream(stream1, provider1.CreateEncryptor(), CryptoStreamMode.Write);
            stream2.Write(buffer1, 0, buffer1.Length);
            stream2.FlushFinalBlock();
            StringBuilder builder1 = new StringBuilder();
            foreach (byte num1 in stream1.ToArray())
            {
                builder1.AppendFormat("{0:X2}", num1);
            }
            return builder1.ToString();
        }
    }
    public class quti
    {
        public int qid { get; set; }
        public string question { get; set; }
        public string qt { get; set; }
    }
}
