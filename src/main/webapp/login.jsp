<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Pahana Edu Bookshop</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #6366f1;
            --primary-dark: #4f46e5;
            --secondary-color: #06b6d4;
            --accent-color: #f59e0b;
            --success-color: #10b981;
            --danger-color: #ef4444;
            --text-primary: #1f2937;
            --text-secondary: #6b7280;
            --bg-primary: #ffffff;
            --bg-secondary: #f8fafc;
            --border-color: #e5e7eb;
            --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
            --shadow-xl: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            overflow-x: hidden;
            position: relative;
        }

        /* Animated Background */
        .bg-animation {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            overflow: hidden;
        }

        .bg-circle {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            animation: float 8s ease-in-out infinite;
        }

        .bg-circle:nth-child(1) {
            width: 300px;
            height: 300px;
            top: 10%;
            left: 5%;
            animation-delay: 0s;
        }

        .bg-circle:nth-child(2) {
            width: 200px;
            height: 200px;
            top: 60%;
            right: 10%;
            animation-delay: 3s;
        }

        .bg-circle:nth-child(3) {
            width: 150px;
            height: 150px;
            bottom: 20%;
            left: 20%;
            animation-delay: 6s;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg) scale(1); }
            50% { transform: translateY(-30px) rotate(180deg) scale(1.1); }
        }

        /* Main Container */
        .login-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            position: relative;
            z-index: 1;
        }

        /* Login Card */
        .login-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 24px;
            box-shadow: var(--shadow-xl);
            max-width: 500px;
            width: 100%;
            overflow: hidden;
            position: relative;
            animation: slideInUp 0.8s ease-out;
        }

        .login-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color), var(--accent-color));
        }

        /* Header Section */
        .login-header {
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
            color: white;
            text-align: center;
            padding: 3rem 2rem 2.5rem;
            position: relative;
            overflow: hidden;
        }

        .login-header::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            animation: rotate 25s linear infinite;
        }

        .brand-logo {
            font-size: 3rem;
            margin-bottom: 1rem;
            position: relative;
            z-index: 1;
            color: rgba(255, 255, 255, 0.9);
        }

        .brand-name {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            position: relative;
            z-index: 1;
            letter-spacing: -0.5px;
        }

        .brand-tagline {
            font-size: 1rem;
            opacity: 0.9;
            font-weight: 400;
            position: relative;
            z-index: 1;
        }

        /* Body Section */
        .login-body {
            padding: 3rem 2.5rem;
        }

        /* Form Elements */
        .form-group {
            margin-bottom: 2rem;
            position: relative;
        }

        .form-label {
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 0.75rem;
            display: block;
            font-size: 0.95rem;
            letter-spacing: -0.2px;
        }

        .form-control {
            border: 2px solid var(--border-color);
            border-radius: 16px;
            padding: 1rem 1.5rem;
            font-size: 1rem;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            background: var(--bg-primary);
            color: var(--text-primary);
            width: 100%;
            font-weight: 500;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.1);
            background: var(--bg-primary);
            outline: none;
            transform: translateY(-2px);
        }

        .form-control:hover {
            border-color: var(--primary-color);
            transform: translateY(-1px);
        }

        .form-control::placeholder {
            color: var(--text-secondary);
            opacity: 0.7;
            font-weight: 400;
        }



        /* Submit Button */
        .btn-login {
            background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
            border: none;
            border-radius: 16px;
            padding: 1.25rem 2rem;
            font-size: 1.1rem;
            font-weight: 600;
            color: white;
            width: 100%;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
            cursor: pointer;
            letter-spacing: -0.2px;
        }

        .btn-login::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.6s ease;
        }

        .btn-login:hover::before {
            left: 100%;
        }

        .btn-login:hover {
            transform: translateY(-3px);
            box-shadow: 0 20px 40px rgba(99, 102, 241, 0.3);
        }

        .btn-login:active {
            transform: translateY(-1px);
        }

        /* Alert Messages */
        .alert {
            border: none;
            border-radius: 16px;
            padding: 1.25rem 1.5rem;
            margin-bottom: 2rem;
            font-weight: 500;
            position: relative;
            overflow: hidden;
            animation: slideInDown 0.5s ease-out;
        }

        .alert::before {
            content: '';
            position: absolute;
            left: 0;
            top: 0;
            bottom: 0;
            width: 5px;
            background: currentColor;
            border-radius: 0 3px 3px 0;
        }

        .alert-danger {
            background: rgba(239, 68, 68, 0.1);
            color: var(--danger-color);
            border-left: 5px solid var(--danger-color);
        }

        .alert-success {
            background: rgba(16, 185, 129, 0.1);
            color: var(--success-color);
            border-left: 5px solid var(--success-color);
        }

        /* Links */
        .register-link {
            text-align: center;
            margin-top: 2rem;
            padding-top: 2rem;
            border-top: 1px solid var(--border-color);
        }

        .register-link a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .register-link a:hover {
            color: var(--primary-dark);
            background: rgba(99, 102, 241, 0.1);
            text-decoration: none;
        }

        /* Features Section */
        .features-section {
            margin-top: 2.5rem;
            padding: 2rem;
            background: linear-gradient(135deg, var(--bg-secondary), rgba(99, 102, 241, 0.05));
            border-radius: 20px;
            border: 1px solid rgba(99, 102, 241, 0.1);
        }

        .features-title {
            text-align: center;
            font-size: 1.1rem;
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 1.5rem;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 1.5rem;
        }

        .feature-item {
            text-align: center;
            padding: 1rem;
            border-radius: 12px;
            transition: all 0.3s ease;
        }

        .feature-item:hover {
            transform: translateY(-5px);
            background: rgba(255, 255, 255, 0.8);
        }

        .feature-icon {
            font-size: 1.75rem;
            color: var(--primary-color);
            margin-bottom: 0.75rem;
            transition: all 0.3s ease;
        }

        .feature-item:hover .feature-icon {
            transform: scale(1.2);
            color: var(--primary-dark);
        }

        .feature-text {
            font-size: 0.85rem;
            color: var(--text-secondary);
            font-weight: 500;
        }

        /* Responsive Design */
        @media (max-width: 576px) {
            .login-container {
                padding: 1rem;
            }
            
            .login-card {
                border-radius: 20px;
                margin: 1rem;
            }
            
            .login-header {
                padding: 2rem 1.5rem 1.5rem;
            }
            
            .login-body {
                padding: 2rem 1.5rem;
            }
            
            .brand-logo {
                font-size: 2.5rem;
            }
            
            .brand-name {
                font-size: 1.75rem;
            }

            .features-grid {
                grid-template-columns: 1fr;
                gap: 1rem;
            }
        }

        /* Animation Keyframes */
        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(40px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        /* Loading States */
        .btn-loading {
            position: relative;
            pointer-events: none;
        }

        .btn-loading .btn-text {
            opacity: 0;
        }

        .btn-loading::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 20px;
            height: 20px;
            margin: -10px 0 0 -10px;
            border: 2px solid transparent;
            border-top: 2px solid white;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Focus Management */
        .form-control:focus {
            outline: none;
        }

        /* Custom Scrollbar */
        ::-webkit-scrollbar {
            width: 8px;
        }

        ::-webkit-scrollbar-track {
            background: var(--bg-secondary);
        }

        ::-webkit-scrollbar-thumb {
            background: var(--primary-color);
            border-radius: 4px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: var(--primary-dark);
        }
    </style>
</head>
<body>
    <!-- Animated Background -->
    <div class="bg-animation">
        <div class="bg-circle"></div>
        <div class="bg-circle"></div>
        <div class="bg-circle"></div>
    </div>

    <div class="login-container">
        <div class="card login-card">
            <!-- Header -->
            <div class="login-header">
                <div class="brand-logo">
                    <i class="fas fa-graduation-cap"></i>
                </div>
                <h1 class="brand-name">Pahana Edu</h1>
                <p class="brand-tagline">Advanced Billing System</p>
            </div>

            <!-- Body -->
            <div class="login-body">
                <!-- Error Messages -->
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger" role="alert">
                        <i class="fas fa-exclamation-triangle me-2"></i>
                        <c:out value="${errorMessage}"/>
                    </div>
                </c:if>

                <!-- Success Messages -->
                <c:if test="${not empty sessionScope.successMessage}">
                    <div class="alert alert-success" role="alert">
                        <i class="fas fa-check-circle me-2"></i>
                        <c:out value="${sessionScope.successMessage}"/>
                    </div>
                    <c:remove var="successMessage" scope="session" />
                </c:if>

                <!-- Login Form -->
                <form action="${pageContext.request.contextPath}/login" method="post" id="loginForm">
                    <div class="form-group">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" 
                               class="form-control" 
                               id="username" 
                               name="username" 
                               placeholder="Enter your username"
                               required
                               autocomplete="off">
                    </div>

                    <div class="form-group">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" 
                               class="form-control" 
                               id="password" 
                               name="password" 
                               placeholder="Enter your password"
                               required
                               autocomplete="off">
                    </div>

                    <button type="submit" class="btn btn-login" id="loginBtn">
                        <span class="btn-text">
                            <i class="fas fa-sign-in-alt me-2"></i>Sign In
                        </span>
                    </button>
                </form>

                <!-- Register Link -->
                <div class="register-link">
                    <p class="mb-0">
                        Don't have an account? 
                        <a href="${pageContext.request.contextPath}/register.jsp">
                            <i class="fas fa-user-plus me-1"></i>Register here
                        </a>
                    </p>
                </div>

                <!-- Features Section -->
                <div class="features-section">
                    <div class="features-title">
                        <i class="fas fa-star me-2" style="color: var(--accent-color);"></i>
                        Why Choose Pahana Edu?
                    </div>
                    <div class="features-grid">
                        <div class="feature-item">
                            <div class="feature-icon">
                                <i class="fas fa-shield-alt"></i>
                            </div>
                            <div class="feature-text">Secure & Reliable</div>
                        </div>
                        <div class="feature-item">
                            <div class="feature-icon">
                                <i class="fas fa-bolt"></i>
                            </div>
                            <div class="feature-text">Fast Performance</div>
                        </div>
                        <div class="feature-item">
                            <div class="feature-icon">
                                <i class="fas fa-mobile-alt"></i>
                            </div>
                            <div class="feature-text">Mobile Friendly</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JavaScript -->
    <script>
        // Ensure form fields are completely empty on page load
        document.addEventListener('DOMContentLoaded', function() {
            // Clear any values that might be set
            document.getElementById('username').value = '';
            document.getElementById('password').value = '';
            
            // Focus on username field
            document.getElementById('username').focus();
        });
        
        // Clear form on page refresh
        window.addEventListener('beforeunload', function() {
            document.getElementById('username').value = '';
            document.getElementById('password').value = '';
        });
        
        // Enhanced form submission with loading state
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            const loginBtn = document.getElementById('loginBtn');
            const btnText = loginBtn.querySelector('.btn-text');
            
            // Show loading state
            loginBtn.classList.add('btn-loading');
            btnText.style.opacity = '0';
            
            // Submit form after short delay to show loading
            setTimeout(() => {
                // Form will submit normally
            }, 500);
        });

        // Real-time form validation
        document.querySelectorAll('.form-control').forEach(input => {
            input.addEventListener('input', function() {
                if (this.value.trim()) {
                    this.style.borderColor = '#10b981';
                } else {
                    this.style.borderColor = '#e5e7eb';
                }
            });
        });

        // Auto-hide alerts after 6 seconds
        setTimeout(() => {
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(alert => {
                alert.style.opacity = '0';
                alert.style.transform = 'translateY(-10px)';
                setTimeout(() => alert.remove(), 300);
            });
        }, 6000);

        // Add floating animation to background circles
        document.addEventListener('DOMContentLoaded', function() {
            const circles = document.querySelectorAll('.bg-circle');
            circles.forEach((circle, index) => {
                circle.style.animationDelay = `${index * 3}s`;
            });
        });

        // Keyboard navigation enhancement
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Enter' && document.activeElement.tagName === 'INPUT') {
                const form = document.getElementById('loginForm');
                if (form.checkValidity()) {
                    form.dispatchEvent(new Event('submit'));
                }
            }
        });

        // Smooth scroll behavior
        document.documentElement.style.scrollBehavior = 'smooth';
    </script>
</body>
</html>
