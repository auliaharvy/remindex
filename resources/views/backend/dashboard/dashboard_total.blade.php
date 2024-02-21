<div class="row">
    <div class="col-12 col-sm-6 col-lg-3">
        <div class="card mb-4">
            <div class="card-body p-3 d-flex align-items-center">
                <div class="bg-info text-white p-3 me-3">
                    TD
                </div>
                <div>
                    <div class="text-medium-emphasis text-uppercase fw-semibold small">Total</div>
                    <div class="fs-6 fw-semibold text-info">{{ $count_document['total'] }}</div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.col-->
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
                    W
                </div>
                <div>
                    <div class="text-medium-emphasis text-uppercase fw-semibold small">Waiting</div>
                    <div class="fs-6 fw-semibold text-warning">{{ $count_document['waiting'] }}</div>
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