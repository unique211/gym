{{-- <div id="overlay" class="transparent"></div> --}}

{{--  <a href="" id="theme-setting-icon"><i class="fa fa-cog fa-lg"></i></a>  --}}
<div id="theme-setting">
    <div class="title">
        <strong class="no-margin">Skin Color</strong>
    </div>
    <div class="theme-box">
        <a class="theme-color" style="background:#323447" id="default"></a>
        <a class="theme-color" style="background:#efefef" id="skin-1"></a>
        <a class="theme-color" style="background:#a93922" id="skin-2"></a>
        <a class="theme-color" style="background:#3e6b96" id="skin-3"></a>
        <a class="theme-color" style="background:#635247" id="skin-4"></a>
        <a class="theme-color" style="background:#3a3a3a" id="skin-5"></a>
        <a class="theme-color" style="background:#495B6C" id="skin-6"></a>
    </div>
    <div class="title">
        <strong class="no-margin">Sidebar Menu</strong>
    </div>
    <div class="theme-box">
        <label class="label-checkbox">
            <input type="checkbox" checked id="fixedSidebar">
            <span class="custom-checkbox"></span>
            Fixed Sidebar
        </label>
    </div>
</div><!-- /theme-setting -->

<div id="top-nav" class="fixed skin-6">
    <a href="#" class="brand">
        <span>Gym</span>
        {{--  <span class="text-toggle">Classes</span>  --}}
    </a><!-- /brand -->
    <button type="button" class="navbar-toggle pull-left" id="sidebarToggle">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
    <button type="button" class="navbar-toggle pull-left hide-menu" id="menuToggle">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
    <ul class="nav-notification clearfix">

        <li class="profile dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <strong><?php echo Session::get('userid');?></strong>
                <span><i class="fa fa-chevron-down"></i></span>
            </a>
            <ul class="dropdown-menu">
                <li>
                    <a class="clearfix" href="#">
                        <img src="<?php echo url('/'); ?>/resources/sass/img/user.jpg" alt="User Avatar">
                        <div class="detail">
                            {{--  <strong>John Doe</strong>
                            <p class="grey">John_Doe@email.com</p>  --}}
                            <strong><?php echo Session::get('userid');?></strong>
                            <p class="grey">User Id : <?php echo Session::get('userid');?></p>
                            <p class="grey">Role : <?php echo Session::get('role');?></p>
                        </div>
                    </a>
                </li>
                {{--  <li><a tabindex="-1" href="profile.html" class="main-link"><i class="fa fa-edit fa-lg"></i> Edit
                        profile</a></li>
                <li><a tabindex="-1" href="gallery.html" class="main-link"><i class="fa fa-picture-o fa-lg"></i> Photo
                        Gallery</a></li>
                <li><a tabindex="-1" href="#" class="theme-setting"><i class="fa fa-cog fa-lg"></i> Setting</a></li>
                <li class="divider"></li>  --}}
                <li><a tabindex="-1" class="main-link logoutConfirm_open" href="#logoutConfirm"><i
                            class="fa fa-lock fa-lg"></i> Log out</a></li>
            </ul>
        </li>
    </ul>
</div><!-- /top-nav-->
