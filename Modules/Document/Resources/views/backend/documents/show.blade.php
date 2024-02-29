@extends('backend.layouts.app')

@section('title') {{ __($module_action) }} {{ __($module_title) }} @endsection

@section('breadcrumbs')
<x-backend-breadcrumbs>
    <x-backend-breadcrumb-item route='{{route("backend.$module_name.index")}}' icon='{{ $module_icon }}'>
        {{ __($module_title) }}
    </x-backend-breadcrumb-item>
    <x-backend-breadcrumb-item type="active">{{ __($module_action) }}</x-backend-breadcrumb-item>
</x-backend-breadcrumbs>
@endsection

@section('content')
<div class="card">
    <div class="card-body">

        <x-backend.section-header>
            <i class="{{ $module_icon }}"></i> {{ __($module_title) }} <small class="text-muted">{{ __($module_action)
                }}</small>

            <x-slot name="subtitle">
                @lang(":module_name Management Dashboard", ['module_name'=>Str::title($module_name)])
            </x-slot>
            <x-slot name="toolbar">
                <x-backend.buttons.return-back />
                {{-- <a href="{{ route(" backend.$module_name.index") }}" class="btn btn-secondary"
                    data-toggle="tooltip" title="{{ ucwords($module_name) }} List"><i class="fas fa-list"></i> List</a>
                --}}
                @can('edit_'.$module_name)
                @if ($$module_name_singular->created_by == auth()->user()->id)
                <div class="float-end">
                <a href='{!!route("backend.$module_name.edit", $$module_name_singular)!!}' class="btn btn-info mt-1 text-white" data-toggle="tooltip" title="Renew Document"><i class="fas fa-refresh"></i></a>
                @endcan
                @can('delete_'.$module_name)
                    <a href="{{route("backend.$module_name.destroy", $$module_name_singular)}}" class="btn btn-danger" data-method="DELETE" data-token="{{csrf_token()}}" data-toggle="tooltip" title="{{__('labels.backend.delete')}}"><i class="fas fa-trash-alt"></i></a>
                @endcan
                </div>
                @endif
            </x-slot>
        </x-backend.section-header>

        <hr>

        <div class="row mt-4">
            <div class="col-12 col-sm-6">

                <p>
                    @lang("All values of :module_name (Id: :id)", ['module_name'=>ucwords($module_name_singular),
                    'id'=>$$module_name_singular->id])
                </p>
                <table class="table table-responsive-sm table-hover table-bordered">

                    <thead>
                        <tr>
                            <th scope="col">
                                <strong>
                                    @lang('Name')
                                </strong>
                            </th>
                            <th scope="col">
                                <strong>
                                    @lang('Value')
                                </strong>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <strong>
                                    {{ __(label_case("ID")) }}
                                </strong>
                            </td>
                            <td>
                                {!! __(label_case($$module_name_singular->id)) !!}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>
                                    {{ __(label_case("Document Name")) }}
                                </strong>
                            </td>
                            <td>
                                {!! __(label_case($$module_name_singular->name)) !!}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>
                                    {{ __(label_case("Type")) }}
                                </strong>
                            </td>
                            <td>
                                {!! __(label_case($$module_name_singular->document_type_name)) !!}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>
                                    {{ __(label_case("Department Name")) }}
                                </strong>
                            </td>
                            <td>
                                {!! __(label_case($$module_name_singular->department_name)) !!}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>
                                    {{ __(label_case("Owner")) }}
                                </strong>
                            </td>
                            <td>
                                {!! __(label_case($$module_name_singular->user_name)) !!}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>
                                    {{ __(label_case("Expired At")) }}
                                </strong>
                            </td>
                            <td>
                                {!! __(label_case($formattedExpired)) !!}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>
                                    {{ __(label_case("File")) }}
                                </strong>
                            </td>
                            <td>
                                <a href="{{$$module_name_singular->file}}" class="btn btn-primary btn-sm mt-1"
                                    data-toggle="tooltip" title="Download File"><i class="fas fa-download"></i> Download
                                    File</a>
                            </td>
                        </tr>
                    </tbody>
                </table>

                {{-- Lightbox2 Library --}}
                <x-library.lightbox />


            </div>
            <div class="col-12 col-sm-6">

                <hr>
                <div class="row">
                    <div class="col-12 col-sm-6 mb-3">
                        <h4>PIC List</h4>
                        @if ($$module_name_singular->created_by == auth()->user()->id)
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal"><i
                                class="fa fa-plus"></i></button>
                        @endif
                    </div>
                </div>
                <table id="datatable" class="table table-bordered table-hover table-responsive-sm">
                    <thead>
                        <tr>
                            <th>
                                Name
                            </th>
                            @if ($$module_name_singular->created_by == auth()->user()->id)
                            <th class="text-end">
                                Action
                            </th>
                            @endif
                        </tr>
                    </thead>

                    <tbody>
                        @foreach($documentPic as $pic)
                        <tr>
                            <td>
                                <strong>{{ $pic->userPic->name }}</strong>
                                <br>
                                <small class="text-muted">{{ $pic->userPic->email }}</small>
                            </td>
                            @if ($$module_name_singular->created_by == auth()->user()->id)
                            <td class="text-end">
                                {{-- <a href='{{route(' backend.documents.delete.pic', $pic->id)}}' class='btn btn-sm
                                    btn-danger mt-1 text-white' data-toggle="tooltip" data-method="POST" title="Delete
                                    PIC" data-confirm="Are you sure?"><i class="fas fa-trash"></i></a> --}}
                                <a href="{{route('backend.documents.delete.pic', $pic->id)}}"
                                    class="btn btn-danger btn-sm mt-1" data-method="POST" data-token="{{csrf_token()}}"
                                    data-toggle="tooltip" title="Delete PIC" data-confirm="Are you sure?"><i
                                        class="fas fa-trash-alt"></i></a>
                            </td>
                            @endif
                        </tr>
                        @endforeach
                    </tbody>
                </table>
                <hr>
            </div>
        </div>
    </div>

    {{-- modal add pic --}}
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="myModalLabel">Add PIC</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="myForm" style="z-index: 1000;">
                        <input type="hidden" name="_method" value="POST">
                        <input type="hidden" name="_token" value="{{ csrf_token() }}">
                        <input type="hidden" name="document_shcedule_id" value="{{$documentSchedule->id}}">
                        <div class="form-group" style="z-index: 1000;">
                            <?php
                            $field_name = 'pic_list[]';
                            $field_lable = 'Assign to';
                            $field_relation = "users";
                            $field_placeholder = __("Select an option");
                            $required = "";
                            ?>
                            {{ html()->label($field_lable, $field_name) }} {!! fielf_required($required) !!}
                            {{ html()->multiselect($field_name)->class('form-control
                            select2-users')->attributes(["$required"]) }}
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="card-footer">
        <div class="row">
            <div class="col">
                <small class="float-end text-muted">
                    Updated: {{$$module_name_singular->updated_at->diffForHumans()}},
                    Created at: {{$$module_name_singular->created_at->isoFormat('LLLL')}}
                </small>
            </div>
        </div>
    </div>
</div>

<x-library.select2 />

@endsection

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

@push('after-styles')

<style>
    .select2-container {
        z-index: 100000;
    }
</style>
@endpush
@section('scripts')
@push('after-scripts')
<script type="module">
    $(document).ready(function() {
        $(document).on('select2:open', () => {
            document.querySelector('.select2-search__field').focus();
            document.querySelector('.select2-container--open .select2-search__field').focus();
        });

        $('.select2-users').select2({
            // theme: "bootstrap4",
            placeholder: '@lang("Select an option")',
            minimumInputLength: 1,
            allowClear: true,
            ajax: {
                url: '{{route("backend.users.index_list")}}',
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
            }
        });
    });
</script>
<script>
    $('#myForm').submit(function(event) {
        event.preventDefault(); // Prevent default form submission

        // Submit form data using AJAX or redirect to a Laravel route
        $.ajax({
            url: '{{route("backend.documents.add_pic")}}', // Replace with your route
            method: 'POST',
            data: $(this).serialize(),
            success: function(response) {
                $('.myModal').modal('hide');
                $('div#myModal').modal('hide')
                // $('div#myModal')
                // location.replace({{ route('backend.documents.show', encode_id($$module_name_singular->id)) }});
            },
            error: function(error) {
                console.error(response.errors);
            }
        });
    });
</script>
@endpush
@endsection
