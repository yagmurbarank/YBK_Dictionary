<%@ Page Title="" Language="C#" MasterPageFile="~/yonetim.Master" AutoEventWireup="true" CodeBehind="users.aspx.cs" Inherits="sozluk.users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
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
                            <label for="" class="col-sm-4 col-form-label">Adı</label>
                            <div class="col-sm-8">
                                <asp:TextBox runat="server" ID="txtAd" class="form-control" placeholder="Adı" Text=""></asp:TextBox>
                                <asp:RequiredFieldValidator ForeColor="Red" ValidationGroup="valAdd" ControlToValidate="txtAd"
                                    ID="rfvAdAdi" runat="server" ErrorMessage="*Zorunlu Alan"></asp:RequiredFieldValidator>
                                <br />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-4 col-form-label">Soyadi</label>
                            <div class="col-sm-8">
                                <asp:TextBox runat="server" ID="txtSoyad" class="form-control" placeholder="Soyadi" Text=""></asp:TextBox>
                                <asp:RequiredFieldValidator ForeColor="Red" ValidationGroup="valAdd" ControlToValidate="txtAd"
                                    ID="rfvAdiSoyadi" runat="server" ErrorMessage="*Zorunlu Alan"></asp:RequiredFieldValidator>
                                <br />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-4 col-form-label">Eposta</label>
                            <div class="col-sm-8">
                                <asp:TextBox runat="server" ID="txtEposta" class="form-control" placeholder="Eposta" Text=""></asp:TextBox>
                              <asp:RequiredFieldValidator ForeColor="Red" ValidationGroup="valAdd" ControlToValidate="txtAd"
                                    ID="rfvAdieEposta" runat="server" ErrorMessage="*Zorunlu Alan"></asp:RequiredFieldValidator>
                                <br />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-4 col-form-label">Sifre</label>
                            <div class="col-sm-8">
                                <asp:TextBox runat="server" ID="txtSifre" class="form-control" placeholder="Sifre" Text=""></asp:TextBox>
                                <asp:RequiredFieldValidator ForeColor="Red" ValidationGroup="valAdd" ControlToValidate="txtAd"
                                    ID="rfvAdiSifre" runat="server" ErrorMessage="*Zorunlu Alan"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                          <div class="form-group row">
                                        <label for="" class="col-sm-4 col-form-label"></label>
                                        <div class=" col-sm-8">
                                            <div class="checkbox">
                                                <label>
                                                    <asp:CheckBox runat="server" class="form-check-input" ID="chkActive" Checked="true" Text="Aktif Mi?" />
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
                        <asp:Button id="btnConfirm" runat="server" Text="Kaydet" class="btn btn" ValidationGroup="valAdd" ForeColor="Green" OnClick="lnkDelete_Click"/>
                   <%--     <button type="button" id="btnConfirm" class="btn btn-danger" >
                            Kaydet</button>--%>
                    </div>
                </div>
            </div>
        </div>

        <%--<asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-danger" OnClientClick="return getConfirmation(this, 'Please confirm','Are you sure you want to delete?');"  OnClick="lnkDelete_Click"><i class="glyphicon glyphicon-trash"></i>&nbsp;Delete</asp:LinkButton>          <br />
            <asp:Literal ID="litMsg" runat="server"></asp:Literal>  --%>
    </div>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-xs-12">

                <!-- /.box -->

                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Kullanicilar</h3>
                    </div>
                    <a />
                    <%-- CssClass="btn btn-danger"--%>
                    <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-primary btn-block btn-flat" OnClientClick="return getConfirmation(this, 'Kullanici Kayit Islemi','');" OnClick="lnkDelete_Click">&nbsp;Kullanıcı Ekle &nbsp;&nbsp;<i class="fa fa-plus"></i></asp:LinkButton>
                    <br />
                    <asp:Literal ID="litMsg" runat="server"></asp:Literal>
                    <%-- <asp:Button ID="btn1" runat="server" class="btn btn-primary btn-block btn-flat" Text="Kullanıcı Ekle +" OnClick="Page_Load" />--%>

                    <a></a>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="example1" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Adi</th>
                                    <th>Soyadi</th>
                                    <th>Eposta</th>
                                    <th>Sifre</th>
                                    <th>Aktif mi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Literal ID="ltrUserInfo" runat="server"></asp:Literal>

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
