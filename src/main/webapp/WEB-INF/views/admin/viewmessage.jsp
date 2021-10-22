<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>L.A.N | Xem tin nhắn</title>
</head>

<body>
<div class="info-product">
    <div class="container-fluid">
        <div class="container-fluid">

            <div class="row">
                <div class="col-12">
                    <section class="section">
                        <div class="card">
                            <!-- all product-tab -->
                            <div class="card-body">
                                <table class='table table-striped' id="table1">
                                    <thead>
                                    <tr>

                                        <th>Họ tên</th>
                                        <th>Email</th>
                                        <th>Tiêu đề</th>
                                        <th>Ngày gửi</th>
                                        <th>
                                            Trạng thái
                                        </th>

                                    </tr>
                                    </thead>

                                    <tr>
                                        <td><a href="#">Tô Thảo Nhả</a>
                                        </td>
                                        <td>nhato2000@gmail.com</td>
                                        <td>Mua hàng</td>
                                        <td>18/11/2020</td>
                                        <td><a href="replymessage.jsp">Phản hồi</a></td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="#"></a>Bùi Thái Mỹ Linh</a>
                                        </td>
                                        <td>mylinh123@gmail.com</td>
                                        <td>Hoàn trả hàng</td>
                                        <td>1/12/2020</td>
                                        <td><a href="">Đã phản hồi</a></td>


                                    </tr>

                                </table>
                            </div>
                        </div>

                    </section>
                </div>
            </div>

        </div>
    </div>
</div>
</body>

</html>