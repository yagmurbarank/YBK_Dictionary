using sozluk.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sozluk
{
    public partial class kelimeler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs t)
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
       



        protected void btnGiris(object sender, EventArgs e)
        {

        }
        linqsozlukDataContext dc = new linqsozlukDataContext();
        string LiteralString = "";
        public void getUserInfo()
        {
            LiteralString = "";

            string aktif;
            var kelimelist = from k in dc.Kelimelers
                             join m in dc.kelime_anlam_matriksis on k.id equals m.kelime_id
                             join a in dc.KelimeAnlamis on m.kelimeAnlami_id equals a.id

                             select new
                             {
                                 id = k.id,
                                 kelime = k.KelimeAdi,
                                 anlam = a.KelimeAnlami1,
                                 dil = k.Dili,
                                 aktf = k.AktiflikDurumu,
                             };

          
            foreach (var t in kelimelist)
            {
                LiteralString += "<tr>";
                LiteralString += "<td>" + t.id.ToString() + "</td>";
                LiteralString += "<td>" + t.kelime.ToString() + "</td>";
                LiteralString += "<td>" + t.anlam.ToString() + "</td>";
                LiteralString += "<td>" + t.dil.ToString() + "</td>";
                LiteralString += "<td>" + t.aktf.ToString() + "</td>";
           
                LiteralString += " </tr>";
            }
            ltrUserInfo.Text = LiteralString;


            //< td > Misc </ td >
            //     < td > PSP browser </ td >
            //        < td > PSP </ td >
            //        < td > -</ td >
            //        < td > C </ td >

        }
        protected void lnkDelete_Click(object sender, EventArgs t)
        {
            //if (txtAd.Text = ""  txtSoyad.Text = "" || txtEposta.Text = "" || txtSifre.Text = "")
            //if (txtKelimeAdi.Text == "" || txtAnlami.Text == "" || txtSifre.Text == "")
            //{
            //    litMsg.Text = "Lutfen Tum Alanlari Doldurunuz...";
            //}
            //else
            //{
                string kelime,kelimeanlam,AktiflikDurumu,Dili;


            //id = txtId.Text.ToString();
            kelime = txtKelime.Text.ToString();
            kelimeanlam = txtKelimeAnlam.Text.Trim();
              
                Dili = ddlDil.SelectedItem.Text.ToString();
               
                if (chkActive.Checked)
                {
                AktiflikDurumu = "Aktif";
                    
                }
                else
                {
                AktiflikDurumu = "Pasif";
                }

            Kelimeler kelimelist = new Kelimeler();
            kelimelist.KelimeAdi = kelime;
            kelimelist.AktiflikDurumu = AktiflikDurumu;
            kelimelist.Dili = Dili;
            kelimelist.KayitTarihi = DateTime.Now;
            kelimelist.SilindiMi = false;

            AddNewWord(kelimelist);
           

            string anlamdil;
            KelimeAnlami anlamlist = new KelimeAnlami();
            anlamlist.KelimeAnlami1 = kelimeanlam;
            anlamlist.SilindiMi = false;
            anlamlist.KayitTarihi = DateTime.Now;
            anlamlist.AktiflikDurumu = AktiflikDurumu;
            if(Dili== "Türkçe")
            {
                anlamdil = "İngilizce";
            }
                else
            {
                anlamdil = "Türkçe";
            }
            anlamlist.Dili = anlamdil;
            AddNewWordMeaning(anlamlist);

            int kelimeID = kelimelist.id;
            int kelimeanlamID = anlamlist.id;


            kelime_anlam_matriksi matriks = new kelime_anlam_matriksi();
            matriks.kelime_id = kelimeID;
            matriks.kelimeAnlami_id = kelimeanlamID;
            AddNewWord_Meaning_Matriks(matriks);

            KayitAlanTemizle();
            getUserInfo();
            litMsg.Text = "Kayıt Başarılı";

        }

        public void AddNewWord (Kelimeler kelimelist)
        {
            using (linqsozlukDataContext dC = new linqsozlukDataContext())
            {
                dC.Kelimelers.InsertOnSubmit(kelimelist);
                dC.SubmitChanges();

            }
        }
        public void AddNewWordMeaning(KelimeAnlami anlamlist)
        {
            using (linqsozlukDataContext dC = new linqsozlukDataContext())
            {
                dC.KelimeAnlamis.InsertOnSubmit(anlamlist);
                dC.SubmitChanges();

            }
        }
        public void AddNewWord_Meaning_Matriks(kelime_anlam_matriksi matrikslist)
        {
            using (linqsozlukDataContext dC = new linqsozlukDataContext())
            {
                dC.kelime_anlam_matriksis.InsertOnSubmit(matrikslist);
                dC.SubmitChanges();

            }
        }
        public void KayitAlanTemizle()
        {
            txtKelime.Text = txtKelimeAnlam.Text ;
        }
    }
}