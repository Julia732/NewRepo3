<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="WebShop.Admin.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script>
         window.onload = function () {
             var seconds = 5;
             setTimeout(function () {
                 document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
         }
     </script>

    <script>
        function ImagePrewiew(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imagePreview.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .hight(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="mb-4">
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>

     <div class="row">
        <div class="col-sm-12 col-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Товар</h4>
                    <hr />

                    <div class="form-body">

                        <lable>Название товара</lable>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" plaseholder="Введите название продукта"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvCategoryName" runat="server" ForeColor="Red" Font-Size="Small"
                                        Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtProductName"
                                        ErrorMassage="Введите название товара"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                         <%--<div class="form-group">--%>
                        <lable>Описание</lable>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" plaseholder="Введите описание продукта" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" Font-Size="Small"
                                        Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtDescription"
                                        ErrorMassage="Введите описание товара"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <lable>Энергетическая ценность</lable>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:TextBox ID="txtEnergyValue" runat="server" CssClass="form-control" plaseholder="Введите энергетическую ценность" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ForeColor="Red" Font-Size="Small"
                                        Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtDescription"
                                        ErrorMassage="Введите энергетическую ценность товара"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                               
                        <lable>Стоимость товара(руб.)</lable>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" plaseholder="Введите стоимость продукта"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" Font-Size="Small"
                                        Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtPrice"
                                        ErrorMassage="Введите стоимость товара"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator" runat="server"
                                         ErrorMassage="Введите стоимость товара корректно" ForeColor="Red"   Display="Dynamic"
                                         SetFocusOnError="true" ControlToValidate="txtPrice"
                                        ValidationExpression="^\d{0,8}(\.\d{1,4})?$" ></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>

                                    

                                  
                        <lable>Количество товара</lable>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" plaseholder="Введите количество продукта"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" Font-Size="Small"
                                        Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtQuantity"
                                        ErrorMassage="Введите количество товара"></asp:RequiredFieldValidator>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                         ErrorMassage="Введите количество товара корректно" ForeColor="Red"   Display="Dynamic"
                                         SetFocusOnError="true" ControlToValidate="txtQuantity"
                                          ValidationExpression="^([1-9]\d*|0)$"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>

                                       
                        <lable>Вес товара</lable>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:TextBox ID="txtSize" runat="server" CssClass="form-control" plaseholder="Введите вес продукта"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="Red" Font-Size="Small"
                                        Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtQuantity"
                                        ErrorMassage="Введите вес товара"></asp:RequiredFieldValidator>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                         ErrorMassage="Введите вес товара корректно" ForeColor="Red"   Display="Dynamic"
                                         SetFocusOnError="true" ControlToValidate="txtQuantity"
                                          ValidationExpression="^([1-9]\d*|0)$"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>

                                           
                        <lable>Производитель</lable>
                            <div>
                                <asp:DropDownList ID="ddlCompany" runat="server" CssClass="form-control" 
                                    DataSourceID="SqlDataSource2" DataTextField="CompanyName" DataValueField="CompanyID"
                                    AppendDataBoundItems="true">
                                     <asp:ListItem Value="0">Выберите производителя</asp:ListItem>
                                </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"  
                                        ErrorMessage="Выберите производителя" ForeColor="Red" Display="Dynamic" 
                                        SetFocusOnError="true" ControlToValidate="ddlCompany" InitialValue="0">
                                       </asp:RequiredFieldValidator>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT [CompanyID], [CompanyName] FROM [Company]"></asp:SqlDataSource>
                            </div>
                    </div>

                            
                        <lable>Категория</lable>
                            <div>
                                <asp:DropDownList ID="ddlCategories" runat="server" CssClass="form-control"
                                    DataSourceID="SqlDataSource1" DataTextField="NameCategory" DataValueField="CategoryID"
                                    AppendDataBoundItems="true">
                                    <asp:ListItem Value="0">Выберите категорию</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  
                                        ErrorMessage="Выберите категорию" ForeColor="Red" Display="Dynamic" 
                                        SetFocusOnError="true" ControlToValidate="ddlCategories" InitialValue="0">
                                       </asp:RequiredFieldValidator>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' SelectCommand="SELECT [CategoryId], [NameCategory] FROM [Category]"></asp:SqlDataSource>
                            </div>
                 
                                 
                            

                     
                        <lable>Фото товарa</lable>
                       <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                           <asp:FileUpLoad ID="fuProductImage" runat="server" CssClass="form-control"
                                  onchange ="ImagePrewiew(this);"  /> 
                            <asp:HiddenField ID="hfProductId" runat="server" Value ="0" />
                          </div>
                            </div>
                        </div>



                        <div class="row">
                             <div class="col-md-12">
                                <div class="form-group">
                                    <asp:CheckBox ID="cbIsActive" runat="server" Text="&nbsp; IsActive" />                                    
                                </div>
                             </div>
                        </div>
                   
                   

                        <div class="form-actiona pb-5">
                            <div class="text-left">
                                <asp:Button ID="btnAddOrUpdate" runat="server" CssClass="btn btn-info" Text="Добавить" OnClick="btnAddOrUpdate_Click1"/>
                                <asp:Button ID="btnClear" runat="server" CssClass="btn btn-dark" Text="Очистить" OnClick="btnClear_Click"/>
                            </div>
                        </div>

                    <div>
                        <asp:Image ID="imagePreview" runat="server" CssClass="img-thumbnail" AlternateText="" />                        
                    </div>
                                            

                </div>
            </div>
        </div>

           

         <div class="col-sm-12 col-md-8">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Список товаров</h4>
                    <hr />
                    <div class="table-responsive">
                        <asp:Repeater ID="rProduct" runat="server" OnItemCommand="rProduct_ItemCommand"
                            OnItemDataBound="rProduct_ItemDataBound">
                            <HeaderTemplate>
                                <table class="table data-table-export table-hover nowrap">
                                    <thead>
                                        <tr>
                                            <th class="table-plus">Название</th>
                                            <th>Изображение</th>
                                            <th>Цена</th> 
                                            <th>Описание</th>
                                            <th>Энергетическая ценность</th>
                                            <th>Количество</th> 
                                            <th>Вес</th> 
                                            <th>Активность</th> 
                                            <th>Дата создания</th>
                                            <th class="datatable-nosort">Действия</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td class="table-plus"> <%# Eval("ProductName") %> </td>
                                    <td> 
                                        <img width="40" src="<%# WebShop.Utils.getImageUrl( Eval("ProductImageUrl")) %>" alt="image" />
                                    </td>

                                    <td> <%# Eval("Price") %> </td>
                                    <td> <%# Eval("LongDescription") %> </td>
                                    <th> <%# Eval("EnergyValue") %></th>
                                    <td> <%# Eval("Quantity") %> </td>
                                    <td> <%# Eval("Size") %> </td>

                                    
                                    <td>
                                        <asp:Label ID="lblIsActive" runat="server"
                                            Text='<%# (bool)Eval("IsActive") == true ? "Active" : "In-Active" %>'
                                            CssClass='<%# (bool)Eval("IsActive") == true ? "badge badge-success" 
                                                : "badge badge-danger" %>'>
                                        </asp:Label>
                                    </td>

                                     <td><%# Eval("CreatedDate") %></td>
                                    <td>
                                        <asp:LinkButton ID="lbEdit" Text="Edit" runat="server" CssClass="badge badge-primary"
                                            CommandArgument='<%# Eval("ProductId") %>' CommandName="edit" CausesValidation="false" >
                                            <i class="fas fa-edit"></i>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="lbDelete" Text="Delete" runat="server" CssClass="badge badge-danger"
                                             CommandArgument='<%# Eval("ProductId") %>' CommandName="delete" CausesValidation="false" >
                                            <i class="fas fa-trash-alt"></i>
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

</asp:Content>

