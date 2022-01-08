<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs*" Inherits="sozluk.arama" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>YBK Dictionary</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="../AdminLTE/bower_components/bootstrap/dist/css/bootstrap.min.css"/>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../AdminLTE/bower_components/font-awesome/css/font-awesome.min.css"/>
    <!-- Ionicons -->
    <link rel="stylesheet" href="../AdminLTE/bower_components/Ionicons/css/ionicons.min.css"/>
    <!-- Theme style -->
    <link rel="stylesheet" href="../AdminLTE/dist/css/AdminLTE.min.css"/>
    <!-- iCheck -->
    <link rel="stylesheet" href="../AdminLTE/plugins/iCheck/square/blue.css"/>
      <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="../AdminLTE/dist/css/skins/_all-skins.min.css"/>
    <link rel="shortcut icon" type="image/x-icon" href="img/y.png" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"/>

 <Body background="img/nasa.jpg"> 
</style>

</head>



<body>
    <form id="form1" runat="server">
        <div class="login-box">
            <div class="login-logo">
                <a href="../../y.png"><b>YBK</b> Dictionary</a>
            </div>
            <!-- /.login-logo -->
            <div class="login-box-body">
                <p class="login-box-msg">Giriş Yapmak İçin Oturum Açınız.</p>


               
                    <div class="form-group has-feedback">

                        <%--  <input type="email" id="txtEmail" class="form-control" placeholder="Email" runat="server">--%>
                        <asp:TextBox ID="txtEmail2" runat="server" class="form-control" placeholder="Email"></asp:TextBox>
                         <asp:RequiredFieldValidator ForeColor="Red" ValidationGroup="valAdd" ControlToValidate="txtEmail2"
                                                ID="rfvAdiSoyadi" runat="server" ErrorMessage="*Zorunlu Alan"></asp:RequiredFieldValidator>
                        <%--      <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator2"class="form-control" runat="server" 
Style="top: 98px; left: 367px; position: absolute; height: 26px; width: 162px" 
ErrorMessage="User is required" ControlToValidate="Giriş"/>
</asp:RequiredFieldValidator> --%>
                    </div>
                    <div class="form-group has-feedback">
                        <%--  <input type="password" id="txtPass" class="form-control" placeholder="Şifre" runat="server">--%>
                        <asp:TextBox ID="txtPass2" runat="server" class="form-control" placeholder="Şifre" TextMode="Password"> </asp:TextBox>
        <asp:RequiredFieldValidator ForeColor="Red" ValidationGroup="valAdd" ControlToValidate="txtPass2"
                                                ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Zorunlu Alan"></asp:RequiredFieldValidator>


                    </div>
                  <div class="form-group has-feedback" runat="server" visible="false" id="divError">

                      <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label>

                    </div>
                    <div class="row">
                        <div class="col-xs-8">
                            <div class="checkbox icheck">
                            </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-xs-4">
                            <%--  <button type="submit" class="btn btn-primary btn-block btn-flat">Giriş</button>--%>
                            <asp:Button ID="btnGiris" class="isActive-primary btn-block btn-flat" runat="server" ValidationGroup="valAdd" Text="Giriş" OnClick="btnGiris_Click" />


                        </div>
                        <!-- /.col -->
                    </div>
              




                <a href="#">Şifremi Unuttum.</a><br/>
            </div>
            <!-- /.login-box-body -->
        </div>



    </form>
    <!-- jQuery 3 -->
    <script src="../AdminLTE/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="../AdminLTE/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- iCheck -->
    <script src="../AdminLTE/plugins/iCheck/icheck.min.js"></script>
    <script>
        $(function () {
            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });
        });
</script>
</body>
</html>
