<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>


    <link rel="stylesheet" href="assets/css/alloder.css">


    <link rel="stylesheet" href="./assets/fonts/font-awesome-4.7.0/fonts/fontawesome-webfont.woff">


    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>L.A.N | Phản hồi tin nhắn</title>

</head>

<body>
<div class="main-content container-fluid">
    <div class="card-body">
        <div class="container-fluid">


            <div class="row">

                <div class="col-lg-2 col-md-4 col-6">
                    <p>Tên người nhận:<u></u> <span class="span-title-product">*</span></p>
                </div>
                <div class="col-lg-10 col-md-8 col-6">
                    <textarea name="" cols="100" rows="1" placeholder="Tô Thảo Nhả"></textarea>
                </div>
                <div class="col-lg-2 col-md-4 col-6">
                    <p>Email:<u></u> <span class="span-title-product">*</span></p>
                </div>

                <div class="col-lg-10 col-md-8 col-6">
                    <textarea name="" cols="100" rows="1" placeholder="nhato2000@gmail.com"></textarea>
                </div>
                <div class="col-lg-2 col-md-4 col-6">
                    <p>Tiêu đề:<u></u> <span class="span-title-product">*</span></p>
                </div>
                <div class="col-lg-10 col-md-8 col-6">
                    <textarea name="" id="" cols="100" rows="3"></textarea>
                </div>
            </div>
            <div class="gap-sm"></div>
            <div class="row">

            </div>

        </div>

    </div>
    <p>Phản hồi tin nhắn</p>
    <section class="section">
        <div class="card">

            <div class="card-body">

                <div id="full">
                    <p>Nhập nội dung...</p>
                    <p><br></p>
                    <p><br></p>
                    <p><br></p>
                    <p><br></p>
                    <p><br></p>
                    <p><br></p>
                </div>
            </div>
        </div>
    </section>
    <div>
        <button class="btn btn-outline-primary">Gửi</button>
        <button class="btn btn-outline-danger">Hủy</button>
    </div>
</div>
</body>

</html>