<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="WebShop.User.Shop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
 
    
   
                 <div class="col-sm-12 col-md-8">
            <div class="card">
                <div class="card-body">
                 
                    <div class="table-responsive">
                        <div class="text-center mb-4">
           <%-- <h2 class="section-title px-5"><span class="px-2">РЕДАКТИРОВАНИЕ ПРОФИЛЯ</span></h2>--%>
                     <asp:Label ID="lblForText" runat="server" Visible="false" CssClass="card-title"></asp:Label>
           
        </div>
                      <asp:Repeater ID="rDetail" runat="server" >
                    <HeaderTemplate>
                       
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>  
                            <th>Наименование</th>
                             <th></th>
                            <th>Количесво</th>
                            <th>Цена</th>
                        </tr>
                    </thead>
                    <tbody>
                  </HeaderTemplate>

                                <ItemTemplate>
                    <tbody class="align-middle">
                        <tr>
                                                    
                            <td>
                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                            </td>
                             <td> 
                                 <img width="50" src="<%# WebShop.Utils.getImageUrl( Eval("ProductImageUrl")) %>" alt="image" />
                            </td>
                            <td>
                                <asp:Label ID="lblQuant" runat="server"  Text='<%# Eval("Quantity")%>'></asp:Label>
                                   
                            </td>
                            <td><asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>₽
                                
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
                 
                    

            

</asp:Content>
