<jsp:include page="header.jsp">
    <jsp:param name="title" value="Customer Management"/>
</jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- Customer Management CSS -->
<style>
    :root {
        --primary-color: #3b82f6;
        --primary-dark: #2563eb;
        --success-color: #10b981;
        --warning-color: #f59e0b;
        --danger-color: #ef4444;
        --info-color: #06b6d4;
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

    .customer-container {
        background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
        min-height: calc(100vh - 80px);
        padding: 2rem;
    }

    .customer-header {
        background: linear-gradient(135deg, #3b82f6, #2563eb);
        color: white;
        border-radius: 16px;
        padding: 2rem;
        margin-bottom: 2rem;
        text-align: center;
        box-shadow: 0 4px 15px rgba(59, 130, 246, 0.3);
    }

    .header-content {
        position: relative;
        z-index: 1;
    }

    .header-title {
        font-size: 2.5rem;
        font-weight: 700;
        margin: 0;
        letter-spacing: -0.5px;
    }

    .add-customer-btn {
        background: linear-gradient(135deg, var(--success-color), #059669);
        border: none;
        border-radius: 16px;
        padding: 1rem 2rem;
        color: white;
        font-weight: 600;
        font-size: 1.1rem;
        transition: all 0.3s ease;
        display: inline-flex;
        align-items: center;
        gap: 0.75rem;
        box-shadow: 0 4px 15px rgba(16, 185, 129, 0.3);
        text-decoration: none;
    }

    .add-customer-btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 25px rgba(16, 185, 129, 0.4);
        color: white;
        text-decoration: none;
    }

    .stats-container {
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
        text-align: center;
        transition: all 0.3s ease;
    }

    .stat-card:hover {
        transform: translateY(-5px);
        box-shadow: var(--shadow-xl);
    }

    .stat-icon {
        width: 60px;
        height: 60px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 1rem;
        font-size: 1.5rem;
        color: white;
    }

    .stat-card.total .stat-icon {
        background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
    }

    .stat-card.active .stat-icon {
        background: linear-gradient(135deg, var(--success-color), #059669);
    }

    .stat-card.new .stat-icon {
        background: linear-gradient(135deg, var(--warning-color), #d97706);
    }

    .stat-card.growth .stat-icon {
        background: linear-gradient(135deg, var(--info-color), #0891b2);
    }

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

    .search-container {
        background: var(--bg-primary);
        border-radius: 16px;
        padding: 1.5rem;
        margin-bottom: 2rem;
        box-shadow: var(--shadow-md);
        border: 1px solid var(--border-color);
    }

    .search-box {
        position: relative;
        max-width: 400px;
        margin: 0 auto;
    }

    .search-input {
        width: 100%;
        padding: 1rem 1rem 1rem 3rem;
        border: 2px solid var(--border-color);
        border-radius: 12px;
        font-size: 1rem;
        transition: all 0.3s ease;
        background: var(--bg-secondary);
    }

    .search-input:focus {
        outline: none;
        border-color: var(--primary-color);
        background: white;
        box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.1);
        transform: translateY(-2px);
    }

    .search-icon {
        position: absolute;
        left: 1rem;
        top: 50%;
        transform: translateY(-50%);
        color: var(--text-secondary);
        font-size: 1.1rem;
    }

    .customer-table-container {
        background: var(--bg-primary);
        border-radius: 20px;
        padding: 2rem;
        box-shadow: var(--shadow-lg);
        border: 1px solid var(--border-color);
        overflow: hidden;
    }

    .table-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 1.5rem;
        padding-bottom: 1rem;
        border-bottom: 2px solid var(--border-color);
    }

    .table-title {
        font-size: 1.5rem;
        font-weight: 600;
        color: var(--text-primary);
        margin: 0;
    }

    .customer-count {
        background: var(--primary-color);
        color: white;
        padding: 0.5rem 1rem;
        border-radius: 20px;
        font-size: 0.9rem;
        font-weight: 500;
    }

    .customer-table {
        margin: 0;
        border-collapse: separate;
        border-spacing: 0;
        width: 100%;
    }

    .customer-table thead th {
        background: var(--bg-secondary);
        color: var(--text-primary);
        font-weight: 600;
        padding: 1.25rem 1rem;
        border: none;
        border-bottom: 2px solid var(--border-color);
        font-size: 0.9rem;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .customer-table tbody tr {
        transition: all 0.3s ease;
        border-bottom: 1px solid var(--border-color);
    }

    .customer-table tbody tr:hover {
        background: var(--bg-secondary);
        transform: scale(1.01);
        box-shadow: var(--shadow-sm);
    }

    .customer-table tbody td {
        padding: 1.25rem 1rem;
        border: none;
        vertical-align: middle;
        color: var(--text-primary);
    }

    .customer-name {
        font-weight: 600;
        color: var(--text-primary);
        display: flex;
        align-items: center;
        gap: 0.75rem;
    }

    .customer-avatar {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-weight: 600;
        font-size: 0.9rem;
    }

    .account-number {
        background: var(--bg-secondary);
        color: var(--text-primary);
        padding: 0.5rem 0.75rem;
        border-radius: 8px;
        font-family: 'Courier New', monospace;
        font-weight: 600;
        font-size: 0.9rem;
        border: 1px solid var(--border-color);
    }

    .customer-address {
        max-width: 200px;
        color: var(--text-secondary);
        line-height: 1.4;
    }

    .customer-phone {
        color: var(--text-primary);
        font-weight: 500;
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }

    .phone-icon {
        color: var(--success-color);
        font-size: 0.9rem;
    }

    .action-buttons {
        display: flex;
        gap: 0.5rem;
        flex-wrap: wrap;
    }

    .btn-edit {
        background: linear-gradient(135deg, var(--info-color), #0891b2);
        border: none;
        border-radius: 8px;
        padding: 0.5rem 1rem;
        color: white;
        font-weight: 500;
        font-size: 0.8rem;
        transition: all 0.3s ease;
        text-decoration: none;
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }

    .btn-edit:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(6, 182, 212, 0.3);
        color: white;
        text-decoration: none;
    }

    .btn-delete {
        background: linear-gradient(135deg, var(--danger-color), #dc2626);
        border: none;
        border-radius: 8px;
        padding: 0.5rem 1rem;
        color: white;
        font-weight: 500;
        font-size: 0.8rem;
        transition: all 0.3s ease;
        text-decoration: none;
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }

    .btn-delete:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(239, 68, 68, 0.3);
        color: white;
        text-decoration: none;
    }

    .empty-state {
        text-align: center;
        padding: 3rem 2rem;
        color: var(--text-secondary);
    }

    .empty-state i {
        font-size: 4rem;
        color: var(--border-color);
        margin-bottom: 1rem;
    }

    .empty-state h3 {
        color: var(--text-primary);
        margin-bottom: 0.5rem;
    }

    .empty-state p {
        margin-bottom: 1.5rem;
    }

    @keyframes rotate {
        from { transform: rotate(0deg); }
        to { transform: rotate(360deg); }
    }

    @media (max-width: 768px) {
        .customer-container {
            padding: 1rem;
        }
        
        .header-title {
            font-size: 2rem;
        }
        
        .stats-container {
            grid-template-columns: 1fr;
        }
        
        .customer-table-container {
            padding: 1rem;
        }
        
        .action-buttons {
            flex-direction: column;
        }
        
        .customer-address {
            max-width: 150px;
        }
    }
</style>

<div class="customer-container">
    <!-- Customer Header -->
    <div class="customer-header">
        <div class="header-content">
            <h1 class="header-title">Customer Management</h1>
        </div>
    </div>

    <!-- Add Customer Button -->
    <div style="text-align: center; margin-bottom: 2rem;">
        <a href="${pageContext.request.contextPath}/app/customers?action=new" class="add-customer-btn">
            <i class="bi bi-person-plus-fill"></i>
            Add New Customer
        </a>
    </div>

    <!-- Statistics Cards -->
    <div class="stats-container">
        <div class="stat-card total">
            <div class="stat-icon">
                <i class="bi bi-people-fill"></i>
            </div>
            <div class="stat-value" id="totalCustomers">0</div>
            <div class="stat-label">Total Customers</div>
        </div>
        
        <div class="stat-card active">
            <div class="stat-icon">
                <i class="bi bi-check-circle-fill"></i>
            </div>
            <div class="stat-value" id="activeCustomers">0</div>
            <div class="stat-label">Active Accounts</div>
        </div>
        
        <div class="stat-card new">
            <div class="stat-icon">
                <i class="bi bi-person-plus-fill"></i>
            </div>
            <div class="stat-value" id="newCustomers">0</div>
            <div class="stat-label">New This Month</div>
        </div>
        
        <div class="stat-card growth">
            <div class="stat-icon">
                <i class="bi bi-graph-up-arrow"></i>
            </div>
            <div class="stat-value" id="growthRate">0%</div>
            <div class="stat-label">Growth Rate</div>
        </div>
    </div>

    <!-- Search Container -->
    <div class="search-container">
        <div class="search-box">
            <i class="bi bi-search search-icon"></i>
            <input type="text" class="search-input" id="customerSearch" placeholder="Search customers by name, account number, or phone...">
        </div>
    </div>

    <!-- Customer Table Container -->
    <div class="customer-table-container">
        <div class="table-header">
            <h2 class="table-title">
                <i class="bi bi-table" style="color: var(--primary-color); margin-right: 0.5rem;"></i>
                Customer Directory
            </h2>
            <div class="customer-count" id="customerCount">0 customers</div>
</div>

<div class="table-responsive">
            <table class="customer-table" id="customerTable">
        <thead>
        <tr>
                        <th>Customer</th>
            <th>Account #</th>
            <th>Address</th>
                        <th>Contact</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
                    <c:choose>
                        <c:when test="${not empty customerList}">
        <c:forEach var="customer" items="${customerList}">
            <tr>
                                    <td>
                                        <div class="customer-name">
                                            <div class="customer-avatar">
                                                ${fn:substring(customer.name, 0, 1)}
                                            </div>
                                            ${customer.name}
                                        </div>
                                    </td>
                                    <td>
                                        <span class="account-number">${customer.accountNumber}</span>
                                    </td>
                                    <td>
                                        <div class="customer-address">${customer.address}</div>
                                    </td>
                                    <td>
                                        <div class="customer-phone">
                                            <i class="bi bi-telephone-fill phone-icon"></i>
                                            ${customer.telephone}
                                        </div>
                                    </td>
                                    <td>
                                        <div class="action-buttons">
                                            <a href="${pageContext.request.contextPath}/app/customers?action=edit&id=${customer.customerId}" class="btn-edit">
                                                <i class="bi bi-pencil-fill"></i>
                                                Edit
                                            </a>
                                            <a href="${pageContext.request.contextPath}/app/customers?action=delete&id=${customer.customerId}" class="btn-delete" onclick="return confirm('Are you sure you want to delete this customer?')">
                                                <i class="bi bi-trash-fill"></i>
                                                Delete
                                            </a>
                                        </div>
                </td>
            </tr>
        </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="5">
                                    <div class="empty-state">
                                        <i class="bi bi-people"></i>
                                        <h3>No Customers Found</h3>
                                        <p>Start building your customer base by adding your first customer.</p>
                                        <a href="${pageContext.request.contextPath}/app/customers?action=new" class="add-customer-btn">
                                            <i class="bi bi-person-plus-fill"></i>
                                            Add First Customer
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
        </tbody>
    </table>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Update statistics
        const customerRows = document.querySelectorAll('#customerTable tbody tr');
        const totalCustomers = customerRows.length;
        
        document.getElementById('totalCustomers').textContent = totalCustomers;
        document.getElementById('activeCustomers').textContent = totalCustomers;
        document.getElementById('newCustomers').textContent = Math.floor(totalCustomers * 0.3);
        document.getElementById('growthRate').textContent = '+12%';
        document.getElementById('customerCount').textContent = totalCustomers + ' customer' + (totalCustomers !== 1 ? 's' : '');

        // Search functionality
        const searchInput = document.getElementById('customerSearch');
        const tableRows = document.querySelectorAll('#customerTable tbody tr');

        searchInput.addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            
            tableRows.forEach(row => {
                const customerName = row.querySelector('.customer-name')?.textContent.toLowerCase() || '';
                const accountNumber = row.querySelector('.account-number')?.textContent.toLowerCase() || '';
                const phone = row.querySelector('.customer-phone')?.textContent.toLowerCase() || '';
                
                if (customerName.includes(searchTerm) || accountNumber.includes(searchTerm) || phone.includes(searchTerm)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });

            // Update customer count
            const visibleRows = Array.from(tableRows).filter(row => row.style.display !== 'none');
            document.getElementById('customerCount').textContent = visibleRows.length + ' customer' + (visibleRows.length !== 1 ? 's' : '');
        });

        // Add animation to table rows
        tableRows.forEach((row, index) => {
            row.style.animationDelay = `${index * 0.1}s`;
            row.style.animation = 'fadeInUp 0.6s ease forwards';
        });
    });

    // Add fadeInUp animation
    const style = document.createElement('style');
    style.textContent = `
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    `;
    document.head.appendChild(style);
</script>