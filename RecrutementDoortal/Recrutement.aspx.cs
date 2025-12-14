using System;
using System.Web.Services;

namespace RecrutementDoortal
{
    public partial class Recrutement : System.Web.UI.Page
    {
        public string Msg { get; set; } = "";

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