

<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.Format.CurrencyFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="zxx">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Thanh toán</title>

  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
        rel="stylesheet" />

  <!-- Css Styles -->
  <%@include file="css.jsp"%>
  <link rel="stylesheet" href="css/cart.css" type="text/css">
</head>

<body>
<%
  Cart cart = (Cart) session.getAttribute("cart");
  User user = (User) session.getAttribute("user");
  List<Product> listProductUnavaiable =(List<Product>) session.getAttribute("listProductUnavaiable")==null?null:(List<Product>) session.getAttribute("listProductUnavaiable");
%>
<!-- Page Preloder -->
<div id="preloder">
  <div class="loader"></div>
</div>

<!-- Offcanvas Menu Begin -->
<div class="offcanvas-menu-overlay"></div>
<div class="offcanvas-menu-wrapper">
  <div class="offcanvas__option">
    <div class="offcanvas__links">
      <a href="login-register.html">Đăng nhập</a>
    </div>
  </div>
  <div class="offcanvas__nav__option">
    <a href="#" class="search-switch"><img src="img/icon/search.png" alt="" /></a>
    <a href="#"><img src="img/icon/heart.png" alt="" /></a>
    <a href="cart.html"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
    <div class="price">0 vnđ</div>
  </div>
  <div id="mobile-menu-wrap"></div>
</div>
<!-- Offcanvas Menu End -->

<!-- Header Section Begin -->
<%@include file="header.jsp" %>
<!-- Header Section End -->

<!-- Breadcrumb Section Begin -->
<div class="container">
  <div class="breadcumb">
    <h1>Thanh toán</h1>
    <img src="assets/images/icon_tealeaves.png" width="500px" height="50px" style="object-fit: cover; scale: 0.5" />
  </div>
