
<div class="row">
    <div class="col-12 col-sm-12 col-lg-12">
        <div id='calendar'></div>
    </div>
</div>

<style>
    #calendar {
        max-width: 1100px;
        margin-top: 20px auto;
    }
</style>

<script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

    </script>
<!-- /.row-->