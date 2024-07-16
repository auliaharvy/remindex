<div class="row">
    <div class="table-responsive">
    <table id="datatable" class="table table-bordered table-hover table-responsive-sm text-center">
        <thead>
            <tr>
                <th>Year</th>
                <th>Total</th>
                <th>January</th>
                <th>February</th>
                <th>March</th>
                <th>April</th>
                <th>May</th>
                <th>June</th>
                <th>July</th>
                <th>August</th>
                <th>September</th>
                <th>October</th>
                <th>November</th>
                <th>December</th> 
            </tr>
        </thead>
        <tbody>
            @foreach($final_grouped_forecast_data as $year => $months)
            @php
                $total_all_months = 0;
                foreach ($months as $month) {
                    $total_all_months += $month['total_documents'];
                }
            @endphp
                <tr>
                    <td>{{ $year }}</td>
                    <td>{{ $total_all_months }}</td>
                    @for($i = 1; $i <= 12; $i++)
                        @php
                            $found = false;
                            $total_documents = 0;
                        @endphp
                        @foreach($months as $month)
                            @if($month['month'] == $i)
                                @php
                                    $found = true;
                                    $total_documents += $month['total_documents'];
                                @endphp
                                @break
                            @endif
                        @endforeach
                        <td>{{ $found ? $total_documents : 0 }}</td>
                    @endfor
                </tr>
            @endforeach
        </tbody>
    </table>
    </div>
</div>
<!-- /.row-->