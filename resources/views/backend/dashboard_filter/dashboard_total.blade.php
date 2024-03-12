<div class="row">
    <div class="col-12 col-sm-6 col-lg-6">
        <div class="card mb-2">
            <div class="card-body p-3 d-flex align-items-center">
                <div class="bg-info text-white p-3 me-3">
                    <i class="fas fa-check-circle"></i>
                </div>
                <div>
                    <div class="text-medium-emphasis text-uppercase fw-semibold small">Used Document</div>
                    <div class="fs-6 fw-semibold text-info">{{ $count_document['used_document'] }}</div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.col-->
    <div class="col-12 col-sm-6 col-lg-6">
        <div class="card mb-2">
            <div class="card-body p-3 d-flex align-items-center">
                <div class="bg-danger text-white p-3 me-3">
                    <i class="fas fa-times-circle"></i>
                </div>
                <div>
                    <div class="text-medium-emphasis text-uppercase fw-semibold small">Unused Document</div>
                    <div class="fs-6 fw-semibold text-danger">{{ $count_document['unused_document'] }}</div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-12 col-sm-6 col-lg-6">
        <div class="card mb-2">
            <div class="card-body p-3 d-flex align-items-center">
                <div class="bg-info text-white p-3 me-3">
                    <i class="fa fa-calendar-check"></i>
                </div>
                <div>
                    <div class="text-medium-emphasis text-uppercase fw-semibold small">With Expired</div>
                    <div class="fs-6 fw-semibold text-info">{{ $count_document['with_expired'] }}</div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.col-->
    <div class="col-12 col-sm-6 col-lg-6">
        <div class="card mb-2">
            <div class="card-body p-3 d-flex align-items-center">
                <div class="bg-danger text-white p-3 me-3">
                    <i class="fa fa-calendar-times"></i>
                </div>
                <div>
                    <div class="text-medium-emphasis text-uppercase fw-semibold small">Without Expired</div>
                    <div class="fs-6 fw-semibold text-danger">{{ $count_document['without_expired'] }}</div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-12 col-sm-6 col-lg-3">
        <div class="card mb-4">
            <div class="card-body p-3 d-flex align-items-center">
                <div class="bg-success text-white p-3 me-3">
                    A
                </div>
                <div>
                    <div class="text-medium-emphasis text-uppercase fw-semibold small">Active</div>
                    <div class="fs-6 fw-semibold text-success">{{ $count_document['active'] }}</div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.col-->
    <div class="col-12 col-sm-6 col-lg-3">
        <div class="card mb-4">
            <div class="card-body p-3 d-flex align-items-center">
                <div class="bg-warning text-white p-3 me-3">
                    TP
                </div>
                <div>
                    <div class="text-medium-emphasis text-uppercase fw-semibold small">To Be Process</div>
                    <div class="fs-6 fw-semibold text-warning">{{ $count_document['to_process'] }}</div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.col-->
    <div class="col-12 col-sm-6 col-lg-3">
        <div class="card mb-4">
            <div class="card-body p-3 d-flex align-items-center">
                <div class="bg-warning text-white p-3 me-3">
                    OP
                </div>
                <div>
                    <div class="text-medium-emphasis text-uppercase fw-semibold small">On Process</div>
                    <div class="fs-6 fw-semibold text-warning">{{ $count_document['on_process'] }}</div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.col-->
    <div class="col-12 col-sm-6 col-lg-3">
        <div class="card mb-4">
            <div class="card-body p-3 d-flex align-items-center">
                <div class="bg-danger text-white p-3 me-3">
                    EX
                </div>
                <div>
                    <div class="text-medium-emphasis text-uppercase fw-semibold small">Expired</div>
                    <div class="fs-6 fw-semibold text-danger">{{ $count_document['expired'] }}</div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.col-->
</div>
<!-- /.row-->


