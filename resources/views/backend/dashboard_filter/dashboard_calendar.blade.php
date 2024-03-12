
<div class="row">
    <div class="col-12 col-sm-12 col-lg-12 table-responsive">
        <div id='calendar'></div>
    </div>
</div>

<style>
    #calendar {
        max-width: 100%;
        margin-top: 20px auto;
    }
</style>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek'
      },
      events: function(fetchInfo, successCallback, failureCallback) {
        $.ajax({
          url: '<?php echo url("calendar-event") ?>',
          type: 'GET',
          dataType: 'JSON',
          success: function(data) {
            var events = [];
            if (data != null) {
              $.each(data, function(i, item) {
                events.push({
                  start: item.start,
                  title: item.title,
                  color: item.color,
                  display: 'block'
                })
              })
            }
            console.log('events', events);
            successCallback(events)
          }
        })
      }
      
    });
    calendar.render();
  });
</script>
<!-- /.row-->