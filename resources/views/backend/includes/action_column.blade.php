<div class="text-end">
    @can('edit_'.$module_name)
    <x-backend.buttons.edit route='{!!route("backend.$module_name.edit", $data)!!}' title="{{__('Edit')}} {{ ucwords(Str::singular($module_name)) }}" small="true" />
    @endcan
    <x-backend.buttons.show route='{!!route("backend.$module_name.show", $data)!!}' title="{{__('Show')}} {{ ucwords(Str::singular($module_name)) }}" small="true" />
    @can('delete_'.$module_name)
    <a href='{{route("backend.$module_name.destroy", $data)}}' class="btn btn-danger btn-sm mt-1 text-white" data-method="DELETE" data-token="{{csrf_token()}}" data-toggle="tooltip" title="{{__('labels.backend.delete')}}"><i class="fas fa-trash-alt"></i></a>
    @endcan
</div>
