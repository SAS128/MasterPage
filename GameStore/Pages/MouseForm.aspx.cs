using GameStore.Models;
using GameStore.Models.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
namespace GameStore.Pages
{
    public partial class MouseForm : System.Web.UI.Page
    {
        private Repository repository = new Repository();
        private int pageSize = 4;

        protected int MaxPage
        {
            get
            {
                return (int)Math.Ceiling((decimal)repository.Mouses.Count() / pageSize);
            }
        }

        protected int CurrentPage
        {
            get
            {
                int page;
                page = int.TryParse(Request.QueryString["page"], out page) ? page : 1;
                return page > MaxPage ? MaxPage : page;
            }
        }
        protected IEnumerable<Mouse> GetMouses()
        {
            return repository.Mouses.OrderBy(g => g.MouseId).Skip((CurrentPage - 1) * pageSize).Take(pageSize);
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}