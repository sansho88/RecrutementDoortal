using System;
using System.Web.Services;

namespace RecrutementDoortal
{
    public class Recrutement : System.Web.UI.Page
    {
        protected string Msg { get; set; } = "";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST")
            {
                string action = Request.Form["action"];
                if (action == "recruterAvecPlaisir")
                {
                    Msg = "Test du Post-Back réussi !";
                }
            }
        }

        [WebMethod]
        public static string CallTelamonsSon()
        {
            return "Test Ajax validé !\n";
        }
        
    }
}