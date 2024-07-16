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
            <i class="{{ $module_icon }}"></i> {{ __($module_title) }} <small class="text-muted">{{ __($module_action) }}</small>

            <x-slot name="subtitle">
                @lang(":module_name Management Dashboard", ['module_name'=>Str::title($module_name)])
            </x-slot>
            <x-slot name="toolbar">
                <x-backend.buttons.return-back />
                <x-buttons.show route='{!!route("backend.$module_name.show", $$module_name_singular)!!}' title="{{__('Show')}} {{ ucwords(Str::singular($module_name)) }}" class="ms-1" />
            </x-slot>
        </x-backend.section-header>


        <div class="row mt-4">
            <div class="col">
                {{ html()->modelForm($$module_name_singular, 'PATCH', route("backend.$module_name.update", $$module_name_singular))->class('form')->acceptsFiles()->open() }}
                <div class="row mb-3">
                    <div class="col-12">
                        <div class="form-group">
                            <?php
                            $field_name = 'document_type_id';
                            $field_lable = label_case('Document Type');
                            $field_relation = "document_type";
                            $field_placeholder = __("Select an option");
                            $required = "";
                            ?>
                            {{ html()->label($field_lable, $field_name) }} {!! fielf_required($required) !!}
                            {{ html()->select($field_name, $document_types  )->placeholder($field_placeholder)->class('form-control')->attributes(["$required"]) }}
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-12">
                        <div class="form-group">
                            <?php
                            $field_name = 'name';
                            $field_lable = label_case($field_name);
                            $field_placeholder = $field_lable;
                            $required = "required";
                            ?>
                            {{ html()->label($field_lable, $field_name) }} {!! fielf_required($required) !!}
                            {{ html()->text($field_name)->placeholder($field_placeholder)->class('form-control')->attributes(["$required"]) }}
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-12">
                        <div class="form-group">
                            <?php
                            $field_name = 'source';
                            $field_lable = label_case($field_name);
                            $field_placeholder = $field_lable;
                            $required = "required";
                            ?>
                            {{ html()->label($field_lable, $field_name) }} {!! fielf_required($required) !!}
                            {{ html()->text($field_name)->placeholder($field_placeholder)->class('form-control')->attributes(["$required"]) }}
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-12">
                        <div class="form-group">
                            <?php
                            $field_name = 'description';
                            $field_lable = label_case($field_name);
                            $field_placeholder = $field_lable;
                            $required = "";
                            ?>
                            {{ html()->label($field_lable, $field_name) }} {!! fielf_required($required) !!}
                            {{ html()->textarea($field_name)->placeholder($field_placeholder)->class('form-control')->attributes(["$required"]) }}
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-6">
                        <div class="form-group">
                            <?php
                            $field_name = 'user_id';
                            $field_lable = label_case("Owner");
                            $field_relation = "user";
                            $field_placeholder = __("Select an option");
                            $required = "required";
                            ?>
                            {{ html()->label($field_lable, $field_name) }} {!! fielf_required($required) !!}
                            {{ html()->select($field_name, $users  )->placeholder($field_placeholder)->class('form-control')->attributes(["$required"]) }}
                        </div>
                    </div>

                    <div class="col-6">
                        <div class="form-group">
                            <?php
                            $field_name = 'admin_id';
                            $field_lable = label_case("Admin");
                            $field_relation = "admin";
                            $field_placeholder = __("Select an option");
                            $required = "required";
                            ?>
                            {{ html()->label($field_lable, $field_name) }} {!! fielf_required($required) !!}
                            {{ html()->select($field_name, $users  )->placeholder($field_placeholder)->class('form-control')->attributes(["$required"]) }}
                        </div>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-12">
                        <div class="form-group">
                            <?php
                            $field_name = 'department_id';
                            $field_lable = label_case("Department");
                            $field_relation = "department";
                            $field_placeholder = __("Select an option");
                            $required = "required";
                            ?>
                            {{ html()->label($field_lable, $field_name) }} {!! fielf_required($required) !!}
                            {{ html()->select($field_name, $departments  )->placeholder($field_placeholder)->class('form-control')->attributes(["$required"]) }}
                        </div>
                    </div>
                </div>
                {{-- <div class="row mb-3">
                    <div class="col-12">
                        <div class="form-group">
                            <?php
                            $field_name = 'file';
                            $field_lable = label_case($field_name);;
                            $field_placeholder = $field_lable;
                            $required = "";
                            ?>
                            {{ html()->label($field_lable, $field_name) }} {!! fielf_required($required) !!}
                            <div class="input-group">
                                {{ html()->text($field_name)->placeholder($field_placeholder)->class('form-control')->attributes(["$required", 'aria-label'=>'Image', 'aria-describedby'=>'button-image']) }}
                                <div class="input-group-append">
                                    <button class="btn btn-info" type="button" id="button-image" data-input="{{$field_name}}"><i class="fas fa-folder-open"></i> @lang('Browse')</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> --}}
                <div class="row mb-3">
                    <div class="col-12">
                        <div class="form-group">
                            <?php
                            $field_name = 'file';
                            $field_lable = label_case($field_name);
                            $field_placeholder = "Upload File";
                            $required = "";
                            ?>
                            {{ html()->label($field_lable, $field_name)->class('form-label') }} {!! fielf_required($required) !!}
                            {{ html()->input("file", $field_name)->class('form-control')->attributes(["$required"]) }}
                        </div>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-12">
                        <div class="form-group">
                            <?php
                            $field_name = 'location';
                            $field_lable = label_case($field_name);
                            $field_placeholder = $field_lable;
                            $required = "";
                            ?>
                            {{ html()->label($field_lable, $field_name) }} {!! fielf_required($required) !!}
                            {{ html()->text($field_name)->placeholder($field_placeholder)->class('form-control')->attributes(["$required"]) }}
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-4">
                        <div class="form-group">
                            {{ html()->submit($text = icon('fas fa-save')." Save")->class('btn btn-success') }}
                        </div>
                    </div>

                    <div class="col-8">
                        <div class="float-end">
                            @can('delete_'.$module_name)
                            <a href="{{route("backend.$module_name.destroy", $$module_name_singular)}}" class="btn btn-danger" data-method="DELETE" data-token="{{csrf_token()}}" data-toggle="tooltip" title="{{__('labels.backend.delete')}}"><i class="fas fa-trash-alt"></i></a>
                            @endcan
                            <a href="{{ route("backend.$module_name.index") }}" class="btn btn-warning" data-toggle="tooltip" title="{{__('labels.backend.cancel')}}"><i class="fas fa-reply"></i> Cancel</a>
                        </div>
                    </div>
                </div>

                {{ html()->form()->close() }}

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
@endsection

