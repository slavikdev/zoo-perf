using System;

namespace AspNet
{
    public class TimePage : System.Web.UI.Page
    {
        protected void Page_Load( Object sender, EventArgs e )
        {
            Response.Write( DateTime.Now.ToString() );
            Response.End();
        }
    }
}
