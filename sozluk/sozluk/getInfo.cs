using sozluk.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;

namespace sozluk
{
    public class getInfo
    {
        private static object a;
        private static object dc;

        public static object Kelimes { get; private set; }

        public static string getAnlamEngtoTurk(string kelime)
        {
            string anlam1 = "";
            using (linqsozlukDataContext dc = new linqsozlukDataContext())
            {

                var anl = (from k in dc.Kelimelers
                           join m in dc.kelime_anlam_matriksis on k.id equals m.kelime_id
                           join a in dc.KelimeAnlamis on m.kelimeAnlami_id equals a.id
                           where k.KelimeAdi.ToUpper().Equals(kelime.ToUpper())
                           select a).ToList();
                foreach (var x in anl)
                {

                    string anlam;
                    anlam = x.KelimeAnlami1.ToString();
                    anlam1 = anlam1 + anlam + " , ";
                }
                return anlam1;

            }

        }
        public static string getAnlamTurktoEng(string kelime)
        {
            string anlam2 = "";
            using (linqsozlukDataContext dc = new linqsozlukDataContext())
            {

                var anl = (from a in dc.KelimeAnlamis
                           join m in dc.kelime_anlam_matriksis on a.id equals m.kelimeAnlami_id
                           join k in dc.Kelimelers on m.kelime_id equals k.id
                           where a.KelimeAnlami1.ToUpper().Contains(kelime.ToUpper())
                           select k).ToList();
                           
               
                foreach (var x in anl)
                {

                    string anlam;
                    anlam = x.KelimeAdi.ToString();
                    anlam2 = anlam2+ anlam + " , ";
                }
                return anlam2;

            }
        }
     //   public static void tablo(string veriler)
     //   {
     //       var tablo =
     //from a in Kelime
     //where a.Dili == "Türkçe" 
     //select a; 

     //       foreach (var kelime in tablo)
     //       {
     //           Console.WriteLine(a.Kelime + ", " + a.id);
     //       }



     //       SqlConnection baglanti;
     //       SqlCommand komut;
     //       SqlDataAdapter d;

       
 

     //   }
        
    }
}