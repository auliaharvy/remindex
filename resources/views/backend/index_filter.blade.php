@extends('backend.layouts.app')

@section('title') @lang("Dashboard") @endsection

@section('breadcrumbs')
<x-backend-breadcrumbs />
@endsection

@section('content')
<div class="row">
    <div class="col-12 col-sm-12 col-lg-2">
        @include("backend.dashboard_filter.dashboard_filter", ['count_document', $count_document])
    </div>
    <div class="col-12 col-sm-12 col-lg-10">
        @include("backend.dashboard_filter.dashboard_total")
        <div class="card mb-10">
            <div class="card-body row">
                <h4 class="card-title mb-10">@lang("Dashboard Expiration Forecast")</h4>
                <!-- Dashboard Content Area -->
                <div class="card-text ma-10">
                    @include("backend.dashboard_filter.dashboard_forecast", ['forecast_data', $grouped_forecast_data])
                </div>
                <!-- / Dashboard Content Area -->
            </div>
        </div>
        <br>
        <div class="card mt-10">
            <div class="card-body row">
                <!-- Dashboard Content Area -->
                <div class="card-text ma-10">
                    @include("backend.dashboard_filter.dashboard_calendar")
                </div>
                <!-- / Dashboard Content Area -->
            </div>
        </div>
        @include("backend.dashboard_filter.dashboard_calendar")
    </div>
</div>




@endsection
