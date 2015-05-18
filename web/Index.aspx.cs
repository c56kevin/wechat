using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OftenClass;
namespace web
{
    public partial class Index : System.Web.UI.Page
    {
        private Models.DataClasses1DataContext db = new Models.DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            DropDownList1.DataTextField = "name";
            DropDownList1.DataValueField = "id";
            DropDownList1.DataSource = db.diqu_chengShi.OrderBy(o => o.id);
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("请选择", "-1"));
            BindQu(-1);
        }
        private void BindQu(int shi)
        {
            DropDownList2.DataTextField = "name";
            DropDownList2.DataValueField = "id";
            DropDownList2.DataSource = db.diqu_quXian.Where(o => o.chengShi_id == shi).OrderBy(o => o.id);
            DropDownList2.DataBind();
            DropDownList2.Items.Insert(0, new ListItem("请选择", "-1"));
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string shi = DropDownList1.SelectedItem.Text;
            if (DropDownList1.SelectedValue.Equals("-1"))
            {
                _OftenClass.Alert(this, "请选择市（地）！");
                return;
            }
            string xian = DropDownList2.SelectedItem.Text;
            if (DropDownList2.SelectedValue.Equals("-1"))
            {
                _OftenClass.Alert(this, "请选择县（市、区）！");
                return;
            }
            string zhen = TextBox1.Text.Trim();
            if (zhen.Equals(""))
            {
                _OftenClass.Alert(this, "请填写镇！");
                return;
            }
            string cun = TextBox2.Text.Trim();
            if (cun.Equals(""))
            {
                _OftenClass.Alert(this, "请填写村！");
                return;
            }
            string zw = zhiwu.Text.Trim();
            if (zw.Equals(""))
            {
                _OftenClass.Alert(this, "请填写职务！");
                return;
            }
            string yj = jianyi.Text.Trim();
            if (yj.Equals(""))
            {
                _OftenClass.Alert(this, "请填写建议！");
                return;
            }
            if (yj.Length > 500)
            {
                _OftenClass.Alert(this, "建议限制在500字以内！");
                return;
            }
          
         
            string v1 = "";
            for (int i = 1; i <=2; i++)
            {
                string v = (Request.Form["radio" + i] + "").Replace(",", "");
                if (v == "")
                {
                    _OftenClass.Alert(this, string.Format("请选择第{0}个问题！", i));
                    return;
                }
                v1 += v + ",";
            }
            for (int i = 3; i <= 10; i++)
            {
                string v = "";
                bool b = false;
                for (int j = 1; j <= 9; j++)
                {
                    v = (Request.Form["radio" + i + "0" + j] + "").Replace(",", "");
                    if (v != "")
                        b = true;
                    v1 += v;
                }
                if (!b)
                {
                    _OftenClass.Alert(this, string.Format("请选择第{0}个问题！", i));
                    return;
                }
                v1 += ",";
            }
            v1 = _OftenClass.Deld(v1);
            var al = new Models.AnsLog_2015
            {
                Ans = v1,
                AddTime = DateTime.Now,
                cun = cun,
                zhiwu=zw,
                Ip = Request.UserHostAddress,
                shi = shi,
                xian = xian,
                zhen = zhen,
                jianyi=yj
            };
            db.AnsLog_2015.InsertOnSubmit(al);
            db.SubmitChanges();
            //MultiView1.ActiveViewIndex = 1;
            _OftenClass.Go1(this, "提交成功，感谢参与！", this.Request.RawUrl);
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindQu(Convert.ToInt32(DropDownList1.SelectedValue));
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }
    }
}