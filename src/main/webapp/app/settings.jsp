<jsp:include page="header.jsp">
    <jsp:param name="title" value="Settings"/>
</jsp:include>

<!-- Settings Page CSS -->
<style>
    :root {
        --primary-color: #6366f1;
        --primary-dark: #4f46e5;
        --secondary-color: #06b6d4;
        --accent-color: #f59e0b;
        --success-color: #10b981;
        --warning-color: #f59e0b;
        --danger-color: #ef4444;
        --info-color: #3b82f6;
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

    .settings-container {
        background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
        min-height: calc(100vh - 80px);
        padding: 2rem;
    }

    .settings-header {
        background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
        color: white;
        border-radius: 20px;
        padding: 2.5rem;
        margin-bottom: 2rem;
        position: relative;
        overflow: hidden;
        text-align: center;
    }

    .settings-header::before {
        content: '';
        position: absolute;
        top: -50%;
        right: -50%;
        width: 200%;
        height: 200%;
        background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
        animation: rotate 20s linear infinite;
    }

    .header-content {
        position: relative;
        z-index: 1;
    }

    .header-title {
        font-size: 2.5rem;
        font-weight: 700;
        margin-bottom: 0.5rem;
        letter-spacing: -0.5px;
    }

    .header-subtitle {
        font-size: 1.1rem;
        opacity: 0.9;
        font-weight: 400;
        margin-bottom: 1.5rem;
    }

    .settings-content {
        max-width: 1200px;
        margin: 0 auto;
    }

    .settings-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
        gap: 2rem;
        margin-bottom: 2rem;
    }

    .settings-card {
        background: var(--bg-primary);
        border-radius: 20px;
        padding: 2rem;
        box-shadow: var(--shadow-lg);
        border: 1px solid var(--border-color);
        transition: all 0.3s ease;
    }

    .settings-card:hover {
        transform: translateY(-5px);
        box-shadow: var(--shadow-xl);
    }

    .card-header {
        display: flex;
        align-items: center;
        gap: 1rem;
        margin-bottom: 1.5rem;
        padding-bottom: 1rem;
        border-bottom: 2px solid var(--border-color);
    }

    .card-icon {
        width: 50px;
        height: 50px;
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.5rem;
        color: white;
    }

    .card-header.profile .card-icon {
        background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
    }

    .card-header.security .card-icon {
        background: linear-gradient(135deg, var(--danger-color), #dc2626);
    }

    .card-header.notifications .card-icon {
        background: linear-gradient(135deg, var(--warning-color), #d97706);
    }

    .card-header.appearance .card-icon {
        background: linear-gradient(135deg, var(--info-color), #2563eb);
    }

    .card-header.system .card-icon {
        background: linear-gradient(135deg, var(--success-color), #059669);
    }

    .card-header.billing .card-icon {
        background: linear-gradient(135deg, var(--accent-color), #d97706);
    }

    .card-title {
        font-size: 1.5rem;
        font-weight: 600;
        color: var(--text-primary);
        margin: 0;
    }

    .card-description {
        color: var(--text-secondary);
        font-size: 0.9rem;
        margin: 0;
    }

    .form-group {
        margin-bottom: 1.5rem;
    }

    .form-label {
        display: block;
        font-weight: 600;
        color: var(--text-primary);
        margin-bottom: 0.5rem;
        font-size: 0.95rem;
    }

    .form-input {
        width: 100%;
        padding: 0.75rem 1rem;
        border: 2px solid var(--border-color);
        border-radius: 12px;
        font-size: 1rem;
        transition: all 0.3s ease;
        background: var(--bg-secondary);
        color: var(--text-primary);
    }

    .form-input:focus {
        outline: none;
        border-color: var(--primary-color);
        background: white;
        box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.1);
        transform: translateY(-2px);
    }

    .form-select {
        width: 100%;
        padding: 0.75rem 1rem;
        border: 2px solid var(--border-color);
        border-radius: 12px;
        font-size: 1rem;
        transition: all 0.3s ease;
        background: var(--bg-secondary);
        color: var(--text-primary);
        cursor: pointer;
    }

    .form-select:focus {
        outline: none;
        border-color: var(--primary-color);
        background: white;
        box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.1);
        transform: translateY(-2px);
    }

    .toggle-switch {
        position: relative;
        display: inline-block;
        width: 60px;
        height: 34px;
    }

    .toggle-switch input {
        opacity: 0;
        width: 0;
        height: 0;
    }

    .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: var(--border-color);
        transition: 0.4s;
        border-radius: 34px;
    }

    .slider:before {
        position: absolute;
        content: "";
        height: 26px;
        width: 26px;
        left: 4px;
        bottom: 4px;
        background-color: white;
        transition: 0.4s;
        border-radius: 50%;
    }

    input:checked + .slider {
        background-color: var(--primary-color);
    }

    input:checked + .slider:before {
        transform: translateX(26px);
    }

    .toggle-label {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 1rem;
    }

    .toggle-text {
        font-weight: 500;
        color: var(--text-primary);
    }

    .toggle-description {
        color: var(--text-secondary);
        font-size: 0.85rem;
        margin-top: 0.25rem;
    }

    .color-picker {
        display: flex;
        gap: 1rem;
        flex-wrap: wrap;
    }

    .color-option {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        cursor: pointer;
        border: 3px solid transparent;
        transition: all 0.3s ease;
        position: relative;
    }

    .color-option:hover {
        transform: scale(1.1);
    }

    .color-option.active {
        border-color: var(--primary-color);
        transform: scale(1.1);
    }

    .color-option.active::after {
        content: '✓';
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        color: white;
        font-weight: bold;
        text-shadow: 0 0 3px rgba(0,0,0,0.5);
    }

    .btn-save {
        background: linear-gradient(135deg, var(--success-color), #059669);
        border: none;
        border-radius: 12px;
        padding: 0.75rem 1.5rem;
        color: white;
        font-weight: 600;
        font-size: 1rem;
        transition: all 0.3s ease;
        cursor: pointer;
        display: flex;
        align-items: center;
        gap: 0.5rem;
        box-shadow: 0 4px 12px rgba(16, 185, 129, 0.3);
    }

    .btn-save:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(16, 185, 129, 0.4);
    }

    .btn-secondary {
        background: linear-gradient(135deg, var(--text-secondary), #6b7280);
        border: none;
        border-radius: 12px;
        padding: 0.75rem 1.5rem;
        color: white;
        font-weight: 600;
        font-size: 1rem;
        transition: all 0.3s ease;
        cursor: pointer;
        display: flex;
        align-items: center;
        gap: 0.5rem;
        box-shadow: 0 4px 12px rgba(107, 114, 128, 0.3);
    }

    .btn-secondary:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(107, 114, 128, 0.4);
    }

    .button-group {
        display: flex;
        gap: 1rem;
        flex-wrap: wrap;
        margin-top: 1.5rem;
    }

    .danger-zone {
        background: linear-gradient(135deg, #fef2f2, #fee2e2);
        border: 2px solid var(--danger-color);
        border-radius: 16px;
        padding: 1.5rem;
        margin-top: 1.5rem;
    }

    .danger-zone h4 {
        color: var(--danger-color);
        margin-bottom: 1rem;
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }

    .btn-danger {
        background: linear-gradient(135deg, var(--danger-color), #dc2626);
        border: none;
        border-radius: 12px;
        padding: 0.75rem 1.5rem;
        color: white;
        font-weight: 600;
        font-size: 1rem;
        transition: all 0.3s ease;
        cursor: pointer;
        display: flex;
        align-items: center;
        gap: 0.5rem;
        box-shadow: 0 4px 12px rgba(239, 68, 68, 0.3);
    }

    .btn-danger:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(239, 68, 68, 0.4);
    }

    .info-box {
        background: rgba(59, 130, 246, 0.1);
        border: 1px solid rgba(59, 130, 246, 0.3);
        border-radius: 12px;
        padding: 1rem;
        margin-bottom: 1rem;
        color: var(--info-color);
        font-size: 0.9rem;
        line-height: 1.5;
    }

    .info-box i {
        margin-right: 0.5rem;
    }

    @keyframes rotate {
        from { transform: rotate(0deg); }
        to { transform: rotate(360deg); }
    }

    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .settings-card {
        animation: fadeInUp 0.6s ease forwards;
    }

    .settings-card:nth-child(1) { animation-delay: 0.1s; }
    .settings-card:nth-child(2) { animation-delay: 0.2s; }
    .settings-card:nth-child(3) { animation-delay: 0.3s; }
    .settings-card:nth-child(4) { animation-delay: 0.4s; }
    .settings-card:nth-child(5) { animation-delay: 0.5s; }
    .settings-card:nth-child(6) { animation-delay: 0.6s; }

    @media (max-width: 768px) {
        .settings-container {
            padding: 1rem;
        }
        
        .header-title {
            font-size: 2rem;
        }
        
        .settings-grid {
            grid-template-columns: 1fr;
        }
        
        .button-group {
            flex-direction: column;
        }
        
        .color-picker {
            justify-content: center;
        }
    }
</style>

<div class="settings-container">
    <!-- Settings Header -->
    <div class="settings-header">
        <div class="header-content">
            <h1 class="header-title">Settings</h1>
            <p class="header-subtitle">Customize your experience and manage system preferences</p>
        </div>
    </div>

    <div class="settings-content">
        <!-- Profile Settings -->
        <div class="settings-card">
            <div class="card-header profile">
                <div class="card-icon">
                    <i class="bi bi-person-circle"></i>
                </div>
                <div>
                    <h3 class="card-title">Profile Settings</h3>
                    <p class="card-description">Manage your personal information and account details</p>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">Full Name</label>
                <input type="text" class="form-input" value="Admin User" placeholder="Enter your full name">
            </div>

            <div class="form-group">
                <label class="form-label">Email Address</label>
                <input type="email" class="form-input" value="admin@pahanaedu.com" placeholder="Enter your email">
            </div>

            <div class="form-group">
                <label class="form-label">Phone Number</label>
                <input type="tel" class="form-input" value="+94 11 234 5678" placeholder="Enter your phone number">
            </div>

            <div class="form-group">
                <label class="form-label">Role</label>
                <select class="form-select">
                    <option value="admin">System Administrator</option>
                    <option value="manager">Manager</option>
                    <option value="staff">Staff Member</option>
                </select>
            </div>

            <div class="button-group">
                <button class="btn-save">
                    <i class="bi bi-check-circle"></i>
                    Save Changes
                </button>
                <button class="btn-secondary">
                    <i class="bi bi-arrow-clockwise"></i>
                    Reset
                </button>
            </div>
        </div>

        <!-- Security Settings -->
        <div class="settings-card">
            <div class="card-header security">
                <div class="card-icon">
                    <i class="bi bi-shield-lock"></i>
                </div>
                <div>
                    <h3 class="card-title">Security & Privacy</h3>
                    <p class="card-description">Configure security settings and privacy preferences</p>
                </div>
            </div>

            <div class="toggle-label">
                <div>
                    <div class="toggle-text">Two-Factor Authentication</div>
                    <div class="toggle-description">Add an extra layer of security to your account</div>
                </div>
                <label class="toggle-switch">
                    <input type="checkbox" checked>
                    <span class="slider"></span>
                </label>
            </div>

            <div class="toggle-label">
                <div>
                    <div class="toggle-text">Session Timeout</div>
                    <div class="toggle-description">Automatically log out after inactivity</div>
                </div>
                <label class="toggle-switch">
                    <input type="checkbox" checked>
                    <span class="slider"></span>
                </label>
            </div>

            <div class="form-group">
                <label class="form-label">Session Timeout (minutes)</label>
                <select class="form-select">
                    <option value="15">15 minutes</option>
                    <option value="30" selected>30 minutes</option>
                    <option value="60">1 hour</option>
                    <option value="120">2 hours</option>
                </select>
            </div>

            <div class="button-group">
                <button class="btn-save">
                    <i class="bi bi-shield-check"></i>
                    Update Security
                </button>
            </div>
        </div>

        <!-- Notification Settings -->
        <div class="settings-card">
            <div class="card-header notifications">
                <div class="card-icon">
                    <i class="bi bi-bell"></i>
                </div>
                <div>
                    <h3 class="card-title">Notifications</h3>
                    <p class="card-description">Choose how and when you want to be notified</p>
                </div>
            </div>

            <div class="toggle-label">
                <div>
                    <div class="toggle-text">Email Notifications</div>
                    <div class="toggle-description">Receive notifications via email</div>
                </div>
                <label class="toggle-switch">
                    <input type="checkbox" checked>
                    <span class="slider"></span>
                </label>
            </div>

            <div class="toggle-label">
                <div>
                    <div class="toggle-text">Low Stock Alerts</div>
                    <div class="toggle-description">Get notified when items are running low</div>
                </div>
                <label class="toggle-switch">
                    <input type="checkbox" checked>
                    <span class="slider"></span>
                </label>
            </div>

            <div class="toggle-label">
                <div>
                    <div class="toggle-text">New Customer Notifications</div>
                    <div class="toggle-description">Alert when new customers are added</div>
                </div>
                <label class="toggle-switch">
                    <input type="checkbox">
                    <span class="slider"></span>
                </label>
            </div>

            <div class="button-group">
                <button class="btn-save">
                    <i class="bi bi-bell-check"></i>
                    Save Preferences
                </button>
            </div>
        </div>

        <!-- Appearance Settings -->
        <div class="settings-card">
            <div class="card-header appearance">
                <div class="card-icon">
                    <i class="bi bi-palette"></i>
                </div>
                <div>
                    <h3 class="card-title">Appearance</h3>
                    <p class="card-description">Customize the look and feel of your interface</p>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">Theme</label>
                <select class="form-select">
                    <option value="light" selected>Light Theme</option>
                    <option value="dark">Dark Theme</option>
                    <option value="auto">Auto (System)</option>
                </select>
            </div>

            <div class="form-group">
                <label class="form-label">Primary Color</label>
                <div class="color-picker">
                    <div class="color-option active" style="background-color: #6366f1;" data-color="#6366f1"></div>
                    <div class="color-option" style="background-color: #10b981;" data-color="#10b981"></div>
                    <div class="color-option" style="background-color: #f59e0b;" data-color="#f59e0b"></div>
                    <div class="color-option" style="background-color: #ef4444;" data-color="#ef4444"></div>
                    <div class="color-option" style="background-color: #8b5cf6;" data-color="#8b5cf6"></div>
                    <div class="color-option" style="background-color: #06b6d4;" data-color="#06b6d4"></div>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">Font Size</label>
                <select class="form-select">
                    <option value="small">Small</option>
                    <option value="medium" selected>Medium</option>
                    <option value="large">Large</option>
                </select>
            </div>

            <div class="button-group">
                <button class="btn-save">
                    <i class="bi bi-palette-check"></i>
                    Apply Theme
                </button>
                <button class="btn-secondary">
                    <i class="bi bi-arrow-clockwise"></i>
                    Reset to Default
                </button>
            </div>
        </div>

        <!-- System Settings -->
        <div class="settings-card">
            <div class="card-header system">
                <div class="card-icon">
                    <i class="bi bi-gear"></i>
                </div>
                <div>
                    <h3 class="card-title">System Preferences</h3>
                    <p class="card-description">Configure system-wide settings and preferences</p>
                </div>
            </div>

            <div class="form-group">
                <label class="form-label">Language</label>
                <select class="form-select">
                    <option value="en" selected>English</option>
                    <option value="si">සිංහල (Sinhala)</option>
                    <option value="ta">தமிழ் (Tamil)</option>
                </select>
            </div>

            <div class="form-group">
                <label class="form-label">Time Zone</label>
                <select class="form-select">
                    <option value="Asia/Colombo" selected>Asia/Colombo (UTC+5:30)</option>
                    <option value="UTC">UTC (UTC+0:00)</option>
                    <option value="America/New_York">America/New_York (UTC-5:00)</option>
                </select>
            </div>

            <div class="form-group">
                <label class="form-label">Date Format</label>
                <select class="form-select">
                    <option value="DD/MM/YYYY" selected>DD/MM/YYYY</option>
                    <option value="MM/DD/YYYY">MM/DD/YYYY</option>
                    <option value="YYYY-MM-DD">YYYY-MM-DD</option>
                </select>
            </div>

            <div class="form-group">
                <label class="form-label">Currency</label>
                <select class="form-select">
                    <option value="LKR" selected>LKR (Sri Lankan Rupee)</option>
                    <option value="USD">USD (US Dollar)</option>
                    <option value="EUR">EUR (Euro)</option>
                </select>
            </div>

            <div class="button-group">
                <button class="btn-save">
                    <i class="bi bi-gear-check"></i>
                    Save Settings
                </button>
            </div>
        </div>

        <!-- Billing & Subscription -->
        <div class="settings-card">
            <div class="card-header billing">
                <div class="card-icon">
                    <i class="bi bi-credit-card"></i>
                </div>
                <div>
                    <h3 class="card-title">Billing & Subscription</h3>
                    <p class="card-description">Manage your billing information and subscription</p>
                </div>
            </div>

            <div class="info-box">
                <i class="bi bi-info-circle"></i>
                <strong>Current Plan:</strong> Professional Plan - LKR 2,500/month
            </div>

            <div class="form-group">
                <label class="form-label">Billing Cycle</label>
                <select class="form-select">
                    <option value="monthly" selected>Monthly</option>
                    <option value="quarterly">Quarterly</option>
                    <option value="yearly">Yearly (Save 20%)</option>
                </select>
            </div>

            <div class="form-group">
                <label class="form-label">Payment Method</label>
                <select class="form-select">
                    <option value="credit_card" selected>Credit Card</option>
                    <option value="bank_transfer">Bank Transfer</option>
                    <option value="paypal">PayPal</option>
                </select>
            </div>

            <div class="button-group">
                <button class="btn-save">
                    <i class="bi bi-credit-card-check"></i>
                    Update Billing
                </button>
                <button class="btn-secondary">
                    <i class="bi bi-download"></i>
                    Download Invoice
                </button>
            </div>

            <!-- Danger Zone -->
            <div class="danger-zone">
                <h4>
                    <i class="bi bi-exclamation-triangle"></i>
                    Danger Zone
                </h4>
                <p style="color: var(--text-secondary); margin-bottom: 1rem;">
                    These actions cannot be undone. Please proceed with caution.
                </p>
                <button class="btn-danger">
                    <i class="bi bi-trash"></i>
                    Cancel Subscription
                </button>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Color picker functionality
        const colorOptions = document.querySelectorAll('.color-option');
        colorOptions.forEach(option => {
            option.addEventListener('click', function() {
                // Remove active class from all options
                colorOptions.forEach(opt => opt.classList.remove('active'));
                // Add active class to clicked option
                this.classList.add('active');
                
                // Get the selected color
                const selectedColor = this.dataset.color;
                console.log('Selected color:', selectedColor);
                
                // Here you can implement the logic to change the theme color
                // For example, updating CSS variables or sending to server
            });
        });

        // Form submission handling
        const saveButtons = document.querySelectorAll('.btn-save');
        saveButtons.forEach(button => {
            button.addEventListener('click', function() {
                // Add loading state
                const originalText = this.innerHTML;
                this.innerHTML = '<i class="bi bi-hourglass-split"></i> Saving...';
                this.disabled = true;
                
                // Simulate save operation
                setTimeout(() => {
                    this.innerHTML = '<i class="bi bi-check-circle"></i> Saved!';
                    this.style.background = 'linear-gradient(135deg, #10b981, #059669)';
                    
                    // Reset after 2 seconds
                    setTimeout(() => {
                        this.innerHTML = originalText;
                        this.disabled = false;
                        this.style.background = '';
                    }, 2000);
                }, 1000);
            });
        });

        // Toggle switch functionality
        const toggleSwitches = document.querySelectorAll('.toggle-switch input');
        toggleSwitches.forEach(toggle => {
            toggle.addEventListener('change', function() {
                const isChecked = this.checked;
                console.log('Toggle changed:', isChecked);
                
                // Here you can implement the logic to save the toggle state
                // For example, sending to server or updating local storage
            });
        });

        // Form input focus effects
        const formInputs = document.querySelectorAll('.form-input, .form-select');
        formInputs.forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.style.transform = 'scale(1.02)';
            });
            
            input.addEventListener('blur', function() {
                this.parentElement.style.transform = 'scale(1)';
            });
        });
    });
</script>
