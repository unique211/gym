@include('layout.headerlink')


<body class="overflow-hidden">
    <!-- Overlay Div -->
    @include('layout.header')



    <div id="wrapper" class="preload">

        @include('layout.sidebar')
        <div id="main-container">
            <div id="breadcrumb">
                <ul class="breadcrumb">
                    <li><i class="fa fa-home"></i><a href="#"> Home/Gallary</a></li>
                    <li class="active"></li>
                </ul>
            </div><!-- /breadcrumb-->

            <div class="padding-md">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4><b>Gallary</b></h4>

                                {{-- <button type="button" class="btn btn-primary btn-xs pull-right btnhideshow"><i
                                        class="fa fa-plus"></i> @lang('site_lables.Add_New')</button> --}}
                            </div>
                            <div class="panel-body ">
                                <div class="row " id="documents">

                                    <form id="master_form" name="master_form">
                                        <div class="row">
                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <label>Upload Image or Video*</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <input type="file" id="upload" name="upload" class="form-control" accept="video/*,image/*" required>
                                                <input type="hidden" id="uploadimg_hidden" name="uploadimg_hidden" value="">
                                                <div id="msg" name="msg"></div>
                                            </div>
                                        </div>

                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <label>No of likes*</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <input type="text" name="likes" id="likes" class="form-control input-sm"
                                                    required>
                                            </div>
                                        </div>

                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <label>Allow share of post*</label>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="form-group">

                                                    <input type="hidden" id="allowshare" name="allowshare" value="">
                                                    <input type="checkbox"  id="share" checked data-toggle="toggle"      data-on="Yes" data-off="No"  data-onstyle="success" data-offstyle="danger"  >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                            {{-- <div class="col-sm-2">
                                                    <div class="form-group">
                                                        <label>Status</label>
                                                    </div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="form-group">
        
                                                            <input type="hidden" id="statusinfo" name="statusinfo" value="">
                                                            <input type="checkbox"  id="status" name="status" checked data-toggle="toggle"      data-on="Active" data-off="Inactive"  data-onstyle="success" data-offstyle="danger"  >
                                                    </div>
                                                </div> --}}
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
                                <h4><b>Gallary List</b></h4>

                                {{-- <button type="button" class="btn btn-primary btn-xs pull-right btnhideshow"><i
                                                                class="fa fa-plus"></i> @lang('site_lables.Add_New')</button> --}}
                            </div>
                            <div class="panel-body ">

                                <div class="table-responsive" id="show_master">
                                    <table class="table-striped" id="data_table" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>no of Likes</th>
                                                <th>Allow share of post</th>


                                                <th>Action</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>05</td>
                                                <td>Yes</td>
                                                <td><Button type="button" class="btn btn-primary"><i
                                                            class="fa fa-edit"></i></Button>&nbsp;<Button type="button"
                                                        class="btn btn-danger"><i class="fa fa-trash-o"></i></Button>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>15</td>
                                                <td>No</td>
                                                <td><Button type="button" class="btn btn-primary"><i
                                                            class="fa fa-edit"></i></Button>&nbsp;<Button type="button"
                                                        class="btn btn-danger"><i class="fa fa-trash-o"></i></Button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>45</td>
                                                <td>Yes</td>
                                                <td><Button type="button" class="btn btn-primary"><i
                                                            class="fa fa-edit"></i></Button>&nbsp;<Button type="button"
                                                        class="btn btn-danger"><i class="fa fa-trash-o"></i></Button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
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

      // var getallcategory="{{ url('getallcategory') }}";
       $("#data_table").DataTable();

});

</script>
<script>
      var uploadfileurl="{{ url('galleryuploadimg') }}";
      var add_data="{{route('gallery.store') }}";
      var changepostshare="{{ url('changepostshare')}}";
      var delete_data="{{ url('deletegallary')}}";
    $('.clockpicker').clockpicker();
        $('.datetimepicker').datetimepicker({

        format: 'DD/MM/YYYY hh:mm:ss',

        });
$('.date').datepicker({
'todayHighlight': true,
format: 'dd/mm/yyyy',
autoclose: true,
});
var date = new Date();
date = date.toString('dd/MM/yyyy');

                  $("#start_date").val(date);
                    $("#end_date").val(date);

                    // $('#share').bootstrapToggle({
                    // on: 'Yes',
                    // off: 'No'
                    // });
</script>
<script type='text/javascript' src="{{ URL::asset('/resources/js/myjs/gallerymaster.js',true) }}"></script>
</html>
