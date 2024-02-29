<?php
$notifications = optional(auth()->user())->unreadNotifications;
$notifications_count = optional($notifications)->count();
$notifications_latest = optional($notifications)->take(5);
?>

<header class="header header-sticky mb-2">
    <div class="container-fluid">
        <button class="header-toggler px-md-0 me-md-3" type="button" onclick="coreui.Sidebar.getInstance(document.querySelector('#sidebar')).toggle()">
            <i class="fa-solid fa-bars"></i>
        </button>
        <a class="header-brand d-sm-none" href="#">
            <img class="sidebar-brand-full" src="{{asset('img/backend-logo-square.jpg')}}" height="46" alt="{{ app_name() }}">
        </a>
        <ul class="header-nav d-none d-md-flex">
            <li class="nav-item"><a class="nav-link" href="{{ route('backend.home') }}" target="_blank">{{app_name()}}&nbsp;<i class="fa-solid fa-arrow-up-right-from-square"></i></a></li>
        </ul>
        <ul class="header-nav ms-auto">
        <form class="form-inline my-2 my-lg-0">
            <div class="input-group">
                <select class="itemName form-control" style="width:500px;" name="itemName"></select>
                <div class="input-group-append">
                    <button class="btn btn-info" type="button" id="button-image" data-input="itemName"><i class="fa-solid fa-magnifying-glass"></i></button>
                </div>
            </div>
        </form>
        </ul>
        <ul class="header-nav ms-auto">
            <li class="nav-item dropdown">
                <a class="nav-link" data-coreui-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                    <i class="fa-regular fa-bell"></i>
                    &nbsp; @if($notifications_count)<span class="badge badge-pill bg-danger">{{$notifications_count}}</span>@endif
                </a>
                <div class="dropdown-menu dropdown-menu-end pt-0">
                    <div class="dropdown-header bg-light py-2">
                        <strong>@lang("You have :count notifications", ['count'=>$notifications_count])</strong>
                    </div>

                    @if($notifications_latest)
                    @foreach($notifications_latest as $notification)
                    @php
                    $notification_text = isset($notification->data['title'])? $notification->data['title'] : $notification->data['module'];
                    @endphp
                    <a class="dropdown-item" href="{{route("backend.notifications.show", $notification)}}">
                        <i class="{{isset($notification->data['icon'])? $notification->data['icon'] : 'fa-solid fa-bullhorn'}} "></i>&nbsp;{{$notification_text}}
                    </a>
                    @endforeach
                    @endif
                </div>
            </li>
        </ul>

        <ul class="header-nav ms-3">
            <li class="nav-item dropdown">
                <a class="nav-link" data-coreui-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                    <i class="fa-solid fa-language"></i>&nbsp; {{strtoupper(App::getLocale())}}
                </a>
                <div class="dropdown-menu dropdown-menu-end pt-0">
                    <div class="dropdown-header bg-light py-2">
                        <div class="fw-semibold">{{ __('Change language') }}</div>
                    </div>
                    @foreach(config('app.available_locales') as $locale_code => $locale_name)
                    <a class="dropdown-item" href="{{route('language.switch', $locale_code)}}">
                        {{ $locale_name }}
                    </a>
                    @endforeach
                </div>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link py-0" data-coreui-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                    <div class="avatar avatar-md">
                        <img class="avatar-img" src="{{ asset(auth()->user()->avatar) }}" alt="{{ asset(auth()->user()->name) }}">
                    </div>
                </a>
                <div class="dropdown-menu dropdown-menu-end pt-0">
                    <div class="dropdown-header bg-light py-2">
                        <div class="fw-semibold">{{ __('Account') }}</div>
                    </div>

                    <a class="dropdown-item" href="{{route('backend.users.profile', Auth::user()->id)}}">
                        <i class="fa-regular fa-user me-2"></i>&nbsp;{{ Auth::user()->name }}
                    </a>
                    <a class="dropdown-item" href="{{route('backend.users.profile', Auth::user()->id)}}">
                        <i class="fa-regular fa-user me-2"></i>&nbsp;{{ Auth::user()->email }}
                    </a>

                    <div class="dropdown-divider"></div>

                    <a class="dropdown-item" href="{{ route('backend.notifications.index') }}">
                        <i class="fa-regular fa-bell me-2"></i>&nbsp;
                        @lang('Notifications') <span class="badge bg-danger ml-auto">{{$notifications_count}}</span>
                    </a>

                    <div class="dropdown-header bg-light py-2"><strong>@lang('Settings')</strong></div>

                    <a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                        <i class="fa-solid fa-right-from-bracket me-2"></i>&nbsp;
                        @lang('Logout')
                    </a>
                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;"> @csrf </form>
                </div>
            </li>
        </ul>
    </div>

    <div class="header-divider"></div>

    <div class="container-fluid">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb my-0 ms-2">
                @yield('breadcrumbs')
            </ol>
        </nav>
        <div class="d-flex flex-row float-end">
            <div class="">{{ date_today() }}&nbsp;</div>
            <div id="liveClock" class="clock" onload="showTime()"></div>
        </div>
    </div>
</header>

<x-library.select2 />

@push('after-styles')
<!-- File Manager -->
<link rel="stylesheet" href="{{ asset('vendor/file-manager/css/file-manager.css') }}">

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.css" rel="stylesheet">
@endpush

@push ('after-scripts')
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
        $(document).on('select2:open', () => {
            document.querySelector('.select2-search__field').focus();
            document.querySelector('.select2-container--open .select2-search__field').focus();
        });

        $('itemName').select2({
            theme: "bootstrap4",
            placeholder: '@lang("Select an option")',
            minimumInputLength: 1,
            allowClear: true,
            ajax: {
                url: '{{route("frontend.documenttypes.index_list")}}',
                dataType: 'json',
                data: function(params) {
                    return {
                        q: $.trim(params.term)
                    };
                },
                processResults: function(data) {
                    return {
                        results: data
                    };
                },
                cache: true
            },
        });
    });
</script>
@endpush
