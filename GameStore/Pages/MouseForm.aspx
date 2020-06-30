<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MouseForm.aspx.cs" Inherits="GameStore.Pages.MouseForm" MasterPageFile="~/Pages/Store.Master" %>

<asp:Content ContentPlaceHolderID="bodyContent" runat="server">
    <div id="content">
        <%
            foreach (GameStore.Models.Mouse mouse in GetMouses())
            {
                Response.Write(String.Format(@"
                            <div class='item'>
                                <h3>{0}</h3>
                                {1}
                                <h4>{2:c}</h4>
                            </div>                    
                    ", mouse.Name, mouse.Description, mouse.Price));
            }
        %>
    </div>
    <div class="pager">
        <%
            for (int i = 1; i < MaxPage + 1; i++)
            {
                Response.Write(String.Format("<a href='/Pages/MouseForm.aspx?page={0}' {1}>{2}</a>",
                    i, i == CurrentPage ? "class='selected'" : "", i));
            }
        %>
    </div>
</asp:Content>