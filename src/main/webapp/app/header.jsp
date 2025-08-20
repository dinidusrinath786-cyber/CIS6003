<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=2.0">
  <title>${param.title} - Pahana Edu Book Shop</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard_style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/customer_style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/item_style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/help_style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bill_style.css">

  <style>
    :root {
      --sidebar-bg: #1e293b;
      --sidebar-hover: #334155;
      --sidebar-active: #3b82f6;
      --sidebar-text: #e2e8f0;
      --sidebar-text-hover: #ffffff;
      --sidebar-border: #475569;
      --header-bg: #0f172a;
      --primary-color: #3b82f6;
      --success-color: #10b981;
      --warning-color: #f59e0b;
      --danger-color: #ef4444;
    }

    body {
      background-color: #f8fafc;
      font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
    }

    /* Enhanced Top Navigation */
    .navbar {
      background: linear-gradient(135deg, var(--header-bg), #1e293b) !important;
      border-bottom: 1px solid var(--sidebar-border);
      padding: 0.75rem 1rem;
      box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
    }

    .navbar-brand {
      font-weight: 700;
      font-size: 1.25rem;
      color: #ffffff !important;
      text-decoration: none;
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }

    .navbar-brand:hover {
      color: var(--primary-color) !important;
    }

    .navbar-info {
      font-size: 0.9rem;
      color: #cbd5e1;
    }

    .navbar-info span {
      display: flex;
      align-items: center;
      gap: 0.5rem;
      padding: 0.5rem 0.75rem;
      border-radius: 8px;
      background: rgba(255, 255, 255, 0.1);
      transition: all 0.3s ease;
    }

    .navbar-info span:hover {
      background: rgba(255, 255, 255, 0.2);
      transform: translateY(-1px);
    }

    /* Enhanced Sidebar */
    .sidebar {
      position: fixed;
      top: 0;
      bottom: 0;
      left: 0;
      z-index: 100;
      padding: 80px 0 0;
      background: linear-gradient(180deg, var(--sidebar-bg) 0%, #0f172a 100%);
      box-shadow: 4px 0 15px rgba(0, 0, 0, 0.1);
      width: 260px;
      border-right: 1px solid var(--sidebar-border);
      transition: all 0.3s ease;
    }

    .sidebar-sticky {
      position: relative;
      top: 0;
      height: calc(100vh - 80px);
      padding: 1rem 0;
      overflow-x: hidden;
      overflow-y: auto;
    }

    /* Sidebar Scrollbar Styling */
    .sidebar-sticky::-webkit-scrollbar {
      width: 6px;
    }

    .sidebar-sticky::-webkit-scrollbar-track {
      background: transparent;
    }

    .sidebar-sticky::-webkit-scrollbar-thumb {
      background: var(--sidebar-border);
      border-radius: 3px;
    }

    .sidebar-sticky::-webkit-scrollbar-thumb:hover {
      background: var(--sidebar-active);
    }

    /* Sidebar Navigation Items */
    .sidebar .nav {
      padding: 0 1rem;
    }

    .sidebar .nav-item {
      margin-bottom: 0.5rem;
    }

    .sidebar .nav-link {
      display: flex;
      align-items: center;
      gap: 0.75rem;
      padding: 1rem 1.25rem;
      color: var(--sidebar-text);
      text-decoration: none;
      border-radius: 12px;
      font-weight: 500;
      font-size: 0.95rem;
      transition: all 0.3s ease;
      position: relative;
      overflow: hidden;
    }

    .sidebar .nav-link::before {
      content: '';
      position: absolute;
      left: 0;
      top: 0;
      height: 100%;
      width: 0;
      background: linear-gradient(90deg, var(--primary-color), var(--sidebar-active));
      transition: width 0.3s ease;
      z-index: -1;
    }

    .sidebar .nav-link:hover {
      color: var(--sidebar-text-hover);
      background: rgba(255, 255, 255, 0.1);
      transform: translateX(8px);
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    }

    .sidebar .nav-link:hover::before {
      width: 4px;
    }

    .sidebar .nav-link.active {
      color: var(--sidebar-text-hover);
      background: linear-gradient(135deg, var(--primary-color), var(--sidebar-active));
      box-shadow: 0 4px 15px rgba(59, 130, 246, 0.3);
      transform: translateX(8px);
    }

    .sidebar .nav-link.active::before {
      width: 4px;
      background: #ffffff;
    }

    .sidebar .nav-link i {
      font-size: 1.1rem;
      width: 20px;
      text-align: center;
      transition: transform 0.3s ease;
    }

    .sidebar .nav-link:hover i {
      transform: scale(1.1);
    }

    .sidebar .nav-link.active i {
      transform: scale(1.1);
    }

    /* Sidebar Header and Footer */
    .sidebar-header {
      border-bottom: 1px solid var(--sidebar-border);
      margin-bottom: 1rem;
    }

    .sidebar-logo {
      width: 60px;
      height: 60px;
      background: rgba(255, 255, 255, 0.1);
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 0 auto;
      border: 2px solid var(--sidebar-border);
    }

    .sidebar-divider {
      opacity: 0.3;
      margin: 1.5rem 0;
    }

    .sidebar-footer {
      border-top: 1px solid var(--sidebar-border);
      margin-top: auto;
    }

    /* Main Content Adjustment */
    .main-content {
      margin-left: 280px;
      padding: 2rem;
      min-height: calc(100vh - 80px);
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      .sidebar {
        transform: translateX(-100%);
        width: 280px;
      }
      
      .sidebar.show {
        transform: translateX(0);
      }
      
      .main-content {
        margin-left: 0;
        padding: 1rem;
      }
      
      .navbar-brand {
        font-size: 1rem;
      }
      
      .navbar-info {
        font-size: 0.8rem;
      }
    }

    /* Enhanced Button Styles */
    .btn-danger {
      background: linear-gradient(135deg, var(--danger-color), #dc2626);
      border: none;
      border-radius: 8px;
      padding: 0.5rem 1rem;
      font-weight: 500;
      transition: all 0.3s ease;
    }

    .btn-danger:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(239, 68, 68, 0.3);
    }
  </style>
</head>
<body>

<nav class="navbar navbar-dark fixed-top flex-md-nowrap p-0 shadow">
  <a class="navbar-brand" href="${pageContext.request.contextPath}/app/dashboard.jsp">
    <i class="bi bi-mortarboard-fill me-2" style="color: var(--primary-color);"></i>
    Pahana Edu Book Shop
  </a>

  <div class="d-flex align-items-center text-white ms-auto navbar-info">
    <span class="me-3">
      <i class="bi bi-geo-alt-fill"></i> 
      Negombo, Sri Lanka
    </span>
    <span id="live-clock" class="me-3">
      <i class="bi bi-clock"></i>
      <span id="clock-text"></span>
    </span>
    <span class="me-3">
      <i class="bi bi-currency-exchange"></i>
      LKR
    </span>
  </div>

  <ul class="navbar-nav px-3">
    <li class="nav-item text-nowrap">
      <a class="btn btn-danger" href="${pageContext.request.contextPath}/logout">
        <i class="bi bi-box-arrow-right me-1"></i>
        Sign out
      </a>
    </li>
  </ul>
</nav>

<div class="container-fluid">
  <div class="row">
    <nav class="col-md-2 d-none d-md-block sidebar">
      <div class="sidebar-sticky">
        <!-- Sidebar Header -->
        <div class="sidebar-header text-center py-3 mb-3">
          <div class="sidebar-logo">
            <i class="bi bi-mortarboard-fill" style="font-size: 2rem; color: var(--primary-color);"></i>
          </div>
          <h6 class="text-white-50 mt-2 mb-0">Navigation</h6>
        </div>

        <!-- Main Navigation -->
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/app/dashboard.jsp">
              <i class="bi bi-speedometer2"></i> 
              Dashboard
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/app/customers">
              <i class="bi bi-people-fill"></i> 
              Customers
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/app/items">
              <i class="bi bi-box-seam-fill"></i> 
              Inventory
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/app/bill?action=new">
              <i class="bi bi-receipt-cutoff"></i> 
              Create Bill
            </a>
          </li>
        </ul>

        <!-- Divider -->
        <hr class="sidebar-divider my-4" style="border-color: var(--sidebar-border);">

        <!-- Secondary Navigation -->
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/app/help.jsp">
              <i class="bi bi-question-circle-fill"></i> 
              Help & Support
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/app/settings.jsp">
              <i class="bi bi-gear-fill"></i> 
              Settings
            </a>
          </li>
        </ul>

        <!-- Sidebar Footer -->
        <div class="sidebar-footer text-center py-3 mt-auto">
          <small class="text-white-50">
            <i class="bi bi-heart-fill text-danger"></i>
            Srinath Hettiarachi
          </small>
        </div>
      </div>
    </nav>

    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4 main-content">
      <script>
        // JavaScript for the live clock
        function updateClock() {
          const clockElement = document.getElementById('clock-text');
          if (clockElement) {
            const now = new Date();
            const options = {
              timeZone: 'Asia/Colombo',
              hour: '2-digit',
              minute: '2-digit',
              second: '2-digit',
              hour12: true
            };
            clockElement.textContent = now.toLocaleString('en-US', options);
          }
        }
        
        // Update the clock every second
        setInterval(updateClock, 1000);
        
        // Initial call to display the clock immediately
        updateClock();

        // Add active state to current navigation item
        document.addEventListener('DOMContentLoaded', function() {
          const currentPath = window.location.pathname;
          const navLinks = document.querySelectorAll('.sidebar .nav-link');
          
          navLinks.forEach(link => {
            if (link.getAttribute('href') && currentPath.includes(link.getAttribute('href').split('/').pop())) {
              link.classList.add('active');
            }
          });
        });
      </script>
