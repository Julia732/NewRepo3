<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="WebShop.User.Checkout" %>
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

    
  
    <!-- Checkout Start -->
    <div class="mb-4">
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>

    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8">
                <div class="mb-4">
                    <h4 class="font-weight-semi-bold mb-4">Адрес доставки</h4>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Номер телефона</label>
                            <asp:Label ID="lblPhoneNumber" runat="server" CssClass="form-control"></asp:Label> 
                            </div>
                        <div class="col-md-6 form-group">
                            <label>Населенный пункт</label>
                            <asp:Label ID="lblTown" runat="server" CssClass="form-control"></asp:Label>                         
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Улица и дом</label>
                            <asp:Label ID="lblStreet" runat="server" CssClass="form-control"></asp:Label>                       
                        </div>                        
                       <div class="col-md-6 form-group">
                            <label>Квартира</label>
                            <asp:Label ID="lblApartment" runat="server" CssClass="form-control"></asp:Label>                             
                        </div>                                     
                    </div>
                </div> 
                <asp:Button ID="btnAddChange" runat="server" CssClass="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3" Text="Изменить" OnClick="btnAddChange_Click" />
                </div>
             
            <div class="col-lg-4">
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Заказ</h4>
                    </div>
                    <div class="card-body">
                        <hr class="mt-0">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Цена</h6>
                            <h6>
                                <asp:Label ID="lblSum" runat="server" CssClass="font-weight-medium"></asp:Label>₽
                            </h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Доставка</h6>
                            <h6 class="font-weight-medium">
                                 <asp:Label ID="lblDelPrice" runat="server" Text="99"></asp:Label>₽
                            </h6>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Общая стоимость</h5>
                            <h5>
                                <asp:Label ID="lblTotQuant" runat="server" CssClass="font-weight-bold"></asp:Label>₽
                            </h5>
                        </div>
                    </div>
                </div>                
        </div>
    </div>
    <!-- Checkout End -->
<div class="container py-5">  
    <div class="row">
        <div class="col-lg-6 mx-auto">
            <div class="card ">
                <div class="card-header">
                    <div class="bg-white shadow-sm pt-4 pl-2 pr-2 pb-2">
                        <!-- Credit card form tabs -->
                         <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Оплата</h4>
                    </div>
                    <!-- Credit card form content -->
                    <div class="tab-content">
                        <!-- credit card info-->
                        <div id="credit-card" class="tab-pane fade show active pt-3">                          
                                <div class="form-group"> <label for="cardNumber">
                                        <h6>Номер карты</h6>
                                    </label>
                                    <div class="input-group">
                                        <asp:TextBox ID="txtCardNumber" runat="server" placeholder="Введите номер карты" CssClass="form-control"></asp:TextBox>
                                        <%--<input type="text" name="cardNumber" placeholder="Введите номер карты" class="form-control " required>--%>
                                        <div class="input-group-append"> <span class="input-group-text text-muted"> <i class="fab fa-cc-visa mx-1"></i> <i class="fab fa-cc-mastercard mx-1"></i> <i class="fab fa-cc-amex mx-1"></i> </span> </div>
                                    </div>
                                </div>
                            <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Срок действия</label>
                            <asp:TextBox ID="txtDateEnd" runat="server" CssClass="form-control" Width="270" placeholder="MM/YY"></asp:TextBox> 
                            </div>
                        <div class="col-md-6 form-group">
                            <label>CVV</label>
                            <asp:TextBox ID="txtCVC" runat="server" CssClass="form-control" Width="120" placeholder="CVC" ></asp:TextBox>                         
                        </div>
                        </div>                           
                              
                        <div class="card-footer"> 
                          <asp:Button ID="btnPay" runat="server" CssClass="subscribe btn btn-primary btn-block shadow-sm" Text="Оплатить" OnClick="btnPay_Click" />
                                  
                        </div>
                    </div> 
                </div>
            </div>
        </div>
    </div>
            </div>
        

</asp:Content>
