<jsp:include page="header.jsp">
    <jsp:param name="title" value="Dashboard"/>
</jsp:include>

<!-- Dashboard CSS -->
<style>
    :root {
        --primary-color: #6366f1;
        --primary-dark: #4f46e5;
        --secondary-color: #06b6d4;
        --accent-color: #f59e0b;
        --success-color: #10b981;
        --danger-color: #ef4444;
        --warning-color: #f59e0b;
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

    .dashboard-container {
        background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
        min-height: calc(100vh - 60px);
        padding: 2rem;
    }

    .welcome-section {
        background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
        color: white;
        border-radius: 20px;
        padding: 2rem;
        margin-bottom: 2rem;
        position: relative;
        overflow: hidden;
    }

    .welcome-section::before {
        content: '';
        position: absolute;
        top: -50%;
        right: -50%;
        width: 200%;
        height: 200%;
        background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
        animation: rotate 20s linear infinite;
    }

    .welcome-content {
        position: relative;
        z-index: 1;
    }

    .welcome-title {
        font-size: 2.5rem;
        font-weight: 700;
        margin-bottom: 0.5rem;
        letter-spacing: -0.5px;
    }

    .welcome-subtitle {
        font-size: 1.1rem;
        opacity: 0.9;
        font-weight: 400;
    }

    .stats-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 1.5rem;
        margin-bottom: 2rem;
    }

    .stat-card {
        background: var(--bg-primary);
        border-radius: 16px;
        padding: 1.5rem;
        box-shadow: var(--shadow-md);
        border: 1px solid var(--border-color);
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        position: relative;
        overflow: hidden;
    }

    .stat-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 4px;
        background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
    }

    .stat-card:hover {
        transform: translateY(-5px);
        box-shadow: var(--shadow-xl);
    }

    .stat-icon {
        width: 60px;
        height: 60px;
        border-radius: 16px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.5rem;
        color: white;
        margin-bottom: 1rem;
    }

    .stat-icon.primary { background: linear-gradient(135deg, var(--primary-color), var(--primary-dark)); }
    .stat-icon.success { background: linear-gradient(135deg, var(--success-color), #059669); }
    .stat-icon.warning { background: linear-gradient(135deg, var(--warning-color), #d97706); }
    .stat-icon.info { background: linear-gradient(135deg, var(--info-color), #2563eb); }

    .stat-value {
        font-size: 2rem;
        font-weight: 700;
        color: var(--text-primary);
        margin-bottom: 0.5rem;
    }

    .stat-label {
        font-size: 0.9rem;
        color: var(--text-secondary);
        font-weight: 500;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .quick-actions {
        background: var(--bg-primary);
        border-radius: 20px;
        padding: 2rem;
        margin-bottom: 2rem;
        box-shadow: var(--shadow-md);
        border: 1px solid var(--border-color);
    }

    .section-title {
        font-size: 1.5rem;
        font-weight: 600;
        color: var(--text-primary);
        margin-bottom: 1.5rem;
        display: flex;
        align-items: center;
        gap: 0.75rem;
    }

    .actions-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 1rem;
    }

    .action-card {
        background: linear-gradient(135deg, var(--bg-secondary), var(--bg-primary));
        border: 2px solid var(--border-color);
        border-radius: 16px;
        padding: 1.5rem;
        text-align: center;
        transition: all 0.3s ease;
        cursor: pointer;
        text-decoration: none;
        color: inherit;
    }

    .action-card:hover {
        transform: translateY(-3px);
        border-color: var(--primary-color);
        box-shadow: var(--shadow-lg);
        text-decoration: none;
        color: inherit;
    }

    .action-icon {
        width: 50px;
        height: 50px;
        background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 1rem;
        color: white;
        font-size: 1.25rem;
    }

    .action-title {
        font-size: 1rem;
        font-weight: 600;
        color: var(--text-primary);
        margin-bottom: 0.5rem;
    }

    .action-description {
        font-size: 0.85rem;
        color: var(--text-secondary);
        line-height: 1.4;
    }

    .charts-section {
        display: grid;
        grid-template-columns: 2fr 1fr;
        gap: 1.5rem;
        margin-bottom: 2rem;
    }

    .chart-card {
        background: var(--bg-primary);
        border-radius: 20px;
        padding: 1.5rem;
        box-shadow: var(--shadow-md);
        border: 1px solid var(--border-color);
    }

    .chart-title {
        font-size: 1.25rem;
        font-weight: 600;
        color: var(--text-primary);
        margin-bottom: 1rem;
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }

    .recent-activity {
        background: var(--bg-primary);
        border-radius: 20px;
        padding: 1.5rem;
        box-shadow: var(--shadow-md);
        border: 1px solid var(--border-color);
    }

    .activity-item {
        display: flex;
        align-items: center;
        gap: 1rem;
        padding: 1rem 0;
        border-bottom: 1px solid var(--border-color);
    }

    .activity-item:last-child {
        border-bottom: none;
    }

    .activity-icon {
        width: 40px;
        height: 40px;
        border-radius: 10px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-size: 1rem;
    }

    .activity-content h6 {
        margin: 0;
        font-size: 0.9rem;
        font-weight: 600;
        color: var(--text-primary);
    }

    .activity-content p {
        margin: 0;
        font-size: 0.8rem;
        color: var(--text-secondary);
    }

    .activity-time {
        font-size: 0.75rem;
        color: var(--text-secondary);
        margin-left: auto;
    }

    @keyframes rotate {
        from { transform: rotate(0deg); }
        to { transform: rotate(360deg); }
    }

    @media (max-width: 768px) {
        .dashboard-container {
            padding: 1rem;
        }
        
        .charts-section {
            grid-template-columns: 1fr;
        }
        
        .stats-grid {
            grid-template-columns: 1fr;
        }
        
        .actions-grid {
            grid-template-columns: 1fr;
        }
        
        .welcome-title {
            font-size: 2rem;
        }
    }

    .clock-widget {
        background: linear-gradient(135deg, var(--accent-color), #d97706);
        color: white;
        border-radius: 16px;
        padding: 1.5rem;
        text-align: center;
        margin-bottom: 1.5rem;
    }

    .clock-time {
        font-size: 2.5rem;
        font-weight: 700;
        margin-bottom: 0.5rem;
        font-family: 'Courier New', monospace;
    }

    .clock-date {
        font-size: 1rem;
        opacity: 0.9;
    }
</style>

<div class="dashboard-container">
    <!-- Welcome Section -->
    <div class="welcome-section">
        <div class="welcome-content">
                            <h1 class="welcome-title">Welcome back, ${sessionScope.loggedInUser.fullName}!</h1>
            <p class="welcome-subtitle">Here's what's happening with your business today</p>
        </div>
    </div>

    <!-- Clock Widget -->
    <div class="clock-widget">
        <div class="clock-time" id="clockTime">--:--:--</div>
        <div class="clock-date" id="clockDate">-- -- ----</div>
    </div>

    <!-- Statistics Cards -->
    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-icon primary">
                <i class="fas fa-users"></i>
            </div>
            <div class="stat-value" id="totalCustomers">0</div>
            <div class="stat-label">Total Customers</div>
        </div>
        
        <div class="stat-card">
            <div class="stat-icon success">
                <i class="fas fa-box"></i>
            </div>
            <div class="stat-value" id="totalItems">0</div>
            <div class="stat-label">Inventory Items</div>
        </div>
        
        <div class="stat-card">
            <div class="stat-icon warning">
                <i class="fas fa-receipt"></i>
            </div>
            <div class="stat-value" id="totalBills">0</div>
            <div class="stat-label">Total Bills</div>
        </div>
        
        <div class="stat-card">
            <div class="stat-icon info">
                <i class="fas fa-dollar-sign"></i>
            </div>
            <div class="stat-value" id="totalRevenue">$0</div>
            <div class="stat-label">Total Revenue</div>
        </div>
    </div>

    <!-- Quick Actions -->
    <div class="quick-actions">
        <h2 class="section-title">
            <i class="fas fa-bolt" style="color: var(--accent-color);"></i>
            Quick Actions
        </h2>
        <div class="actions-grid">
            <a href="${pageContext.request.contextPath}/app/customers" class="action-card">
                <div class="action-icon">
                    <i class="fas fa-users"></i>
                </div>
                <div class="action-title">Manage Customers</div>
                <div class="action-description">Add, edit, or view customer accounts</div>
            </a>
            
            <a href="${pageContext.request.contextPath}/app/items" class="action-card">
                <div class="action-icon">
                    <i class="fas fa-box"></i>
                </div>
                <div class="action-title">Inventory Control</div>
                <div class="action-description">Manage your product inventory</div>
            </a>
            
            <a href="${pageContext.request.contextPath}/app/bill?action=new" class="action-card">
                <div class="action-icon">
                    <i class="fas fa-receipt"></i>
                </div>
                <div class="action-title">Create Bill</div>
                <div class="action-description">Generate new customer invoices</div>
            </a>
            
            <a href="${pageContext.request.contextPath}/app/help.jsp" class="action-card">
                <div class="action-icon">
                    <i class="fas fa-question-circle"></i>
                </div>
                <div class="action-title">Help & Support</div>
                <div class="action-description">Get help and system guidance</div>
            </a>
        </div>
    </div>

    <!-- Charts and Analytics -->
    <div class="charts-section">
        <!-- Sales Chart -->
        <div class="chart-card">
            <h3 class="chart-title">
                <i class="fas fa-chart-line" style="color: var(--success-color);"></i>
                Sales Overview
            </h3>
            <canvas id="salesChart" width="400" height="200"></canvas>
        </div>
        
        <!-- Recent Activity -->
        <div class="recent-activity">
            <h3 class="chart-title">
                <i class="fas fa-history" style="color: var(--primary-color);"></i>
                Recent Activity
            </h3>
            <div class="activity-item">
                <div class="activity-icon" style="background: var(--success-color);">
                    <i class="fas fa-plus"></i>
                </div>
                <div class="activity-content">
                    <h6>New Customer Added</h6>
                    <p>John Doe registered</p>
                </div>
                <div class="activity-time">2 min ago</div>
            </div>
            <div class="activity-item">
                <div class="activity-icon" style="background: var(--warning-color);">
                    <i class="fas fa-receipt"></i>
                </div>
                <div class="activity-content">
                    <h6>Bill Generated</h6>
                    <p>Invoice #BILL-001 created</p>
                </div>
                <div class="activity-time">15 min ago</div>
            </div>
            <div class="activity-item">
                <div class="activity-icon" style="background: var(--info-color);">
                    <i class="fas fa-box"></i>
                </div>
                <div class="activity-content">
                    <h6>Inventory Updated</h6>
                    <p>Stock levels adjusted</p>
                </div>
                <div class="activity-time">1 hour ago</div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- Dashboard JavaScript -->
<script>
    // Live Clock
    function updateClock() {
        const now = new Date();
        const timeString = now.toLocaleTimeString('en-US', { 
            hour12: false,
            hour: '2-digit',
            minute: '2-digit',
            second: '2-digit'
        });
        const dateString = now.toLocaleDateString('en-US', { 
            weekday: 'long',
            year: 'numeric',
            month: 'long',
            day: 'numeric'
        });
        
        document.getElementById('clockTime').textContent = timeString;
        document.getElementById('clockDate').textContent = dateString;
    }
    
    // Update clock every second
    setInterval(updateClock, 1000);
    updateClock(); // Initial call

    // Sample data for statistics (replace with real data from backend)
    function updateStats() {
        // Simulate loading data
        setTimeout(() => {
            document.getElementById('totalCustomers').textContent = '156';
            document.getElementById('totalItems').textContent = '89';
            document.getElementById('totalBills').textContent = '342';
            document.getElementById('totalRevenue').textContent = 'LKR 12,450';
        }, 500);
    }

    // Enhanced Sales Chart
    const salesData = {
        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August'],
        datasets: [{
            label: 'Monthly Sales',
            data: [1200, 1900, 3000, 5000, 2300, 3200, 4100, 3800],
            backgroundColor: 'rgba(99, 102, 241, 0.1)',
            borderColor: 'rgba(99, 102, 241, 1)',
            borderWidth: 3,
            fill: true,
            tension: 0.4,
            pointBackgroundColor: 'rgba(99, 102, 241, 1)',
            pointBorderColor: '#ffffff',
            pointBorderWidth: 2,
            pointRadius: 6,
            pointHoverRadius: 8
        }]
    };

    const chartConfig = {
        type: 'line',
        data: salesData,
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    display: false
                },
                tooltip: {
                    backgroundColor: 'rgba(0, 0, 0, 0.8)',
                    titleColor: '#ffffff',
                    bodyColor: '#ffffff',
                    borderColor: 'rgba(99, 102, 241, 1)',
                    borderWidth: 1,
                    cornerRadius: 8,
                    displayColors: false
                }
            },
            scales: {
                x: {
                    grid: {
                        display: false
                    },
                    ticks: {
                        color: '#6b7280',
                        font: {
                            weight: '500'
                        }
                    }
                },
                y: {
                    beginAtZero: true,
                    grid: {
                        color: 'rgba(107, 114, 128, 0.1)'
                    },
                    ticks: {
                        color: '#6b7280',
                        font: {
                            weight: '500'
                        },
                                                 callback: function(value) {
                             return 'LKR ' + value.toLocaleString();
                         }
                    }
                }
            },
            elements: {
                point: {
                    hoverBackgroundColor: 'rgba(99, 102, 128, 1)'
                }
            }
        }
    };

    // Create the chart
    const salesChart = new Chart(
        document.getElementById('salesChart'),
        chartConfig
    );

    // Initialize dashboard
    document.addEventListener('DOMContentLoaded', function() {
        updateStats();
        
        // Add hover effects to action cards
        document.querySelectorAll('.action-card').forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-5px)';
            });
            
            card.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0)';
            });
        });
    });

    // Auto-refresh stats every 30 seconds
    setInterval(updateStats, 30000);
</script>