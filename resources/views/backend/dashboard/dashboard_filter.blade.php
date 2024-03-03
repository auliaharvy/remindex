<form id="filter-form">
{{ csrf_field() }}
<button type="submit">Filter</button>
<div class="col-12 col-sm-12">
    <div class="card card-accent-primary mb-4">
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
    <div class="card card-accent-primary mb-4">
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

<div class="col-12 col-sm-12">
    <div class="card card-accent-primary mb-4">
        <div class="card-header">
            @lang('Locations')
        </div>
        <div class="card-body">
            @if ($locations->count())
            @foreach($locations as $location)
            <div class="checkbox">
                {{ html()->label(html()->checkbox('locations[]', old('locations') && in_array($location->name, old('locations')) ? true : false, $location->name)->id('location-'.$location->name) . ' ' . $location->name)->for('location-'.$location->name) }}
            </div>
            @endforeach
            @endif
        </div>
    </div>
</div>
</form>

<script>
document.getElementById('filter-form').addEventListener('submit', function(event) {
    event.preventDefault();

    // Get the form data
    var formData = new FormData(this);

    // Send the form data to the server
    fetch('{{ url("dashboard-filter") }}', {
        method: 'POST',
        body: formData
    })
    .then(function(response) {
        return response.json();
    })
    .then(function(data) {
        // Update the page with the filtered data
        console.log(data);
    });
});
</script>
