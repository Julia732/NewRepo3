<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="WebShop.User.Profile" EnableEventValidation="True" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script>
         window.onload = function () {
             var seconds = 5;
             setTimeout(function () {
                 document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
             }, seconds * 1000);
         }
     </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row px-xl-5">
            <div class="col">
                <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                    <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Профиль</a>
                    <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-2">Заказы</a>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="tab-pane-1">
                       


                           <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8">
                <div class="mb-4">
        
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">РЕДАКТИРОВАНИЕ ПРОФИЛЯ</span></h2>
           
        </div>
        </div>
         <div class="mb-4">
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>
         <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Логин</label>
                             <asp:TextBox ID="txtLogin" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:TextBox ID="tbLogin" runat="server" CssClass="form-control" placeholder="Введите новый логин"></asp:TextBox>                            
                        </div>
                         <div class="col-md-6 form-group">
                            <label>Населенный пункт</label>
                            <asp:TextBox ID="txtTown" runat="server" CssClass="form-control"></asp:TextBox>
                             <asp:TextBox ID="tbTown" runat="server" CssClass="form-control" placeholder="Введите новый населенный пункт"></asp:TextBox>
                        </div>
                        
                        <div class="col-md-6 form-group">
                            <label>Номер телефона</label>
                            <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:TextBox ID="tbPhoneNumber" runat="server" CssClass="form-control" placeholder="Введите новый номер телефона"></asp:TextBox>   
                        </div>
                       
                        <div class="col-md-6 form-group">
                            <label>Улица и дом</label>
                            <asp:TextBox ID="txtStreet" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:TextBox ID="tbStreet" runat="server" CssClass="form-control" placeholder="Введите новую улицу и дом"></asp:TextBox>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:TextBox ID="tbEmail" runat="server" CssClass="form-control" placeholder="Введите новый email"></asp:TextBox>
                        </div>                        
                        <div class="col-md-6 form-group">
                            <label>Квартира</label>
                            <asp:TextBox ID="txtApartment" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:TextBox ID="tbApartment" runat="server" CssClass="form-control" placeholder="Введите новую квартиру"></asp:TextBox>
                        </div>
                        </div>
                 
<%--            <div class="tab-content">
                       
                        <div id="credit-card" class="tab-pane fade show active pt-3">
                          
                                <div class="form-group"> <label for="cardNumber">
                                        <h6>Номер карты</h6>
                                    </label>
                                    <div class="input-group">
                                        <asp:TextBox ID="txtCardNumber" runat="server" placeholder="Введите номер карты" CssClass="form-control"></asp:TextBox>
                                     
                                        <div class="input-group-append"> <span class="input-group-text text-muted"> <i class="fab fa-cc-visa mx-1"></i> <i class="fab fa-cc-mastercard mx-1"></i> <i class="fab fa-cc-amex mx-1"></i> </span> </div>
                                    </div>
                                </div>
                            <div class="row">
                        <div class="col-md-6 form-group">
                            <h6>Срок действия</h6>
                            <asp:TextBox ID="txtDateEnd" runat="server" CssClass="form-control" Width="270" placeholder="MM/YY"></asp:TextBox> 
                            </div>                        
                        </div>                             
                        </div>
                    </div> 
                <div class="col-md-12 form-group">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="shipto">
                                <label class="custom-control-label" for="shipto"  data-toggle="collapse" data-target="#shipping-address">Изменить карту</label>
                            </div>
                        </div>--%>
                   
         <%--   <div class="collapse mb-4" id="shipping-address">
          
                        <div id="credit-card" class="tab-pane fade show active pt-3">

                                <div class="form-group"> <label for="cardNumber">
                                        <h6>Номер карты</h6>
                                    </label>
                                    <div class="input-group">
                                        <asp:TextBox ID="txtCardNumberNew" runat="server" placeholder="Введите номер карты" CssClass="form-control"></asp:TextBox>
                                       
                                        <div class="input-group-append"> <span class="input-group-text text-muted"> <i class="fab fa-cc-visa mx-1"></i> <i class="fab fa-cc-mastercard mx-1"></i> <i class="fab fa-cc-amex mx-1"></i> </span> </div>
                                    </div>
                                </div>
                            <div class="row">
                        <div class="col-md-6 form-group">
                            <h6>Срок действия</h6>
                            <asp:TextBox ID="txtDateEndNew" runat="server" CssClass="form-control" Width="270" placeholder="MM/YY"></asp:TextBox> 
                            </div>                        
                        </div>                             
                        </div>
                </div> --%>
                </div>
           
          
                    
                <div class="card-footer border-secondary bg-transparent">
                 <asp:Button ID="btn" runat="server" CssClass="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3" Text="Сохранить изменения" OnClick="btn_Click" />                    
                    </div>
            <div class="card-footer border-secondary bg-transparent">
                    <a href="../Identity/Login.aspx" class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3">Выход</a>
                    </div>
            </div>
        </div>


                    </div>
                    <div class="tab-pane fade" id="tab-pane-2">
                          <div class="mb-4">
        
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">ИСТОРИЯ ЗАКАЗОВ</span></h2>
           
        </div>
        </div>
                        <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                            
                           <asp:Repeater ID="rHistory" runat="server" OnItemCommand="rHistory_ItemCommand">
                    <HeaderTemplate>
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>  
                            <th></th>
                            <th class="table-plus">Код заказа</th>
                            <th>Общая сумма</th>
                            <th>Дата заказа</th>
                            <th>Статус</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                  </HeaderTemplate>

                                <ItemTemplate>
                    <tbody class="align-middle">
                        <tr>
                            <td>
                                <span class="badge badge-danger text-white">
                                 <%# Eval("SrNo") %>
                                    </span>
                            </td>                            
                            <td><asp:Label ID="lblOrderNo" runat="server" Text='<%# Eval("OrderNo") %>'></asp:Label>
                               
                            </td>
                         
                             <td>
                                <asp:Label ID="lblTotPrice" runat="server" Text='<%# Eval("TotPrice") %>'></asp:Label>₽
                            </td>
                             <td><asp:Label ID="lblDate" runat="server" Text='<%# Eval("OrderDate") %>'></asp:Label>
                               
                            </td>
                             <td>
                                <asp:Label ID="lblStstus" runat="server" Text='<%# Eval("StstusName") %>'></asp:Label>
                            </td>
                             <td> 
                                <asp:LinkButton ID="lbEdit" Text="Подробнее" runat="server" CssClass="mybtn"
                                             CommandArgument='<%# Eval("OrderNo") %>' CommandName="delete" >
                                           <%-- <a href="#tab-pane-2"></a>--%>
                                </asp:LinkButton>
                            </td>
                        </tr>

                        
                      
                        </ItemTemplate>
                    <FooterTemplate>
                                  </tbody>
                                  </table>
                            </FooterTemplate>

                    
              
              </asp:Repeater>
                 
                 
                 
                        </div>
            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       
    <!-- Shop Detail End -->


       
       </asp:Content>
