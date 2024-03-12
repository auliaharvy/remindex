<form action="/dashboard-filter" method='GET'>
    {{ csrf_field() }}
    <div class="col-12 col-sm-12">
        <button class="btn btn-primary mb-2 btn-block" type="submit" value="Search">Filter</button>
        <div class="card card-accent-primary mb-4">
            <div class="card-header">
                @lang('Departments')
            </div>
            <div class="card-body">
                @if (session()->has('selected_departments'))
                    <?php $selectedDepartments = session()->get('selected_departments'); ?>
                    @if ($departments->count())
                        @foreach ($departments as $department)
                            <div class="checkbox">
                                {{-- {{ html()->label(html()->checkbox('departments_select[]', old('departments_select') && in_array($department->name, old('departments_select')) ? true : false, $department->name)->id('department-'.$department->name) . ' ' . $department->name)->for('department-'.$department->name) }} --}}
                                {{ html()->label(
                                        html()->checkbox(
                                                'departments_select[]',
                                                in_array($department->name, $selectedDepartments) ? true : false,
                                                $department->name,
                                            )->id('department-' . $department->name) .
                                            ' ' .
                                            $department->name,
                                    )->for('department-' . $department->name) }}
                            </div>
                        @endforeach
                    @endif
                @else
                    @if ($departments->count())
                    @foreach ($departments as $department)
                        <div class="checkbox">
                            {{-- {{ html()->label(html()->checkbox('departments_select[]', old('departments_select') && in_array($department->name, old('departments_select')) ? true : false, $department->name)->id('department-'.$department->name) . ' ' . $department->name)->for('department-'.$department->name) }} --}}
                            {{ html()->label(
                                    html()->checkbox(
                                            'departments_select[]',
                                            in_array($department->name, []) ? true : false,
                                            $department->name,
                                        )->id('department-' . $department->name) .
                                        ' ' .
                                        $department->name,
                                )->for('department-' . $department->name) }}
                        </div>
                    @endforeach
                    @endif
                @endif
            </div>
        </div>
    </div>


    @if (session()->has('selected_departments'))
    <div class="col-12 col-sm-12">
        <div class="card card-accent-primary mb-4">
            <div class="card-header">
                @lang('Categories')
            </div>
            <div class="card-body">
                @if (session()->has('selected_documenttypes'))
                    <?php $selectedDocumenttypes = session()->get('selected_documenttypes'); ?>
                    @if ($documenttypes->count())
                        @foreach ($documenttypes as $documenttype)
                            <div class="checkbox">
                                {{-- {{ html()->label(html()->checkbox('documenttypes[]', old('documenttypes') && in_array($documenttype->name, old('documenttypes')) ? true : false, $documenttype->name)->id('documenttype-' . $documenttype->id) .' ' .$documenttype->name)->for('documenttype-' . $documenttype->id) }} --}}
                                {{ html()->label(
                                    html()->checkbox(
                                            'documenttypes_select[]',
                                            in_array($documenttype->name, $selectedDocumenttypes) ? true : false,
                                            $documenttype->name,
                                        )->id('documenttype-' . $documenttype->name) .
                                        ' ' .
                                        $documenttype->name,
                                )->for('documenttype-' . $documenttype->name) }}
                            </div>
                        @endforeach
                    @endif
                @else
                    @if ($documenttypes->count())
                    @foreach ($documenttypes as $documenttype)
                        <div class="checkbox">
                            {{-- {{ html()->label(html()->checkbox('departments_select[]', old('departments_select') && in_array($department->name, old('departments_select')) ? true : false, $department->name)->id('department-'.$department->name) . ' ' . $department->name)->for('department-'.$department->name) }} --}}
                            {{ html()->label(
                                    html()->checkbox(
                                            'documenttypes_select[]',
                                            in_array($documenttype->name, []) ? true : false,
                                            $documenttype->name,
                                        )->id('documenttype-' . $documenttype->name) .
                                        ' ' .
                                        $documenttype->name,
                                )->for('documenttype-' . $documenttype->name) }}
                        </div>
                    @endforeach
                    @endif
                @endif
            </div>
        </div>
    </div>
    @endif

    @if (session()->has('selected_departments'))
    <div class="col-12 col-sm-12">
        <div class="card card-accent-primary mb-4">
            <div class="card-header">
                @lang('Locations')
            </div>
            <div class="card-body">
                @if (session()->has('selected_locations'))
                    <?php $selectedLocations = session()->get('selected_locations'); ?>
                    @if ($locations->count())
                        @foreach ($locations as $location)
                            <div class="checkbox">
                                {{-- {{ html()->label(html()->checkbox('documenttypes[]', old('documenttypes') && in_array($documenttype->name, old('documenttypes')) ? true : false, $documenttype->name)->id('documenttype-' . $documenttype->id) .' ' .$documenttype->name)->for('documenttype-' . $documenttype->id) }} --}}
                                {{ html()->label(
                                    html()->checkbox(
                                            'locations_select[]',
                                            in_array($location->name, $selectedLocations) ? true : false,
                                            $location->name,
                                        )->id('location-' . $location->name) .
                                        ' ' .
                                        $location->name,
                                )->for('location-' . $location->name) }}
                            </div>
                        @endforeach
                    @endif
                @else
                    @if ($documenttypes->count())
                    @foreach ($documenttypes as $documenttype)
                        <div class="checkbox">
                            {{-- {{ html()->label(html()->checkbox('departments_select[]', old('departments_select') && in_array($department->name, old('departments_select')) ? true : false, $department->name)->id('department-'.$department->name) . ' ' . $department->name)->for('department-'.$department->name) }} --}}
                            {{ html()->label(
                                    html()->checkbox(
                                            'locations_select[]',
                                            in_array($location->name, []) ? true : false,
                                            $location->name,
                                        )->id('location-' . $location->name) .
                                        ' ' .
                                        $location->name,
                                )->for('location-' . $location->name) }}
                        </div>
                    @endforeach
                    @endif
                @endif
            </div>
        </div>
    </div>
    @endif

</form>
