<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Home - School Attendance System</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <link href="https://unpkg.com/aos@2.3.4/dist/aos.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.css" rel="stylesheet">
  <style>
    body {
      background: linear-gradient(to bottom right, #f0f4f8, #ffffff);
      font-family: 'Poppins', sans-serif;
      color: #2e3a59;
      margin: 0;
    }

    .main-content {
      padding: 70px 15px 40px;
    }

    .welcome-section {
      text-align: center;
      margin-bottom: 50px;
    }

    .welcome-section h1 {
      font-size: 2.8rem;
      font-weight: 600;
      background: linear-gradient(90deg, #3a7bd5, #00d2ff);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }

    .stat-box, .rules-card, .carousel-container {
      background: #ffffff;
      box-shadow: 0 6px 16px rgba(0, 0, 0, 0.05);
      border-radius: 12px;
      padding: 25px 30px;
      margin-bottom: 30px;
    }

    .calendar-section {
      max-width: 900px;
      margin: 0 auto;
    }

    #calendar {
      background: #ffffff;
      padding: 20px;
      border-radius: 12px;
      box-shadow: 0 6px 16px rgba(0,0,0,0.05);
    }

    .carousel-item img {
      width: 100%;
      height: 400px;
      object-fit: cover;
      border: none;
      transition: transform 0.5s ease, filter 0.3s ease;
    }

    .carousel-item img:hover {
      transform: scale(1.03);
      filter: brightness(1.1);
    }

    .stat-box .col-md-3 {
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      border-radius: 8px;
      padding: 15px 10px;
    }

    .stat-box .col-md-3:hover {
      transform: translateY(-5px);
      box-shadow: 0 8px 18px rgba(0, 0, 0, 0.08);
      background-color: #f8fafc;
    }

    footer {
      background-color: #ecf2f9;
      padding: 18px 0;
      text-align: center;
      font-size: 0.95rem;
      color: #6b7280;
      margin-top: 40px;
    }
  </style>
</head>
<body>

<div class="main-content container">
  <div class="welcome-section" data-aos="fade-down">
    <h1>Welcome to the School Attendance System</h1>
    <p class="lead">Track attendance efficiently. Keep students, parents, and staff informed.</p>
  </div>

  <div class="carousel-container mb-4" data-aos="zoom-in">
    <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="images/s1.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="images/s2.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="images/s3.jpg" class="d-block w-100" alt="...">
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
      </button>
    </div>
  </div>

  <div class="stat-box" data-aos="fade-up">
    <h4>Key Stats</h4>
    <div class="row text-center">
      <div class="col-md-3"><h5>500+</h5><p>Students</p></div>
      <div class="col-md-3"><h5>30+</h5><p>Teachers</p></div>
      <div class="col-md-3"><h5>25</h5><p>Classes</p></div>
      <div class="col-md-3">
        <a href="#calendar" class="text-decoration-none">
          <div style="cursor: pointer;">
            <h5>📅</h5>
            <p>Holiday Calendar</p>
          </div>
        </a>
      </div>
    </div>
  </div>

  <div class="rules-card" id="guidelines" data-aos="fade-up">
    <h2>📚 School Attendance Guidelines</h2>
    <ol>
      <li><strong>Be punctual:</strong> Arrive by <strong>8:00 AM</strong>. Between 8:00–8:15 AM is marked “Late”.</li>
      <li><strong>Teachers must report attendance</strong> by <strong>8:30 AM</strong>.</li>
      <li><strong>No edits after 10:00 AM</strong> unless approved by administration.</li>
      <li><strong>Medical absences:</strong> Submit a certificate within <strong>3 days</strong>.</li>
      <li><strong>3+ unexcused absences</strong> may result in disciplinary action.</li>
      <li><strong>Parents are notified</strong> of absences and repeated lateness via email/SMS.</li>
    </ol>
  </div>

  <div class="calendar-section" id="calendar" data-aos="fade-up">
    <h2 class="text-center mb-4">📅 Holiday Calendar</h2>
    <div id='fc-calendar'></div>
  </div>
</div>

<footer>
  <small>&copy; Aharon Tadi | School Attendance System 2025</small>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.4/dist/aos.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
<script>
  AOS.init({ duration: 1000, once: true });

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('fc-calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      height: 550,
      events: [
        { title: 'Republic Day', start: '2025-01-26', color: '#f94144' },
        { title: 'Summer Break', start: '2025-05-01', end: '2025-06-01', color: '#f9c74f' },
        { title: 'Independence Day', start: '2025-08-15', color: '#90be6d' },
        { title: 'Diwali Holiday', start: '2025-10-29', end: '2025-10-31', color: '#f9844a' },
        { title: 'Christmas', start: '2025-12-25', color: '#577590' }
      ]
    });
    calendar.render();
  });
</script>
</body>
</html>
