<%@ Page Title="" Language="C#" MasterPageFile="~/Identity/Identity.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebShop.Identity.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="mb-md-5 mt-md-4 pb-5">

    <h4 style="font-size: medium">РЕГИСТРАЦИЯ</h4>
        <hr />
    
        <p>
            <asp:Literal runat="server" ID="StatusMessage" />
        </p>                
        <div style="margin-bottom:10px">
            <asp:Label runat="server" AssociatedControlID="UserName">Логин</asp:Label>
            <div>
                <asp:TextBox runat="server" ID="UserName" />                
            </div>
        </div>
        <div style="margin-bottom:10px">
            <asp:Label runat="server" AssociatedControlID="Password">Пароль</asp:Label>
            <div>
                <asp:TextBox runat="server" ID="Password" TextMode="Password" />                
            </div>
        </div>
        <div style="margin-bottom:10px">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword">Повторите пароль</asp:Label>
            <div>
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" />                
            </div>
        </div>
        <div>
            <div>
                <asp:Button ID="CreateUser" runat="server" OnClick="CreateUser_Click" Text="Зарегистрироваться" />
            </div>
            <asp:Label ID="lblAlreadyUser" runat="server" CssClass="pl-3 text-black-100"
                        Text="Уже есть аккаунт? <a href='Login.aspx' class='badge badge-info'>Войти..</a>">
                    </asp:Label>
        </div>
              </div>

           

                


    <%--<section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>
                <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>Регистрация</h2>"></asp:Label>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">

                        <div>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Введите логин"
                                ToolTip="Логин"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form_container">

                    </div>
                </div>
            </div>
            <div>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Введите пароль"
                    ToolTip="Password" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Неверный формат пароля"
                    ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
            </div>


            <div class="row pl-4">
                <div class="btn_box">
                    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white"
                        OnClick="btnRegister_Click" />

                    <asp:Label ID="lblAlreadyUser" runat="server" CssClass="pl-3 text-black-100"
                        Text="Уже есть аккаунт? <a href='Login.aspx' class='badge badge-info'>Войти..</a>">
                    </asp:Label>
                </div>
            </div>
        </div>
    </section>--%>

</asp:Content>
