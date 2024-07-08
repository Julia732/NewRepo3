<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebShop.User.Default" EnableEventValidation="False" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Featured Start -->
    <%--<div class="container-fluid pt-5">
        <div class="row px-xl-5 pb-3">
            <asp:Panel ID="pnlSlider" runat="server"></asp:Panel>
            </div>
    </div>--%>
    <!-- Featured End -->

     <div class="container-fluid pt-5">
        <div class="row px-xl-5 pb-3">
            <div class="container-fluid">
        
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">КАТЕГОРИИ</span></h2>
        </div>
        <ul class="row align-items-center py-3 px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                    <div class="featured__item">
                        <a href="Milk.aspx"><img src="../UserTemplate/img/MilkCat.png" height="210" width="190" alt="" /></a>
                     </div>
                    </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="featured__item">
                         <a href="Vegetabels.aspx"><img src="../UserTemplate/img/Vegetabels.png" height="210" width="190" alt="" /></a>  
                     </div>
                    </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="featured__item">
                        <a href="Fruits.aspx"><img src="../UserTemplate/img/Fruits.png" height="210" width="190" alt="" /></a>    
                     </div>
                    </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="featured__item">
                         <a href="Sweets.aspx"><img src="../UserTemplate/img/Sweets.png" height="210" width="190" alt="" /></a>  
                     </div>
                    </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="featured__item">
                         <a href="Meat.aspx"><img src="../UserTemplate/img/Meat.png" height="210" width="190" alt="" /></a>  
                     </div>
                    </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="featured__item">
                        <a href="Fish.aspx"><img src="../UserTemplate/img/Fish.png" height="210" width="190" alt="" /></a>  
                     </div>
                    </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="featured__item">
                         <a href="Freezing.aspx"><img src="../UserTemplate/img/Freezing.png" height="210" width="190" alt="" /></a>  
                     </div>
                    </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="featured__item">
                        <a href="Drinks.aspx"><img src="../UserTemplate/img/Drinks.png" height="210" width="190" alt="" /></a>  
                     </div>
                    </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="featured__item">
                       <a href="Sausage.aspx"><img src="../UserTemplate/img/Sausage.png" height="210" width="190" alt="" /></a>  
                    </div>
                    </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="featured__item">
                        <a href="Bread.aspx"><img src="../UserTemplate/img/Bread.png" height="210" width="190" alt="" /></a>  
                     </div>
                    </div>
             <div class="col-lg-3 d-none d-lg-block">
                    <div class="featured__item">
                        <a href="Cheese.aspx"><img src="../UserTemplate/img/Cheese.png" height="210" width="190" alt="" /></a>
                     </div>
                    </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="featured__item">
                         <a href="Noodle.aspx"><img src="../UserTemplate/img/Noodle.png" height="210" width="190" alt="" /></a>  
                     </div>
                    </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="featured__item">
                        <a href="Tea.aspx"><img src="../UserTemplate/img/Tea.png" height="210" width="190" alt="" /></a>    
                     </div>
                    </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="featured__item">
                         <a href="Bakery.aspx"><img src="../UserTemplate/img/Bakery.png" height="210" width="190" alt="" /></a>  
                     </div>
                    </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="featured__item">
                         <a href="Oil.aspx"><img src="../UserTemplate/img/Oil.png" height="210" width="190" alt="" /></a>  
                     </div>
                    </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="featured__item">
                         <a href="Canned.aspx"><img src="../UserTemplate/img/Canned.png" height="210" width="190" alt="" /></a>  
                     </div>
                    </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="featured__item">
                        <a href="Chips.aspx"><img src="../UserTemplate/img/Chips.png" height="210" width="190" alt="" /></a>  
                     </div>
                    </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="featured__item">
                         <a href="ForChildren.aspx"><img src="../UserTemplate/img/ForChildren.png" height="210" width="190" alt="" /></a>  
                     </div>
                    </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="featured__item">
                        <a href="Health.aspx"><img src="../UserTemplate/img/Health.png" height="210" width="190" alt="" /></a>  
                     </div>
                    </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="featured__item">
                       <a href="Clean.aspx"><img src="../UserTemplate/img/Clean.png" height="210" width="190" alt="" /></a>  
                    </div>
                    </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="featured__item">
                        <a href="ForAnimal.aspx"><img src="../UserTemplate/img/ForAnimal.png" height="210" width="190" alt="" /></a>  
                     </div>
                    </div>
             <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="featured__item">
                       <a href="HouseHold.aspx"><img src="../UserTemplate/img/HouseHold.png" height="210" width="190" alt="" /></a>  
                    </div>
                 </div>
            </ul>
     </div>
            </div>
    </div>

   

   <%-- <!-- Categories Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-4 col-md-6 pb-1">
                <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                    <p class="text-right">15 Products</p>
                    <a href="" class="cat-img position-relative overflow-hidden mb-3">
                        <img class="img-fluid" src="../UserTemplate/img/cat-1.jpg" alt="">
                    </a>
                    <h5 class="font-weight-semi-bold m-0">Men's dresses</h5>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 pb-1">
                <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                    <p class="text-right">15 Products</p>
                    <a href="" class="cat-img position-relative overflow-hidden mb-3">
                        <img class="img-fluid" src="../UserTemplate/img/cat-2.jpg" alt="">
                    </a>
                    <h5 class="font-weight-semi-bold m-0">Women's dresses</h5>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 pb-1">
                <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                    <p class="text-right">15 Products</p>
                    <a href="" class="cat-img position-relative overflow-hidden mb-3">
                        <img class="img-fluid" src="../UserTemplate/img/cat-3.jpg" alt="">
                    </a>
                    <h5 class="font-weight-semi-bold m-0">Baby's dresses</h5>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 pb-1">
                <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                    <p class="text-right">15 Products</p>
                    <a href="" class="cat-img position-relative overflow-hidden mb-3">
                        <img class="img-fluid" src="../UserTemplate/img/cat-4.jpg" alt="">
                    </a>
                    <h5 class="font-weight-semi-bold m-0">Accerssories</h5>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 pb-1">
                <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                    <p class="text-right">15 Products</p>
                    <a href="" class="cat-img position-relative overflow-hidden mb-3">
                        <img class="img-fluid" src="../UserTemplate/img/cat-5.jpg" alt="">
                    </a>
                    <h5 class="font-weight-semi-bold m-0">Bags</h5>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 pb-1">
                <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                    <p class="text-right">15 Products</p>
                    <a href="" class="cat-img position-relative overflow-hidden mb-3">
                        <img class="img-fluid" src="../UserTemplate/img/cat-6.jpg" alt="">
                    </a>
                    <h5 class="font-weight-semi-bold m-0">Shoes</h5>
                </div>
            </div>
        </div>
    </div>
    <!-- Categories End -->--%>


    <%--<!-- Offer Start -->
    <div class="container-fluid offer pt-5">
        <div class="row px-xl-5">
            <div class="col-md-6 pb-4">
                <div class="position-relative bg-secondary text-center text-md-right text-white mb-2 py-5 px-5">
                    <img src="../UserTemplate/img/offer-1.png" alt="">
                    <div class="position-relative" style="z-index: 1;">
                        <h5 class="text-uppercase text-primary mb-3">20% off the all order</h5>
                        <h1 class="mb-4 font-weight-semi-bold">Spring Collection</h1>
                        <a href="" class="btn btn-outline-primary py-md-2 px-md-3">Shop Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 pb-4">
                <div class="../UserTemplate/position-relative bg-secondary text-center text-md-left text-white mb-2 py-5 px-5">
                    <img src="../UserTemplate/img/offer-2.png" alt="">
                    <div class="position-relative" style="z-index: 1;">
                        <h5 class="text-uppercase text-primary mb-3">20% off the all order</h5>
                        <h1 class="mb-4 font-weight-semi-bold">Winter Collection</h1>
                        <a href="" class="btn btn-outline-primary py-md-2 px-md-3">Shop Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>
    <!-- Offer End -->


    <!-- Subscribe Start -->
   <%-- <div class="container-fluid bg-secondary my-5">
        <div class="row justify-content-md-center py-5 px-xl-5">
            <div class="col-md-6 col-12 py-5">
                <div class="text-center mb-2 pb-2">
                    <h2 class="section-title px-5 mb-3"><span class="bg-secondary px-2">Stay Updated</span></h2>
                    <p>Amet lorem at rebum amet dolores. Elitr lorem dolor sed amet diam labore at justo ipsum eirmod duo labore labore.</p>
                </div>
                <form action="">
                    <div class="input-group">
                        <input type="text" class="form-control border-white p-4" placeholder="Email Goes Here">
                        <div class="input-group-append">
                            <button class="btn btn-primary px-4">Subscribe</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>--%>
    <!-- Subscribe End -->


    <%--<!-- Vendor Start -->
    <div class="container-fluid py-5">
        <div class="row px-xl-5">
            <div class="col">
                <div class="owl-carousel vendor-carousel">
                    <div class="vendor-item border p-4">
                        <img src="../UserTemplate/img/vendor-1.jpg" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="../UserTemplate/img/vendor-2.jpg" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="../UserTemplate/img/vendor-3.jpg" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="../UserTemplate/img/vendor-4.jpg" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="../UserTemplate/img/vendor-5.jpg" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="../UserTemplate/img/vendor-6.jpg" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="../UserTemplate/img/vendor-7.jpg" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="../UserTemplate/img/vendor-8.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Vendor End -->--%>

</asp:Content>
