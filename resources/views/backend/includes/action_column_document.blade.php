<div class="text-end">
    @can('edit_'.$module_name)
    @if ($data->created_by == auth()->user()->id)
    <x-backend.buttons.edit route='{!!route("backend.$module_name.edit", $data)!!}' title="{{__('Edit')}} {{ ucwords(Str::singular($module_name)) }}" small="true" />
    @endif
    <a href="{{route('backend.users.emailConfirmationResend', $data->id)}}" class="btn btn-info btn-sm mt-1 text-white" data-toggle="tooltip" title="Renew Document"><i class="fas fa-refresh"></i></a>
    @endcan
    <x-backend.buttons.show route='{!!route("backend.$module_name.show", $data)!!}' title="{{__('Show')}} {{ ucwords(Str::singular($module_name)) }}" small="true" />
</div>