@push('after-styles')
<!-- File Manager -->
<link rel="stylesheet" href="{{ asset('vendor/file-manager/css/file-manager.css') }}">

<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.css" rel="stylesheet">
<style>
    .note-editor.note-frame :after {
        display: none;
    }

    .note-editor .note-toolbar .note-dropdown-menu,
    .note-popover .popover-content .note-dropdown-menu {
        min-width: 180px;
    }
</style>
@endpush

@push ('after-scripts')
<script type="module" src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.js"></script>
<script type="module">
    // Define function to open filemanager window
    var lfm = function(options, cb) {
        var route_prefix = (options && options.prefix) ? options.prefix : '/laravel-filemanager';
        window.open(route_prefix + '?type=' + options.type || 'file', 'FileManager', 'width=900,height=600');
        window.SetUrl = cb;
    };

    // Define LFM summernote button
    var LFMButton = function(context) {
        var ui = $.summernote.ui;
        var button = ui.button({
            contents: '<i class="note-icon-picture"></i> ',
            tooltip: 'Insert image with filemanager',
            click: function() {

                lfm({
                    type: 'image',
                    prefix: '/laravel-filemanager'
                }, function(lfmItems, path) {
                    lfmItems.forEach(function(lfmItem) {
                        context.invoke('insertImage', lfmItem.url);
                    });
                });

            }
        });
        return button.render();
    };

    $('#content').summernote({
        height: 120,
        toolbar: [
            ['style', ['style']],
            ['font', ['fontname', 'fontsize', 'bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'lfm', 'video']],
            ['view', ['codeview', 'undo', 'redo', 'help']],
        ],
        buttons: {
            lfm: LFMButton
        }
    });
</script>

<script type="module" src="{{ asset('vendor/laravel-filemanager/js/stand-alone-button.js') }}"></script>
<script type="module">
    $('#button-image').filemanager('image');
</script>

<script type="module">
    $(document).ready(function() {
        $(document).on('select2:open', () => {
            document.querySelector('.select2-search__field').focus();
            document.querySelector('.select2-container--open .select2-search__field').focus();
        });

        $('.select2-document-type').select2({
            theme: "bootstrap4",
            placeholder: '@lang("Select an option")',
            minimumInputLength: 1,
            allowClear: false,
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

        $('.select2-departments').select2({
            // theme: "bootstrap4",
            placeholder: '@lang("Select an option")',
            minimumInputLength: 1,
            allowClear: true,
            ajax: {
                url: '{{route("frontend.departments.index_list")}}',
                dataType: 'json',
                data: function(params) {
                    return {
                        q: $.trim(params.term),
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
@endpush



