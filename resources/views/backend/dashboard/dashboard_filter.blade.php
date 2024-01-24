<div class="col-12 col-sm-12">
    <div class="card card-accent-primary">
        <div class="card-header">
            @lang('Departments')
        </div>
        <div class="card-body">
            @if ($departments->count())
            @foreach($departments as $department)
            <div class="checkbox">
                {{ html()->label(html()->checkbox('departments[]', old('departments') && in_array($department->name, old('departments')) ? true : false, $department->name)->id('department-'.$department->id) . ' ' . $department->name)->for('department-'.$department->id) }}
            </div>
            @endforeach
            @endif
        </div>
    </div>
</div>

<div class="col-12 col-sm-12">
    <div class="card card-accent-primary">
        <div class="card-header">
            @lang('Categories')
        </div>
        <div class="card-body">
            @if ($documenttypes->count())
            @foreach($documenttypes as $documenttype)
            <div class="checkbox">
                {{ html()->label(html()->checkbox('documenttypes[]', old('documenttypes') && in_array($documenttype->name, old('documenttypes')) ? true : false, $documenttype->name)->id('documenttype-'.$documenttype->id) . ' ' . $documenttype->name)->for('documenttype-'.$documenttype->id) }}
            </div>
            @endforeach
            @endif
        </div>
    </div>
</div>