using sozluk.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sozluk
{
    public partial class users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
             
                if (Session["userinfo"] != null)
                {
                    getUserInfo();
                }
                else
                {
                    Response.Redirect("~/login.aspx");
                }

            }
        
        }
        linqsozlukDataContext dc = new linqsozlukDataContext();
        string LiteralString = "";
        public void getUserInfo()
        {
            var user = (from k in dc.Kullanicilars
                        where k.isDeleted.Equals(false)
                        select k).ToList();
            LiteralString = "";

            string aktif;
            foreach (var e in user)
            {
                LiteralString += "<tr>";
                LiteralString += "<td>" + e.adi.ToString() + "</td>";
                LiteralString += "<td>" + e.soyadi.ToString() + "</td>";
                LiteralString += "<td>" + e.eposta.ToString() + "</td>";
                LiteralString += "<td>" + e.sifre.ToString() + "</td>";
                if (Convert.ToBoolean(e.isActive == true))
                {
                    aktif = "Aktif";
                }
                else
                {
                    aktif = "Pasif";
                }
                LiteralString += "<td>" + aktif + "</td>";
                LiteralString += " </tr>";
            }
            ltrUserInfo.Text = LiteralString;


            //< td > Misc </ td >
            //     < td > PSP browser </ td >
            //        < td > PSP </ td >
            //        < td > -</ td >
            //        < td > C </ td >

        }

     

        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            //if (txtAd.Text = ""  txtSoyad.Text = "" || txtEposta.Text = "" || txtSifre.Text = "")
            if (txtAd.Text == "" || txtSoyad.Text== "" || txtEposta.Text == "" || txtSifre.Text == "")
            {
                litMsg.Text = "Lütfen Tüm Alanları Doldurunuz...";
            }
            else
            {
                string adi, soyadi, eposta, sifre;
                bool aktifMi;
                adi = txtAd.Text.ToString();
                soyadi = txtSoyad.Text.ToString();
                eposta = txtEposta.Text.ToString();
                sifre = txtSifre.Text.ToString();
                aktifMi = chkActive.Checked;

                Kullanicilar user = new Kullanicilar();
                user.adi = adi;
                user.soyadi = soyadi;
                user.eposta = eposta;
                user.sifre = sifre;
                user.isActive = aktifMi;
                user.isDeleted = false;
                AddNewUser(user);
                KayitAlanTemizle();
                getUserInfo();
                litMsg.Text = "Kayit Basarili";
            }

        }
        public void AddNewUser(Kullanicilar user)
        {
            using (linqsozlukDataContext dC = new linqsozlukDataContext())
            {
                dC.Kullanicilars.InsertOnSubmit(user);
                dC.SubmitChanges();

            }
        }
        public void KayitAlanTemizle()
        {
            txtAd.Text = txtSoyad.Text = txtEposta.Text = txtSifre.Text = "";
        }
    }
}