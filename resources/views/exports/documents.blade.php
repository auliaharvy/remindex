<table>
    <thead>
    <tr>
        <th>Code</th>
        <th>Name</th>
        <th>Owner</th>
        <th>Source</th>
        <th>Location</th>
        <th>Department</th>
        <th>Document Type</th>
        <th>Document Used?</th>
        <th>Status</th>
        <th>Expired At</th>
    </tr>
    </thead>
    <tbody>
    @foreach($documents as $document)
        <tr>
            <td>{{ $document->code }}</td>
            <td>{{ $document->name }}</td>
            <td>{{ $document->user_name }}</td>
            <td>{{ $document->source }}</td>
            <td>{{ $document->location }}</td>
            <td>{{ $document->department_name }}</td>
            <td>{{ $document->document_type_name }}</td>
            <td>@switch($document->is_used)
                    @case(0)
                        <span class="badge bg-success">Used</span>
                        @break

                    @case(1)
                        <span class="badge bg-warning text-dark">Unused</span>
                        @break
                    @default
                        <span class="badge bg-primary">Is Used: {{ $document->is_used }}</span>
                @endswitch
            </td>
            <td>@switch($document->status)
                    @case(1)
                        <span class="badge bg-success">Active</span>
                        @break

                    @case(2)
                        <span class="badge bg-warning text-dark">To be Process</span>
                        @break

                    @case(3)
                        <span class="badge bg-warning text-dark">On Process</span>
                        @break

                    @case(4)
                        <span class="badge bg-danger">Expired</span>
                        @break

                    @case(5)
                        <span class="badge bg-danger">Without Expiration</span>
                        @break

                    @default
                        <span class="badge bg-primary">Status: {{ $document->status }}</span>
                @endswitch
            </td>
            <td>{{ $document->schedule_date }}</td>
        </tr>
    @endforeach
    </tbody>
</table>
