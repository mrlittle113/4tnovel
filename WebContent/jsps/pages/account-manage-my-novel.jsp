<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>ABC</title>
<meta name="viewport" content="width=divice-width, intitial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- the following to include all needed things 
	font
	font awesome icon
	bootstraps custom-mize if you have using button , grid-system
	custom css
-->
	<link
	href="https://fonts.googleapis.com/css?family=Exo:400,400i,500,500i,800&amp;subset=vietnamese"
	rel="stylesheet">
    <link rel="stylesheet" href="resources/vendors/css/bootstrap-customize.css">
    <link rel="stylesheet" href="resources/local/css/style.css" />
</head> 
<body>
    <div class="account-manage">
        <%@ include file = "/jsps/components/_account-manage.header.jsp" %>
        <div class="account-manage__content u-row--1140 u-centered u-border-full">
            <div>
                <p class="u-3x u-align-center">Truyện của tui</p>
            </div>
            <br>
            <div class="row u-2x u-padding--05rem">
                <div class="col-md-6">Tên truyện</div>
                <div class="col-md-2">Người đăng</div>
                <div class="col-md-2">Nhóm dịch</div>
                <div class="col-md-2">Thao tác</div>
            </div>
            <hr>
            <section>
                <div class="row u-padding--05rem">
                    <button class="col-md-6 btn btn-belike-a u-align-left" onclick="showOrHide('n1-v')">Watashi wa iku iku</button>
                    <a href="#" class="col-md-2 btn btn-belike-a u-align-left">Kanojo</a>
                    <a href="#" class="col-md-2 btn btn-belike-a u-align-left">Cancer</a>
                    <div class="col-md-2">
                        <button class="btn btn-primary u-color-white">Sửa</button>
                        <button class="btn btn-danger u-color-white">Xóa</button>
                    </div>
                </div>
                <div id="n1-v" style="display: none; background-color: #f0f0f0">
                    <div class="row u-padding--05rem">
                        <button class="col-md-10 btn btn-belike-a u-align-left" onclick="showOrHide('n1-v1-c')">vol1</button>
                        <div class="col-md-2">
                            <button class="btn btn-primary u-color-white">Sửa</button>
                            <button class="btn btn-danger u-color-white">Xóa</button>
                        </div>
                    </div>
                    <div id="n1-v1-c" class="u-padding-bottom--05rem u-padding-right--05rem" style="display: none; background-color: #e8e8e8">
                        <div class="row">
                            <button class="col-md-10 btn btn-belike-a u-align-left">chương 1</button>
                            <div class="col-md-2">
                                <button class="btn btn-primary u-color-white">Sửa</button>
                                <button class="btn btn-danger u-color-white">Xóa</button>
                            </div>
                        </div>
                        <div class="row">
                            <button class="col-md-10 btn btn-belike-a u-align-left">chương 2</button>
                            <div class="col-md-2">
                                <button class="btn btn-primary u-color-white">Sửa</button>
                                <button class="btn btn-danger u-color-white">Xóa</button>
                            </div>
                        </div>
                        <div class="row">
                            <button class="col-md-10 btn btn-belike-a u-align-left">chương 3</button>
                            <div class="col-md-2">
                                <button class="btn btn-primary u-color-white">Sửa</button>
                                <button class="btn btn-danger u-color-white">Xóa</button>
                            </div>
                        </div>
                        <div class="row">
                            <button class="col-md-10 btn btn-belike-a u-align-left">chương 4</button>
                            <div class="col-md-2">
                                <button class="btn btn-primary u-color-white">Sửa</button>
                                <button class="btn btn-danger u-color-white">Xóa</button>
                            </div>
                        </div>
                        <div class="row">
                            <button class="col-md-10 btn btn-belike-a u-align-left">chương 5</button>
                            <div class="col-md-2">
                                <button class="btn btn-primary u-color-white">Sửa</button>
                                <button class="btn btn-danger u-color-white">Xóa</button>
                            </div>
                        </div>
                    </div>
                
                    <div class="row u-padding--05rem">
                        <button class="col-md-10 btn btn-belike-a u-align-left" onclick="showOrHide('n1-v2-c')">vol2</button>
                        <div class="col-md-2">
                            <button class="btn btn-primary u-color-white">Sửa</button>
                            <button class="btn btn-danger u-color-white">Xóa</button>
                        </div>
                    </div>
                     <div id="n1-v2-c" class="u-padding-bottom--05rem u-padding-right--05rem" style="display: none; background-color: #e4e4e4">
                        <div class="row">
                            <button class="col-md-10 btn btn-belike-a u-align-left">chương 1</button>
                            <div class="col-md-2">
                                <button class="btn btn-primary u-color-white">Sửa</button>
                                <button class="btn btn-danger u-color-white">Xóa</button>
                            </div>
                        </div>
                        <div class="row">
                            <button class="col-md-10 btn btn-belike-a u-align-left">chương 2</button>
                            <div class="col-md-2">
                                <button class="btn btn-primary u-color-white">Sửa</button>
                                <button class="btn btn-danger u-color-white">Xóa</button>
                            </div>
                        </div>
                        <div class="row">
                            <button class="col-md-10 btn btn-belike-a u-align-left">chương 3</button>
                            <div class="col-md-2">
                                <button class="btn btn-primary u-color-white">Sửa</button>
                                <button class="btn btn-danger u-color-white">Xóa</button>
                            </div>
                        </div>
                        <div class="row">
                            <button class="col-md-10 btn btn-belike-a u-align-left">chương 4</button>
                            <div class="col-md-2">
                                <button class="btn btn-primary u-color-white">Sửa</button>
                                <button class="btn btn-danger u-color-white">Xóa</button>
                            </div>
                        </div>
                        <div class="row">
                            <button class="col-md-10 btn btn-belike-a u-align-left">chương 5</button>
                            <div class="col-md-2">
                                <button class="btn btn-primary u-color-white">Sửa</button>
                                <button class="btn btn-danger u-color-white">Xóa</button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            
            <section>
                <div class="row u-padding--05rem">
                    <button class="col-md-6 btn btn-belike-a u-align-left" onclick="showOrHide('n2-v')">Boku mo iku iku</button>
                    <a href="#" class="col-md-2 btn btn-belike-a u-align-left">Watashi</a>
                    <a href="#" class="col-md-2 btn btn-belike-a u-align-left">Cancer</a>
                    <div class="col-md-2">
                        <button class="btn btn-primary u-color-white">Sửa</button>
                        <button class="btn btn-danger u-color-white">Xóa</button>
                    </div>
                </div>
                <div id="n2-v" style="display: none; background-color: #f0f0f0">
                    <div class="row u-padding--05rem">
                        <button class="col-md-10 btn btn-belike-a u-align-left" onclick="showOrHide('n2-v1-c')">vol1</button>
                        <div class="col-md-2">
                            <button class="btn btn-primary u-color-white">Sửa</button>
                            <button class="btn btn-danger u-color-white">Xóa</button>
                        </div>
                    </div>
                    <div id="n2-v1-c" class="u-padding-bottom--05rem u-padding-right--05rem" style="display: none; background-color: #e8e8e8">
                        <div class="row">
                            <button class="col-md-10 btn btn-belike-a u-align-left">chương 1</button>
                            <div class="col-md-2">
                                <button class="btn btn-primary u-color-white">Sửa</button>
                                <button class="btn btn-danger u-color-white">Xóa</button>
                            </div>
                        </div>
                        <div class="row">
                            <button class="col-md-10 btn btn-belike-a u-align-left">chương 2</button>
                            <div class="col-md-2">
                                <button class="btn btn-primary u-color-white">Sửa</button>
                                <button class="btn btn-danger u-color-white">Xóa</button>
                            </div>
                        </div>
                        <div class="row">
                            <button class="col-md-10 btn btn-belike-a u-align-left">chương 3</button>
                            <div class="col-md-2">
                                <button class="btn btn-primary u-color-white">Sửa</button>
                                <button class="btn btn-danger u-color-white">Xóa</button>
                            </div>
                        </div>
                        <div class="row">
                            <button class="col-md-10 btn btn-belike-a u-align-left">chương 4</button>
                            <div class="col-md-2">
                                <button class="btn btn-primary u-color-white">Sửa</button>
                                <button class="btn btn-danger u-color-white">Xóa</button>
                            </div>
                        </div>
                        <div class="row">
                            <button class="col-md-10 btn btn-belike-a u-align-left">chương 5</button>
                            <div class="col-md-2">
                                <button class="btn btn-primary u-color-white">Sửa</button>
                                <button class="btn btn-danger u-color-white">Xóa</button>
                            </div>
                        </div>
                    </div>
                
                    <div class="row u-padding--05rem">
                        <button class="col-md-10 btn btn-belike-a u-align-left" onclick="showOrHide('n2-v2-c')">vol2</button>
                        <div class="col-md-2">
                            <button class="btn btn-primary u-color-white">Sửa</button>
                            <button class="btn btn-danger u-color-white">Xóa</button>
                        </div>
                    </div>
                     <div id="n2-v2-c" class="u-padding-bottom--05rem u-padding-right--05rem" style="display: none; background-color: #e4e4e4">
                        <div class="row">
                            <button class="col-md-10 btn btn-belike-a u-align-left">chương 1</button>
                            <div class="col-md-2">
                                <button class="btn btn-primary u-color-white">Sửa</button>
                                <button class="btn btn-danger u-color-white">Xóa</button>
                            </div>
                        </div>
                        <div class="row">
                            <button class="col-md-10 btn btn-belike-a u-align-left">chương 2</button>
                            <div class="col-md-2">
                                <button class="btn btn-primary u-color-white">Sửa</button>
                                <button class="btn btn-danger u-color-white">Xóa</button>
                            </div>
                        </div>
                        <div class="row">
                            <button class="col-md-10 btn btn-belike-a u-align-left">chương 3</button>
                            <div class="col-md-2">
                                <button class="btn btn-primary u-color-white">Sửa</button>
                                <button class="btn btn-danger u-color-white">Xóa</button>
                            </div>
                        </div>
                        <div class="row">
                            <button class="col-md-10 btn btn-belike-a u-align-left">chương 4</button>
                            <div class="col-md-2">
                                <button class="btn btn-primary u-color-white">Sửa</button>
                                <button class="btn btn-danger u-color-white">Xóa</button>
                            </div>
                        </div>
                        <div class="row">
                            <button class="col-md-10 btn btn-belike-a u-align-left">chương 5</button>
                            <div class="col-md-2">
                                <button class="btn btn-primary u-color-white">Sửa</button>
                                <button class="btn btn-danger u-color-white">Xóa</button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            

        </div>
    </div>
    <script>
        function showOrHide(id) {
            var x = document.getElementById(id);
            if (x.style.display =='none') {
                x.style.display = 'block';
            } else {
                x.style.display = 'none';
            }
        }
    </script>
</body>
</html>