</div>
<!-- Breadcrumb Section End -->
<!-- Shopping Cart Section Begin -->
<section class="cart">
  <div class="container">
    <div class="row mb-3">
      <div class="col-lg-8  ">
        <div class="shopping__cart__table p-3 shadow ">
          <table>
            <thead>
            <tr>
              <th>Sản phẩm</th>
              <th>Topping</th>
              <th>Số lượng</th>
              <th>Giá tiền</th>
              <th></th>
            </tr>
            </thead>
            <tbody>
            <form action="./editcart" method="post" id="form_edit_cart">
              <%
                if (cart!= null) {
                  List<Item> listItems = (cart.getItems() != null) ? cart.getItems() : null;
                  if(listItems != null) {
                  for (Item item : listItems) {
              %>
              <tr id="product-item-<%=item.getId()%>">
                <td class="product__cart__item">
                  <div class="product__cart__item__pic">
                    <img src="<%=item.getProduct().getImage().get(0).getUrl()%>" alt="" width="150">
                  </div>
                  <div class="product__cart__item__text">
                    <h5><%=item.getProduct().getName()%></h5>
                    <input style="display: none" class="product-modal-id" type="text" name="<%=item.getId()%>" value="<%=item.getId()%>" checked="checked">
                    <h6>Size:<%=item.getProduct().getPriceSize().get(0).getSize()%></h6>
                    <h6><%=new CurrencyFormat().format((int)item.getProduct().getPriceSize().get(0).getPrice())%></h6>
                  </div>
                </td>
                <td>
                  <%
                    List<Topping> toppingList = item.getProduct().getTopping();
                    if(toppingList.size() > 0) {
                      for (Topping topping : toppingList) {
                  %>
                  <p class="w-150"><%=topping.getName()%></p>
                  <%
                    }
                  } else {
                  %>
                  <p class="w-150"></p>
                  <%}%>
                </td>
                <td class="quantity__item">
                  <div class="quantity">
                    <div class="pro-qty-2">
                      <% boolean isAvaiable = true;
                        if (listProductUnavaiable != null){
                          for (Product p2:
                                  listProductUnavaiable) {
                            if (item.getProduct().getId() == p2.getId()){
                              isAvaiable = false;
                      %>
                      <span>Mặt hàng này không còn khả dụng</span>
                      <%}%>
                      <%}}%>
                      <%if (isAvaiable ==true){%>
                      <input onchange="$('#form_edit_cart').submit()" name="quantityChange<%=item.getId()%>" class="quantity" type="number" min="1" value="<%=item.getQuantity()%>">
                      <%}%>
                    </div>
                  </div>
                </td>
                <td class="cart__price" id="price-product-id-<%=item.getId()%>"><%= new CurrencyFormat().format((int)item.getPrice())%></td>
                <td class="cart__close">
                  <input onchange="$('#form_edit_cart').submit()" style="display: none" type="checkbox" name="removeProduct" id="remove-product<%=item.getId()%>" value="<%=item.getId()%>" />
                  <label for="remove-product<%=item.getId()%>"><i class="fa fa-close"></i></label>
                </td>
              </tr>
              <%
                  }
                  }
                }
              %>
            </form>
            </tbody>
          </table>
        </div>
      </div>

      <div class="col-lg-4">
        <form id="order_form" action="order" method="post" >
          <div class="cart__discount checkout__form shadow p-4">
            <div class="row">
              <div class="col-lg-12 col-md-12">
                <h6 class="">Thông tin nhận hàng</h6>
                <div class="row">
                  <div class="col-lg-12">
                    <div class="checkout__input">
                      <p>Tên người nhận<span>*</span></p>
                      <input name="nameUser" type="text" value="<%=user != null ? user.getName() : ""%>">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-lg-12">
                    <div class="checkout__input">
                      <p>Số điện thoại người nhận<span>*</span></p>
                      <input name="phoneUser" type="tel" pattern="[0]{1}[0-9]{9}" required value="<%=user != null ? user.getPhone() : ""%>">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-lg-12">
                    <div class="checkout__input">
                      <p>Địa chỉ nhận hàng<span>*</span></p>
                      <textarea name="addressUser" cols="" rows="2" style="width: 100%;"><%= request.getAttribute("addressUser") != null? request.getAttribute("addressUser"): user!=null?user.getAddress():"" %></textarea>
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col-lg-12">
                    <div class="checkout__input" >
                      <p>Tỉnh/Thành phố<span>*</span></p>
                      <select name="addressCity" class="nice-select" id="addressCity"  required>
                        <option >--Chọn--</option>
                        <option value="Hồ Chí Minh" id="202">Hồ Chí Minh</option>
                      </select>
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="checkout__input">
                      <p>Quận/Huyện<span>*</span></p>
                      <select name="addressDistrict" id="addressDistrict" class="nice-select" required>

                      </select>
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="checkout__input">
                      <p>Phường/Xã<span>*</span></p>
                      <select name="addressWard" class="nice-select" id="addressWard"  required>
                      </select>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-lg-12">
                    <div class="checkout__input">
                      <p>Ghi chú<span>*</span></p>
                      <textarea name="noteUser" cols="" rows="2" style="width: 100%;"><%=request.getAttribute("noteUser")!=null?request.getAttribute("noteUser"):""%></textarea>
                    </div>
                  </div>
                </div>
                <div class="coupon_form">
                  <p>Mã giảm giá</p>
                  <input name="coupon" onchange="useCoupon()" type="text" placeholder="Nhập mã giảm giá " value="<%=cart != null && cart.getCoupon()!=null? cart.getCoupon().getCode():""%>">
                </div>
                <div class="row">
                  <div class="col-lg-12">
                    <h6 class="mt-4  mb-3">Tổng giỏ hàng</h6>
                    <div>
                      <%
                        if(cart!=null) {
                      %>

                      <p>Tổng tiền:
                        <span id ="price_decreased"><%=new CurrencyFormat().format((int) cart.getTotalMoney())%></span>
                      </p>
                      <p id ="price_logistic_p">Phí vận chuyện:
                        <span id ="price_logistic"><%=new CurrencyFormat().format((int) 0)%></span>
                        <input style="display: none" class="product-modal-id" type="text" name="priceLogistic" value="0" checked="checked">

                      </p>
                      <p id ="time_logistic_p">Ước lượng thời gian:
                        <span id ="time_logistic"></span>


                      </p>
                      <p>Đã giảm:
                        <span id="percent_decreased"><%=cart.getCoupon() != null ? cart.getCoupon().getPercent() + "%" : "0%"%></span>
                      </p>
                      <%
                      } else {
                      %>
                      <p>Tổng tiền: <span><%=new CurrencyFormat().format((int) 0)%></span></p>
                      <p>Phí vận chuyện:
                        <span>0</span>
                      </p>
                      <p>Ước lượng thời gian:
                        <span></span>
                      </p>
                      <p>Đã giảm: <span>0%</span></p>
                      <%
                        }
                      %>
                    </div>
                    <button type="submit" id="checkout-button" class="primary-btn w-100 text-center">Đặt hàng</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </form>
        <form id="couponForm" method="post" action="./coupon">
          <input id="coupon_code" name="coupon" type="hidden" value="">
        </form>
      </div>


    </div>
  </div>
  </div>

</section>
<!-- Footer Section Begin -->
<%@include file="footer.jsp" %>
<!-- Footer Section End -->
<!-- Search Begin -->
<div class="search-model">
  <div class="h-100 d-flex align-items-center justify-content-center">
    <div class="search-close-switch">+</div>
    <form class="search-model-form">
      <input type="text" id="search-input" placeholder="Search here....." />
    </form>
  </div>
