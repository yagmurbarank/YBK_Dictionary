using sozluk.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sozluk
{
    public partial class login : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        linqsozlukDataContext dc = new linqsozlukDataContext();
        private readonly object txtEmail2;
        private object txtPass2;
        private object lblError;
        private object divError;
        private object Text;
        protected void btnGiris_Click(object sender, EventArgs e)
        {
          
        string email, pass;
            email = txtEmail2.Text.Trim().ToString();
            pass = txtPass2.Text.Trim().ToString();
            var user = (from k in dc.Kullanicilars where k.eposta.Equals(email) && k.sifre.Equals(pass) &&k.isDeleted.Equals(false)&&k.isActive.Equals(true)
                       select k).ToList();
           
            if(user.Count != 0)
            {
                foreach (var a in user)
                {
                    Session["userinfo"] = a.adi + " " +a.soyadi;
                    Response.Redirect("~/default.aspx");
                }
               
            }
            else 
            {
                lblError.Text= "Kullanıcı Adı / Şifre Hatalı veya Yetkisiz Giris Denemesi";
                divError.Visible = true;
            }

        }
    }
}