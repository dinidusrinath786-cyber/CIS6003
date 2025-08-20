<jsp:include page="header.jsp">
    <jsp:param name="title" value="Help & Support"/>
</jsp:include>

<!-- Help & Support CSS -->
<style>
    :root {
        --primary-color: #8b5cf6;
        --primary-dark: #7c3aed;
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

    .help-container {
        background: linear-gradient(135deg, #faf5ff 0%, #f3e8ff 100%);
        min-height: calc(100vh - 80px);
        padding: 2rem;
    }

    .help-header {
        background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
        color: white;
        border-radius: 20px;
        padding: 3rem 2rem;
        margin-bottom: 3rem;
        position: relative;
        overflow: hidden;
        text-align: center;
    }

    .help-header::before {
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
        font-size: 3rem;
        font-weight: 700;
        margin-bottom: 1rem;
        letter-spacing: -0.5px;
    }

    .header-subtitle {
        font-size: 1.2rem;
        opacity: 0.9;
        font-weight: 400;
        margin-bottom: 1.5rem;
        max-width: 600px;
        margin-left: auto;
        margin-right: auto;
        line-height: 1.6;
    }

    .header-stats {
        display: flex;
        justify-content: center;
        gap: 2rem;
        flex-wrap: wrap;
        margin-top: 2rem;
    }

    .stat-item {
        background: rgba(255, 255, 255, 0.2);
        padding: 1rem 1.5rem;
        border-radius: 16px;
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.3);
    }

    .stat-number {
        font-size: 1.5rem;
        font-weight: 700;
        display: block;
    }

    .stat-label {
        font-size: 0.9rem;
        opacity: 0.8;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .help-content {
        max-width: 1200px;
        margin: 0 auto;
    }

    .help-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
        gap: 2rem;
        margin-bottom: 3rem;
    }

    .help-card {
        background: var(--bg-primary);
        border-radius: 20px;
        padding: 2rem;
        box-shadow: var(--shadow-lg);
        border: 1px solid var(--border-color);
        transition: all 0.3s ease;
        position: relative;
        overflow: hidden;
    }

    .help-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 4px;
        background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
        transform: scaleX(0);
        transition: transform 0.3s ease;
    }

    .help-card:hover {
        transform: translateY(-8px);
        box-shadow: var(--shadow-xl);
    }

    .help-card:hover::before {
        transform: scaleX(1);
    }

    .help-card-icon {
        width: 80px;
        height: 80px;
        border-radius: 20px;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-bottom: 1.5rem;
        font-size: 2rem;
        color: white;
        position: relative;
        overflow: hidden;
    }

    .help-card-icon::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
        opacity: 0.9;
    }

    .help-card-icon i {
        position: relative;
        z-index: 1;
    }

    .help-card.dashboard .help-card-icon::before {
        background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
    }

    .help-card.customers .help-card-icon::before {
        background: linear-gradient(135deg, var(--success-color), #059669);
    }

    .help-card.items .help-card-icon::before {
        background: linear-gradient(135deg, var(--info-color), #2563eb);
    }

    .help-card.bills .help-card-icon::before {
        background: linear-gradient(135deg, var(--warning-color), #d97706);
    }

    .help-card.print .help-card-icon::before {
        background: linear-gradient(135deg, var(--danger-color), #dc2626);
    }

    .help-card-title {
        font-size: 1.5rem;
        font-weight: 600;
        color: var(--text-primary);
        margin-bottom: 1rem;
        line-height: 1.3;
    }

    .help-card-description {
        color: var(--text-secondary);
        line-height: 1.6;
        font-size: 1rem;
        margin-bottom: 1.5rem;
    }

    .help-card-actions {
        display: flex;
        gap: 0.75rem;
        flex-wrap: wrap;
    }

    .help-action-btn {
        background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
        border: none;
        border-radius: 12px;
        padding: 0.75rem 1.5rem;
        color: white;
        font-weight: 500;
        font-size: 0.9rem;
        transition: all 0.3s ease;
        text-decoration: none;
        display: flex;
        align-items: center;
        gap: 0.5rem;
        box-shadow: 0 4px 12px rgba(139, 92, 246, 0.3);
    }

    .help-action-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(139, 92, 246, 0.4);
        color: white;
        text-decoration: none;
    }

    .help-action-btn.secondary {
        background: linear-gradient(135deg, var(--text-secondary), #6b7280);
    }

    .help-action-btn.secondary:hover {
        box-shadow: 0 6px 20px rgba(107, 114, 128, 0.4);
    }

    .quick-start-section {
        background: var(--bg-primary);
        border-radius: 20px;
        padding: 2.5rem;
        margin-bottom: 3rem;
        box-shadow: var(--shadow-lg);
        border: 1px solid var(--border-color);
        text-align: center;
    }

    .quick-start-title {
        font-size: 2rem;
        font-weight: 600;
        color: var(--text-primary);
        margin-bottom: 1rem;
    }

    .quick-start-description {
        color: var(--text-secondary);
        font-size: 1.1rem;
        line-height: 1.6;
        margin-bottom: 2rem;
        max-width: 600px;
        margin-left: auto;
        margin-right: auto;
    }

    .quick-start-steps {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 1.5rem;
        margin-bottom: 2rem;
    }

    .step-item {
        text-align: center;
        padding: 1.5rem;
        background: var(--bg-secondary);
        border-radius: 16px;
        border: 1px solid var(--border-color);
    }

    .step-number {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: 600;
        margin: 0 auto 1rem;
        font-size: 1.1rem;
    }

    .step-title {
        font-weight: 600;
        color: var(--text-primary);
        margin-bottom: 0.5rem;
    }

    .step-description {
        color: var(--text-secondary);
        font-size: 0.9rem;
        line-height: 1.4;
    }

    .contact-support {
        background: linear-gradient(135deg, var(--secondary-color), #0891b2);
        color: white;
        border-radius: 20px;
        padding: 2.5rem;
        text-align: center;
        box-shadow: var(--shadow-lg);
    }

    .contact-support h3 {
        font-size: 2rem;
        font-weight: 600;
        margin-bottom: 1rem;
    }

    .contact-support p {
        font-size: 1.1rem;
        opacity: 0.9;
        margin-bottom: 2rem;
        max-width: 500px;
        margin-left: auto;
        margin-right: auto;
    }

    .contact-btn {
        background: rgba(255, 255, 255, 0.2);
        border: 2px solid rgba(255, 255, 255, 0.3);
        border-radius: 16px;
        padding: 1rem 2rem;
        color: white;
        font-weight: 600;
        font-size: 1.1rem;
        transition: all 0.3s ease;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        gap: 0.75rem;
        backdrop-filter: blur(10px);
    }

    .contact-btn:hover {
        background: rgba(255, 255, 255, 0.3);
        border-color: rgba(255, 255, 255, 0.5);
        transform: translateY(-2px);
        color: white;
        text-decoration: none;
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

    .help-card {
        animation: fadeInUp 0.6s ease forwards;
    }

    .help-card:nth-child(1) { animation-delay: 0.1s; }
    .help-card:nth-child(2) { animation-delay: 0.2s; }
    .help-card:nth-child(3) { animation-delay: 0.3s; }
    .help-card:nth-child(4) { animation-delay: 0.4s; }
    .help-card:nth-child(5) { animation-delay: 0.5s; }

    @media (max-width: 768px) {
        .help-container {
            padding: 1rem;
        }
        
        .header-title {
            font-size: 2rem;
        }
        
        .help-grid {
            grid-template-columns: 1fr;
        }
        
        .header-stats {
            flex-direction: column;
            gap: 1rem;
        }
        
        .quick-start-steps {
            grid-template-columns: 1fr;
        }
    }
</style>

<div class="help-container">
    <!-- Help Header -->
    <div class="help-header">
        <div class="header-content">
            <h1 class="header-title">Help & Support</h1>
            <p class="header-subtitle">Welcome to the Pahana Edu Bookshop Management System. Here's everything you need to know to get started and make the most of our powerful features.</p>
            
            <div class="header-stats">
                <div class="stat-item">
                    <span class="stat-number">5</span>
                    <span class="stat-label">Main Features</span>
                </div>
                <div class="stat-item">
                    <span class="stat-number">24/7</span>
                    <span class="stat-label">Support</span>
                </div>
                <div class="stat-item">
                    <span class="stat-number">100%</span>
                    <span class="stat-label">Reliable</span>
                </div>
            </div>
        </div>
    </div>

    <div class="help-content">
        <!-- Quick Start Guide -->
        <div class="quick-start-section">
            <h2 class="quick-start-title">🚀 Quick Start Guide</h2>
            <p class="quick-start-description">Get up and running with the Pahana Edu Bookshop Management System in just a few simple steps.</p>
            
            <div class="quick-start-steps">
                <div class="step-item">
                    <div class="step-number">1</div>
                    <div class="step-title">Login</div>
                    <div class="step-description">Access your account with secure credentials</div>
                </div>
                <div class="step-item">
                    <div class="step-number">2</div>
                    <div class="step-title">Dashboard</div>
                    <div class="step-description">View system overview and key metrics</div>
                </div>
                <div class="step-item">
                    <div class="step-number">3</div>
                    <div class="step-title">Manage Data</div>
                    <div class="step-description">Add customers, items, and create bills</div>
                </div>
                <div class="step-item">
                    <div class="step-number">4</div>
                    <div class="step-title">Generate Reports</div>
                    <div class="step-description">Print invoices and track business</div>
                </div>
            </div>
        </div>

        <!-- Help Topics Grid -->
        <div class="help-grid">
            <div class="help-card dashboard">
                <div class="help-card-icon">
                    <i class="bi bi-speedometer2"></i>
                </div>
                <h3 class="help-card-title">Dashboard Overview</h3>
                <p class="help-card-description">After logging in, you will see the main dashboard which provides quick access to all features, real-time statistics, and system overview.</p>
                <div class="help-card-actions">
                    <a href="${pageContext.request.contextPath}/app/dashboard.jsp" class="help-action-btn">
                        <i class="bi bi-arrow-right"></i>
                        Go to Dashboard
                    </a>
                </div>
            </div>

            <div class="help-card customers">
                <div class="help-card-icon">
                    <i class="bi bi-people-fill"></i>
                </div>
                <h3 class="help-card-title">Customer Management</h3>
                <p class="help-card-description">Click on the "Customers" to view, add, edit or delete customer records. Manage your customer database efficiently.</p>
                <div class="help-card-actions">
                    <a href="${pageContext.request.contextPath}/app/customers" class="help-action-btn">
                        <i class="bi bi-arrow-right"></i>
                        Manage Customers
                    </a>
                </div>
            </div>

            <div class="help-card items">
                <div class="help-card-icon">
                    <i class="bi bi-box-seam-fill"></i>
                </div>
                <h3 class="help-card-title">Inventory Management</h3>
                <p class="help-card-description">Click on the "Items" to view, add, edit or delete items. Keep track of your product inventory and stock levels.</p>
                <div class="help-card-actions">
                    <a href="${pageContext.request.contextPath}/app/items" class="help-action-btn">
                        <i class="bi bi-arrow-right"></i>
                        Manage Items
                    </a>
                </div>
            </div>

            <div class="help-card bills">
                <div class="help-card-icon">
                    <i class="bi bi-receipt-cutoff"></i>
                </div>
                <h3 class="help-card-title">Bill Creation</h3>
                <p class="help-card-description">Click on the "Create Bill" to generate bills for customers based on the items they have purchased. Streamline your billing process.</p>
                <div class="help-card-actions">
                    <a href="${pageContext.request.contextPath}/app/bill?action=new" class="help-action-btn">
                        <i class="bi bi-arrow-right"></i>
                        Create Bill
                    </a>
                </div>
            </div>

            <div class="help-card print">
                <div class="help-card-icon">
                    <i class="bi bi-printer-fill"></i>
                </div>
                <h3 class="help-card-title">Print & Export</h3>
                <p class="help-card-description">After creating a bill, you can use the "Print Bill" option to generate a printable copy of the invoice for the customer.</p>
                <div class="help-card-actions">
                    <a href="#" class="help-action-btn secondary">
                        <i class="bi bi-info-circle"></i>
                        Learn More
                    </a>
                </div>
            </div>
        </div>

        <!-- Contact Support -->
        <div class="contact-support">
            <h3>💬 Need More Help?</h3>
            <p>Our support team is here to help you with any questions or issues you might have. Don't hesitate to reach out!</p>
            <a href="mailto:support@pahanaedu.com" class="contact-btn">
                <i class="bi bi-envelope-fill"></i>
                Contact Support
            </a>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>