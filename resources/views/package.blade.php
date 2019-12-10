@include('layout.headerlink')


<body class="overflow-hidden">
    <!-- Overlay Div -->
    @include('layout.header')



    <div id="wrapper" class="preload">

        @include('layout.sidebar')
        <div id="main-container">
            <div id="breadcrumb">
                <ul class="breadcrumb">
                    <li><i class="fa fa-home"></i><a href="#"> Home/Package</a></li>
                    <li class="active"></li>
                </ul>
            </div><!-- /breadcrumb-->

            <div class="padding-md">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4><b>Package</b></h4>

                                {{-- <button type="button" class="btn btn-primary btn-xs pull-right btnhideshow"><i
                                        class="fa fa-plus"></i> @lang('site_lables.Add_New')</button> --}}
                            </div>
                            <div class="panel-body ">
                                <div class="row " id="documents">

                                    <form id="master_form" name="master_form">
                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <label>Package Name*</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <input type="text" class="form-control input-sm placeholdesize"
                                                    placeholder="Package Name" id="package_name" name="package_name" required>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <label>Package Point*</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <input type="text" class="form-control input-sm placeholdesize"
                                                    id="package_point" name="package_point" placeholder="Package Point" required>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <label>Package Price*</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <input type="number" class="form-control input-sm placeholdesize"
                                                   style="text-align:right;" placeholder="Package Price"  min="0" value="0" id="package_price" name="package_price" required>
                                            </div>
                                        </div>

                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <label>Status*</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <input type="hidden" id="statusinfo" name="statusinfo" value="">
                                                <input type="checkbox"  id="status" checked data-toggle="toggle"      data-on="Active" data-off="Inactive"  data-onstyle="success" data-offstyle="danger"  required>
                                                {{-- <input type="checkbox" id="status" name="status" value=""> --}}
                                            </div>
                                        </div>






                                        <div class="col-lg-12">
                                            <div class="col-lg-10"></div>
                                            <div class="col-lg-2 " style="text-align: right">
                                                <input type="hidden" id="save_update" name="save_update" value="">

                                                <button type="submit" id="btnsave"
                                                    class="btn btn-sm btn-success btn-sm ">@lang('site_lables.Save')</button>

                                                <button type="button"
                                                    class="btn btn-sm btn-info  closehideshow">@lang('site_lables.Cancel')</button>
                                            </div>

                                        </div>

                                    </form>
                                </div>

                            </div><!-- /panel -->
                        </div><!-- /panel -->


                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4><b>Package List</b></h4>

                                {{-- <button type="button" class="btn btn-primary btn-xs pull-right btnhideshow"><i
                                                                class="fa fa-plus"></i> @lang('site_lables.Add_New')</button> --}}
                            </div>
                            <div class="panel-body ">

                                <div class="table-responsive" id="show_master">
                                    {{-- <table class="table-striped" id="data_table" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>Package Name</th>
                                                <th>Package Point</th>
                                                <th>Package Price</th>
                                                <th>Action</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Ajaz</td>
                                                <td>5</td>
                                                <td>500</td>
                                                <td><Button type="button" class="btn btn-primary"><i
                                                            class="fa fa-edit"></i></Button>&nbsp;<Button type="button"
                                                        class="btn btn-danger"><i class="fa fa-trash-o"></i></Button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ajaz</td>
                                                <td>5</td>
                                                <td>500</td>
                                                <td><Button type="button" class="btn btn-primary"><i
                                                            class="fa fa-edit"></i></Button>&nbsp;<Button type="button"
                                                        class="btn btn-danger"><i class="fa fa-trash-o"></i></Button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ajaz 55</td>
                                                <td>9</td>
                                                <td>5660</td>
                                                <td><Button type="button" class="btn btn-primary"><i
                                                            class="fa fa-edit"></i></Button>&nbsp;<Button type="button"
                                                        class="btn btn-danger"><i class="fa fa-trash-o"></i></Button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ajaz 9</td>
                                                <td>51/td>
                                                <td>600</td>
                                                <td><Button type="button" class="btn btn-primary"><i
                                                            class="fa fa-edit"></i></Button>&nbsp;<Button type="button"
                                                        class="btn btn-danger"><i class="fa fa-trash-o"></i></Button>
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table> --}}
                                </div>








                            </div><!-- /panel -->
                        </div><!-- /panel -->
                    </div><!-- /.col -->




                </div>
            </div><!-- /.padding-md -->
        </div><!-- /main-container -->

        @include('layout.footer')


    </div><!-- /wrapper -->

    <a href="" id="scroll-to-top" class="hidden-print"><i class="fa fa-chevron-up"></i></a>


    <!-- Logout confirmation -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

    @include('layout.footerlink')

</body>

<script>
    $("#data_table").DataTable();
</script>

<script type="text/javascript">
    $(document).ready(function () {
    $.ajaxSetup({
    headers: {
    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
    });

});
var add_data="{{route('package.store') }}";
var delete_data="{{url('deletepackage')}}";
var changestatus="{{ url('changestatus') }}";
var checkpackagename="{{ url('chackpackagename') }}";
</script>
<script>
    $('.dob').datepicker({
                       'todayHighlight': true,
                       format: 'dd/mm/yyyy',
                       autoclose: true,
                  });
                  var date = new Date();
                  date = date.toString('dd/MM/yyyy');
                  $("#dob").val(date);
                  //  $("#fdate").val(date);

                  $('#status').bootstrapToggle({
                on: 'Active',
                off: 'Inactive'
                });
</script>
<script type='text/javascript' src="{{ URL::asset('/resources/js/myjs/package_master.js',true) }}">
</script>
</html>
