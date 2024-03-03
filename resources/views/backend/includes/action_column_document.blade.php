<div class="text-end">
    <a href='{!!route("backend.$module_name.show", $data)!!}' class="btn btn-success btn-sm mt-1 text-white" data-toggle="tooltip" title="Show Document"><i class="fas fa-desktop"></i></a>
    @can('edit_'.$module_name)
    <a href='{!!route("backend.$module_name.edit", $data)!!}' class="btn btn-info btn-sm mt-1 text-white" data-toggle="tooltip" title="Edit Document"><i class="fas fa-pencil"></i></a>
    @endcan
    @can('edit_'.$module_name)
    <a href='{!!route("backend.$module_name.renew", $data)!!}' class="btn btn-info btn-sm mt-1 text-white" data-toggle="tooltip" title="Renew Document"><i class="fas fa-refresh"></i></a>
    @endcan
    @if ($data->created_by == auth()->user()->id)
    @can('delete_'.$module_name)
    <a href='{{route("backend.$module_name.destroy", $data)}}' class="btn btn-danger btn-sm mt-1 text-white" data-method="DELETE" data-token="{{csrf_token()}}" data-toggle="tooltip" title="{{__('labels.backend.delete')}}"><i class="fas fa-trash-alt"></i></a>
    @endcan
    @endif

    <!-- <x-backend.buttons.show route='{!!route("backend.$module_name.show", $data)!!}' title="{{__('Show')}} {{ ucwords(Str::singular($module_name)) }}" small="true" /> -->
</div>
