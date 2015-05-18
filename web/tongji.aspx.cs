using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace web
{
    public partial class tongji : System.Web.UI.Page
    {
        private Models.DataClasses1DataContext db = new Models.DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            var jieguo = db.AnsLog_2015.Select(t => t.Ans);
            for (int i = 1; i < 11; i++)//一共12题
            {
                int A = 0, B = 0, C = 0,D=0,E=0,F=0,G=0,H=0,I=0;
                foreach (var l in jieguo)
                {
                    string s1 = l.Split(',')[i-1];
                    if (s1.Contains("A"))
                        A++;
                    if (s1 == "B")
                        B++;
                    if (s1 == "C")
                        C++;
                    if (s1 == "D")
                        D++;
                    if (s1 == "E")
                        E++;
                    if (s1 == "F")
                        F++;
                    if (s1 == "G")
                       G++;
                    if (s1 == "H")
                        H++;
                    if (s1 == "I")
                        I++;
                }
                if (i == 1)
                {
                    lb1_1.Text = A.ToString();
                    lb1_2.Text = B.ToString();
                    lb1_3.Text = C.ToString();
                }
                if (i == 2)
                {
 
                }
            }
        }
    }
}