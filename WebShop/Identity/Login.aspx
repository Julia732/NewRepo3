<%@ Page Title="" Language="C#" MasterPageFile="~/Identity/Identity.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebShop.Identity.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .text-white {}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <%-- <div class="container-fluid">

        <div class="col col-xl-10">
            
        <div class="card" style="border-radius: 18rem;">
         <div class="row g-0">
            
            <div class="col-md-6 col-lg-7 d-flex align-items-center">
              <div class="card-body p-4 p-lg-5 text-black">--%>
              
   <div class="mb-md-5 mt-md-4 pb-5">

         <h4 style="font-size: medium; line-height: normal; vertical-align: text-bottom; text-align: center; list-style-type: georgian;"><asp:Label ID="lblText" runat="server"></asp:Label></h4>
         <hr />
         <asp:PlaceHolder runat="server" ID="LoginStatus" Visible="false">
            <p>
               <asp:Literal runat="server" ID="StatusText" />
            </p>
         </asp:PlaceHolder>
         <asp:PlaceHolder runat="server" ID="LoginForm" Visible="false">
            <div style="margin-bottom: 10px">
               <asp:Label runat="server" AssociatedControlID="UserName">Введите логин</asp:Label>
               <div>
                  <asp:TextBox runat="server" ID="UserName" />
               </div>
            </div>
            <div style="margin-bottom: 10px">
               <asp:Label runat="server" AssociatedControlID="Password">Введите пароль</asp:Label>
               <div>
                  <asp:TextBox runat="server" ID="Password" TextMode="Password" />
               </div>
            </div>
            <div style="margin-bottom: 10px">
               <div>
                  <asp:Button ID="SignIn" runat="server" OnClick="SignIn_Click" Text="Вход" />
               </div>
                <span class="pl-3 text-info">Новый пользователь? <a href="Register.aspx" class="badge badge-info">Зарегистрироваться</a></span>
            </div>
         </asp:PlaceHolder>
         <asp:PlaceHolder runat="server" ID="LogoutButton" Visible="false">
            <div>
               <div>
                  <asp:Button ID="SignOut" runat="server" OnClick="SignOut_Click" Text="Выйти" CssClass="btn btn-block btn-primary my-3 py-3"/>
               </div>
                
            </div>
         </asp:PlaceHolder>
      </div>
              <div>
      </div>
           
            

   <%-- <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label runat="server" ID="lblMsg"></asp:Label>
                <h2 style="height: 30px">Авторизация</h2>
                </div>
            </div>
            <div class="row">
               <div class="col-md-5">
                   <div class="form_container">
                       <div>
                            <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Введите логин"></asp:TextBox>                           
                           <asp:RequiredFieldValidator ID="rvfUserName" runat="server" ErrorMessage="Введите логин корректно" ControlToValidate="txtUserName"
                               ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                          
                       </div>
                       <div>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Введите пароль"></asp:TextBox>                          
                            <asp:RequiredFieldValidator ID="rvfPassword" runat="server" ErrorMessage="Введите пароль корректно" ControlToValidate="txtUserName"
                               ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                          
                       </div>
                       <div class="btn_box">
                           <asp:Button ID="btnLogin" runat="server" Text="Войти" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white"
                               OnClick="btnLogin_Click" Width="162px" />
                           <span class="pl-3 text-info">Новый пользователь? <a href="Register.aspx" class="badge badge-info">Зарегистрироваться</a></span>
                       </div>
                   </div>
               </div>
            </div>
        </div>
    </section>--%>



   <%-- <div>
         <h4 style="font-size: medium">Log In</h4>
         <hr />
         <asp:PlaceHolder runat="server" ID="LoginStatus" Visible="false">
            <p>
               <asp:Literal runat="server" ID="StatusText" />
            </p>
         </asp:PlaceHolder>
         <asp:PlaceHolder runat="server" ID="LoginForm" Visible="false">
            <div style="margin-bottom: 10px">
               <asp:Label runat="server" AssociatedControlID="UserName">User name</asp:Label>
               <div>
                  <asp:TextBox runat="server" ID="UserName" />
               </div>
            </div>
            <div style="margin-bottom: 10px">
               <asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
               <div>
                  <asp:TextBox runat="server" ID="Password" TextMode="Password" />
               </div>
            </div>
            <div style="margin-bottom: 10px">
               <div>
                  <asp:Button ID="SignIn" runat="server" OnClick="SignIn_Click" Text="Вход" />
               </div>
            </div>
         </asp:PlaceHolder>
         <asp:PlaceHolder runat="server" ID="LogoutButton" Visible="false">
            <div>
               <div>
                  <asp:Button ID="SignOut" runat="server" OnClick="SignOut_Click" Text="Выйти" />
               </div>
            </div>
         </asp:PlaceHolder>
      </div>--%>

</asp:Content>
