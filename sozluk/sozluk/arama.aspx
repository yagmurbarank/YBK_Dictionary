<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="arama.aspx.cs" Inherits="sozluk.arama" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic" />



    <style>

    </style>
</head>

<body background="img/space.png">

    <header class="main-header" />
        <!-- Logo -->
        <a href="../../index2.html" class="logo" style="color: #ffffff; font-size: 31px;">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>A</b>LT</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>YBK </b>Sözlük</span>
        </a>
  
    <!-- Header Navbar: style can be found in header.less -->

    <form id="form1" runat="server">
     
          <div class="col-md-12" style="background-color: black; min-height: 195px; padding-left: 145px; padding-top:110px;">
            <!-- Horizontal Form -->
           
            <div class="box-header with-border">
                <%-- <h3 class="box-title">İngilizce-Türkçe Sözlük</h3>--%>
                <h2 class="box-title">
                    <asp:Label ID="lblBaslik" class="title" style=" color:white; font-size:medium;" runat="server" Text=""></asp:Label>
                </h2>


                <!-- /.box-header -->
                <!-- form start -->

                <div class="box-body" style="height:40%">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label"></label>

                        <div class="col-sm-10" style=" width: 50%;">
                           
                            <asp:TextBox ID="txtkelime" runat="server" class="form-control" placeholder="Kelime Giriniz / Enter a Word"></asp:TextBox>
                      </div>
                    </div>
                    


                </div>
            </div>
            <!-- /.box-body -->
             
            <div class="box-footer" style="color:black; Background:black; ">

                <asp:Button ID="btnAra" runat="server" Text="Ara" class="btn btn-success pull-right"  Style=" margin-right:35%; color:white; background-color: #3b495c; border-color: #384457; font-size:medium" OnClick="btnAra_Click " />
            </div>
            <!-- /.box-footer -->


            <!-- /.box -->
            <!-- general form elements disabled -->
           
            <!--  <input class="form-control" type="text" placeholder="Aranan kelimenin anlamı..."> 
            <!-- /.box -->
            <br />

            <br />

            <asp:Label ID="Label1" runat="server" Text="Kelimenin Anlamı:" font-color="White"
                Style="margin-left: 20%; color:white; font-size:medium; font-weight: 600; padding-top:1ocm;"></asp:Label>
            <asp:Label ID="Lblanlam" runat="server" style="color:white; font-size:medium;" Text=""></asp:Label>
            <!-- /.box -->
        </div>


    </form>



</body>
</html>
