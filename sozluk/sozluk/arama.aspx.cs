using sozluk.Linq;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sozluk
{
    public partial class arama : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        

        }

        protected void btnAra_Click(object sender, EventArgs e)
        {

            // txtkelime.Text = "go";
            //Lblanlam.Text = "gelmek";
            string kelime = txtkelime.Text.ToString().Trim();
            string anlam="";
            anlam = getInfo.getAnlamEngtoTurk(kelime);
            if (anlam=="")
            {
                anlam = getInfo.getAnlamTurktoEng(kelime);
                if(anlam == "")
                {
                    Lblanlam.Text =  " " + " Aradığınız Kelime Bulunmadı.";
                }
                else
                {
                    Lblanlam.Text = anlam;
                    lblBaslik.Text = "Turkish-English Dictionary";

                }
            }
            else
            {
                Lblanlam.Text = anlam;
                lblBaslik.Text = "İngilizce-Türkçe Sözlük";





            }
            
            
        }
        //public static void getAnlam()
        
       
     

    }
}