using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Homework
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            clientDetailsView.DataBind();
        }

        protected void loginBT_Click(object sender, EventArgs e)
        {
            clientDetailsView.Visible = false;
            entry.Visible = false;
            if(1 == clientDetailsView.DataItemCount) //如果有抓到剛好一筆資料
            {
                //儲存工作階段狀態
                Session["name"] = clientDetailsView.Rows[0].Cells[0].Text;
                Session["money"] = clientDetailsView.Rows[1].Cells[0].Text;
                //後啟用商店
                entry.Visible = true;
            }
            else //沒有抓到資料或是抓到兩筆以上時
            {
                //將工作狀態設成NULL
                Session["name"] = null;
                Session["money"] = null;
                //將DetailView顯示
                clientDetailsView.Visible = true;
            }
        }
    }
}