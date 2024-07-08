<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="MainCategory.aspx.cs" Inherits="WebShop.Admin.MainCategory.MainCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        }
    </script>

    <%--<script>
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
    </script>--%>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="mb-4">
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>

   

         <div class="col-sm-12 mobile-inputs">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Список категорий</h4>
                    <hr />
                    <div class="table-responsive">
                        <asp:Repeater ID="rMainCategory" runat="server" OnItemCommand="rMainCategory_ItemCommand">
                            <HeaderTemplate>
                                <table class="table data-table-export table-hover nowrap">
                                    <thead>
                                        <tr>
                                            <th class="table-plus">Название</th>
                                             <th>Изображение</th
                                                  <th>Дата создания</th
                                           
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td class="table-plus"> <%# Eval("NameCategory") %> </td>
                                    <td> 
                                 <img width="50" src="<%# WebShop.Utils.getImageUrl( Eval("CategoryImageUrl")) %>" alt="image" />
                            </td>
                                   
                                    <td><%# Eval("CreatedDate") %></td>
                                   
                                    
                                      
                                    <%--</td>--%>
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


      <%--<div class="mb-4">
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>

    <div class="row">
        <div class="col-sm-12 col-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Категория</h4>
                    <hr />

                    <div class="form-body">

                        <lable>Название категории</lable>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:TextBox ID="txtMainCategoryName" runat="server" CssClass="form-control" plaseholder="Enter Category Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvMainCategoryName" runat="server" ForeColor="Red" Font-Size="Small"
                                        Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtMainCategoryName"
                                        ErrorMassage="Введите название категории"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                          <lable>Фото категории</lable>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:FileUpLoad ID="fuCategoryImage" runat="server" CssClass="form-control"
                                      onchange ="ImagePrewiew(this);"  />
                                    <asp:HiddenField ID="hfMainCategoryId" runat="server" Value ="0" />
                                </div>
                            </div>
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
                    <h4 class="card-title">Список категорий</h4>
                    <hr />
                    <div class="table-responsive">
                        <asp:Repeater ID="rMainCategory" runat="server" OnItemCommand="rMainCategory_ItemCommand">
                            <HeaderTemplate>
                                <table class="table data-table-export table-hover nowrap">
                                    <thead>
                                        <tr>
                                            <th class="table-plus">Название</th>
                                             <th>Изображение</th>
                                            <th>Активность</th>
                                            <th>Дата создания</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td class="table-plus"> <%# Eval("NameCategory") %> </td>
                                    <td> 
                                        <img width="40" src="<%# WebShop.Utils.getImageUrl( Eval("CategoryImageUrl")) %>" alt="image" />
                                    </td>
                                    <td>
                                        <asp:Label ID="lblIsActive" runat="server"
                                            Text='<%# (bool)Eval("IsActive") == true ? "Active" : "In-Active" %>'
                                            CssClass='<%# (bool)Eval("IsActive") == true ? "badge badge-success" 
                                                : "badge badge-danger" %>'>
                                        </asp:Label>
                                    </td>
                                     <td><%# Eval("CreatedDate") %></td>
                                   
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

    </div>--%>

</asp:Content>
