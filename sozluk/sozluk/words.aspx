<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim.Master" AutoEventWireup="true" CodeBehind="words.aspx.cs" Inherits="sozluk.kelimeler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

     <script type="text/javascript">
        function getConfirmation(sender, title, message) {
            $("#spnTitle").text(title);
            $("#spnMsg").text(message);
            $('#modalPopUp').modal('show');
            $('#btnConfirm').attr('onclick', "$('#modalPopUp').modal('hide');setTimeout(function(){" + $(sender).prop('href') + "}, 50);");
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContents" runat="server">
    <div>
        <div id="modalPopUp" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">
                            <span id="spnTitle"></span>
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group row">
                            <label for="" class="col-sm-4 col-form-label">Kelime</label>
                            <div class="col-sm-8">
                                <asp:textbox runat="server" id="txtKelime" class="form-control" placeholder="" text=""></asp:textbox>
                                <asp:requiredfieldvalidator forecolor="Red" Validationgroup="valAdd" controltovalidate="txtKelime"
                                    id="rfvAdAdi" runat="server" errormessage="*Zorunlu Alan"></asp:requiredfieldvalidator>
                                <br />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-4 col-form-label">Kelime Anlami</label>
                            <div class="col-sm-8">
                                <asp:textbox runat="server" id="txtKelimeAnlam" class="form-control" placeholder="" text=""></asp:textbox>
                                <asp:requiredfieldvalidator forecolor="Red" Validationgroup="valAdd" controltovalidate="txtKelimeAnlam"
                                    id="rfvAdiSoyadi" runat="server" errormessage="*Zorunlu Alan"></asp:requiredfieldvalidator>
                                <br />
                            </div>
                        </div>
                      
                        <div class="form-group row">
                            <label for="" class="col-sm-4 col-form-label">Kelime Dili</label>
                            <div class="col-sm-8">
                                <asp:dropdownlist runat="server" id="ddlDil" cssclass="form-control">
                                            <asp:ListItem Text="Türkçe" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="İngilizce" Value="0"></asp:ListItem>
                                        </asp:dropdownlist>
                                <br />
                            </div>
                        </div>
                       
                        <div class="form-group row">
                            <label for="" class="col-sm-4 col-form-label"></label>
                            <div class=" col-sm-8">
                                <div class="checkbox">
                                    <label>
                                        <asp:checkbox runat="server" class="form-check-input" id="chkActive" checked="true" text="Aktif Mi?" />
                                    </label>
                                </div>
                            </div>
                        </div>
                        <p>
                            <span id="spnMsg"></span>.
                        </p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-black" data-dismiss="modal">Kapat</button>
                        <asp:button id="btnConfirm" runat="server" text="Kaydet" class="btn btn" ValidationGroup="valAdd" forecolor="Green" OnClick="lnkDelete_Click"/>
                        <%--     <button type="button" id="btnConfirm" class="btn btn-danger" >
                            Kaydet</button>--%>
                    </div>
                </div>
            </div>
        </div>

     
    </div>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">

                <!-- /.box -->

                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Kelime Listesi</h3>
                    </div>
                    <a />
                    <%-- CssClass="btn btn-danger"--%>
                    <asp:linkbutton id="lnkDelete" runat="server" cssclass="btn btn-primary btn-block btn-flat" onclientclick="return getConfirmation(this, 'Yeni Kelime Kaydı','');" onclick="lnkDelete_Click">&nbsp;Kelime Ekle &nbsp;&nbsp;<i class="fa fa-plus"></i></asp:linkbutton>
                    <br />
                    <asp:literal id="litMsg" runat="server"></asp:literal>
                    <%-- <asp:Button ID="btn1" runat="server" class="btn btn-primary btn-block btn-flat" Text="Kullanıcı Ekle +" OnClick="Page_Load" />--%>

                    <a></a>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="example1" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Kelime</th>
                                    <th>Anlamı</th>
                                    <th>Kelime Dili</th>
                                    <th>Aktif mi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:literal id="ltrUserInfo" runat="server"></asp:literal>

                            </tbody>

                        </table>
                    </div>


                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </section>
    <!-- /.content -->

    <!-- Control Sidebar -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphScripts" runat="server">
    <!-- jQuery 3 -->
    <script src="../AdminLTE/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="../AdminLTE/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- DataTables -->
    <script src="../AdminLTE/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="../AdminLTE/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <!-- SlimScroll -->
    <script src="../AdminLTE/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="../AdminLTE/bower_components/fastclick/lib/fastclick.js"></script>
    <!-- AdminLTE App -->
    <script src="../AdminLTE/dist/js/adminlte.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="../AdminLTE/dist/js/demo.js"></script>
    <!-- page script -->
    <script>
        $(function () {
            $('#example1').DataTable()
            $('#example2').DataTable({
                'paging': true,
                'lengthChange': false,
                'searching': false,
                'ordering': true,
                'info': true,
                'autoWidth': false
            })
        })
    </script>
</asp:Content>