</div>
<!-- Search End -->

<!-- Js Plugins -->
<script src="js/jquery-3.6.0.min.js"></script>
<script>
  jQuery(function () {
    var numOfSizeM = 0;
    var numOfSizeL = 0;
    // Thông tin nơi giao hàng và size sản phẩm có thể chỉnh
    var idWardFrom = 90737;
    var idDistrictFrom = 3695;
    const sizeM = {
      size :'M',
      height: 15,
      width: 8,
      length: 8,
      weight: 55
    }
    const sizeL = {
      size :'L',
      height: 17,
      width: 10,
      length: 10,
      weight: 65
    }
    const listTR = document.getElementsByTagName('tr');
    let arrTR =Array.from(listTR)
    arrTR = arrTR.splice(1,arrTR.length)
    arrTR.map((tr,index)=>{
      const sizeH6 = tr.getElementsByTagName("h6")[0]
      const sizeText = sizeH6.innerText.split(':')[1]
      const quantityInput = tr.querySelectorAll('input[type="number"]')[0]

      if (sizeText===sizeM.size){
        numOfSizeM += parseInt(quantityInput.value);
      }else if (sizeText==sizeL.size){
        numOfSizeL += parseInt(quantityInput.value);
      }
    })

    //--------------------------
    //--------------------------
    // What to do when the response is ready
    fetch('http://140.238.54.136/api/auth/login', {
      method: "POST", // *GET, POST, PUT, DELETE, etc.
      mode: "cors", // no-cors, *cors, same-origin
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(
              {
                email: 'thaha8788@gmail.com',
                password: '123456'
              }
      )
    })
            .then((response) => {
              return response.json()
            })
            .then((data) => {
              const accessToken = data.access_token
              localStorage.setItem('accessToken', accessToken)
            })
    var changeCity = $("#addressCity");
    var changeDistrict = $("#addressDistrict");
    var changeWard = $("#addressWard");
    changeCity.on('change' , function (e) {
      changeDistrict.empty();
      var idValueSelected = $(this).children(":selected").attr("id");
      // console.log(idValueSelected)
      fetch('http://140.238.54.136/api/district'+"?provinceID="+idValueSelected, {
        method: "GET", // *GET, POST, PUT, DELETE, etc.
        mode: "cors", // no-cors, *cors, same-origin
        headers: {
          "Authorization": "Bearer "+localStorage.getItem('accessToken'),
        },
      })
              .then((response) => {
                return response.json()
              })
              .then((data) => {
                let districtDatas =  data.original.data;
                changeDistrict.append(`<option value="" >--Chọn--</option>`)

                districtDatas.map((district,index)=>{
                  changeDistrict.append(`<option value="`+district.DistrictName+`" id="`+district.DistrictID+`">`+district.DistrictName+`</option>`)
                })
              })
    })
    changeDistrict.on('change' , function (e) {
      changeWard.empty();
      var idValueSelected = $(this).children(":selected").attr("id");
      // console.log(idValueSelected)
      fetch('http://140.238.54.136/api/ward'+"?districtID="+idValueSelected, {
        method: "GET", // *GET, POST, PUT, DELETE, etc.
        mode: "cors", // no-cors, *cors, same-origin
        headers: {
          "Authorization": "Bearer "+localStorage.getItem('accessToken'),
        },
      })
              .then((response) => {
                return response.json()
              })
              .then((data) => {
                let wardDatas =  data.original.data;
                changeWard.append(`<option value="" >--Chọn--</option>`)
                wardDatas.map((ward,index)=>{
                  changeWard.append(`<option value="`+ward.WardName+`" id="`+ward.WardCode+`">`+ward.WardName+`</option>`)
                })
              })
    })


     changeWard.on('change' , async function (e) {
      let idWardValueSelected = $(this).children(":selected").attr("id");
      let idDistrictValueSelected = changeDistrict.children(":selected").attr("id");
      var details = {
        'from_district_id': idDistrictFrom,
        'from_ward_id':idWardFrom,
        'to_district_id':idDistrictValueSelected,
        'to_ward_id':idWardValueSelected,
        'height':(sizeM.height*numOfSizeM)+(sizeL.height*numOfSizeL),
        'length':(sizeM.length*numOfSizeM)+(sizeL.length*numOfSizeL),
        'width':(sizeM.width*numOfSizeM)+(sizeL.width*numOfSizeL),
        'weight':(sizeM.weight*numOfSizeM)+(sizeL.weight*numOfSizeL)
      };

      var formBody = [];
      for (var property in details) {
        var encodedKey = encodeURIComponent(property);
        var encodedValue = encodeURIComponent(details[property]);
        formBody.push(encodedKey + "=" + encodedValue);
      }
      formBody = formBody.join("&");
        // get fee logistic
       await fetch('http://140.238.54.136/api/calculateFee', {
          method: "POST", // *GET, POST, PUT, DELETE, etc.
          // mode: "cors",
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8',
            "Authorization": "Bearer "+localStorage.getItem('accessToken'),
          },body: formBody
        })
              .then((response) => {
                return response.json()
              })
              .then((datas) => {
                let moneyLogistic =  datas.data[0].service_fee;
                const price_logistic_p = document.getElementById('price_logistic_p')
                const price_logistic_span = price_logistic_p.getElementsByTagName('span')[0]
                const price_logistic_input = price_logistic_p.getElementsByTagName('input')[0]
                price_logistic_input.value = moneyLogistic
                price_logistic_span.innerText = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(moneyLogistic)

              })

      //get time logistic
       await fetch('http://140.238.54.136/api/leadTime', {
        method: "POST", // *GET, POST, PUT, DELETE, etc.
        // mode: "cors",
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8',
          "Authorization": "Bearer "+localStorage.getItem('accessToken'),
        },body: formBody
      })
              .then((response) => {
                return response.json()
              })
              .then((datas) => {

                let timeLogistic = datas.data[0].formattedDate;




                const time_logistic_p = document.getElementById('time_logistic_p')
                const time_logistic_span = time_logistic_p.getElementsByTagName('span')[0]

                time_logistic_span.innerText = timeLogistic;

              })


     })

  })
  $(document).ready(function () {
    $("#coupon_code_submit").click(function () {
      $("#coupon_code").val($("#coupon_code_input").val());
      $("#couponForm").submit();
    });
  });

  function useCoupon() {
      $.ajax({
        type: "POST",
        url: "./coupon",
         data: {coupon: document.getElementsByName('coupon')[0].value},
        success: function (data) {
          if(2 == data ) {
            alert('Vui lòng đăng nhập');
            window.location.href = "./login";
          } else if(1 == data) {
            alert('Mã giảm hết số lượng hoặc hết hạn');
          } else if(3 == data) {
            alert('Mỗi giỏ hàng sử dụng được 1 lần');
          } else if(4 == data) {
            alert('Mã giảm giá không đúng');
          }  else {
            let jsonObject = JSON.parse(data);
            let cartArray = Object.values(jsonObject);
            let coupon = Object.values(cartArray[5]) ;
            $("#price_decreased").text(cartArray[3].toLocaleString("vi-VN", { style: "currency", currency: "VND" }));
            $("#percent_decreased").text(coupon[2] + "%");

          }
        },
        error: function (data) {
          console.log('An error occurred.');
          console.log(data);
        },
      });
  }


  $("#order_form").submit(function (e) {
    e.preventDefault();
    $.ajax({
      type: $(this).attr('method'),
      url: $(this).attr('action'),
      data: $(this).serialize(),
      success: function (data) {
        if(0 == data) {
          window.location.href = "./account";
        }
        if(2 == data) {
          alert('Vui lòng đăng nhập');
          window.location.href = "./login";
        }
        if(1 == data) {
          alert('Vui lòng điền đủ thông tin');
        }
      },
      error: function (data) {
        console.log('An error occurred.');
      },
    });
  });

  $("#form_edit_cart").submit(function (e) {
    e.preventDefault();
    $.ajax({
      type: $(this).attr('method'),
      url: $(this).attr('action'),
      data: $(this).serialize(),
      success: function (data) {
        let dataArr = data.split("|");
        let remove = dataArr[0];
        if(remove=="remove") {
          $("#product-item-"+dataArr[1]).remove();
          var priceCart = parseInt(dataArr[2]);
          $('#price_decreased').html(priceCart.toLocaleString("vi-VN", { style: "currency", currency: "VND" }));
        } else {
          var dataObject = JSON.parse(data);
          for(var i = 0; i < dataObject.length; i++) {
            var id = dataObject[i].id;
            var price = dataObject[i].price;
            $('#price-product-id-'+id).text(price.toLocaleString("vi-VN", { style: "currency", currency: "VND" }));
          }
          var cartPrice = dataObject[dataObject.length-1].priceCart;
          $('#price_decreased').html(cartPrice.toLocaleString("vi-VN", { style: "currency", currency: "VND" }));
        }
      },
      error: function (data) {
        console.log('An error occurred.' + data);
      },
    });
  });





</script>

<script src="js/jquery.nicescroll.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/jquery.countdown.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
<script src="js/cart.js"></script>
<script src="js/account/bootstrap.min.js"></script>


</body>

</html>
