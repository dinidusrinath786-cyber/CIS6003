<jsp:include page="header.jsp">
  <jsp:param name="title" value="Item Management"/>
</jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Item Management CSS -->
<style>
    :root {
        --primary-color: #10b981;
        --primary-dark: #059669;
        --secondary-color: #3b82f6;
        --accent-color: #f59e0b;
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

    .item-container {
        background: linear-gradient(135deg, #f0fdf4 0%, #dcfce7 100%);
        min-height: calc(100vh - 80px);
        padding: 2rem;
    }

    .item-header {
        background: linear-gradient(135deg, var(--primary-color), var(--primary-dark));
        color: white;
        border-radius: 20px;
        padding: 2.5rem;
        margin-bottom: 2rem;
        position: relative;
        overflow: hidden;
        text-align: center;
    }

    .item-header::before {
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

    .header-actions {
        display: flex;
        justify-content: center;
        gap: 1rem;
        flex-wrap: wrap;
    }

    .add-item-btn {
        background: linear-gradient(135deg, var(--secondary-color), #2563eb);
        border: none;
        border-radius: 16px;
        padding: 1rem 2rem;
        color: white;
        font-weight: 600;
        font-size: 1.1rem;
        transition: all 0.3s ease;
        display: flex;
        align-items: center;
        gap: 0.75rem;
        box-shadow: 0 4px 15px rgba(59, 130, 246, 0.3);
        text-decoration: none;
    }

    .add-item-btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 25px rgba(59, 130, 246, 0.4);
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

    .stat-card.stock .stat-icon {
        background: linear-gradient(135deg, var(--secondary-color), #2563eb);
    }

    .stat-card.low .stat-icon {
        background: linear-gradient(135deg, var(--warning-color), #d97706);
    }

    .stat-card.value .stat-icon {
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
        box-shadow: 0 0 0 4px rgba(16, 185, 129, 0.1);
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

    .item-table-container {
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

    .item-count {
        background: var(--primary-color);
        color: white;
        padding: 0.5rem 1rem;
        border-radius: 20px;
        font-size: 0.9rem;
        font-weight: 500;
    }

    .item-table {
        margin: 0;
        border-collapse: separate;
        border-spacing: 0;
        width: 100%;
    }

    .item-table thead th {
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

    .item-table tbody tr {
        transition: all 0.3s ease;
        border-bottom: 1px solid var(--border-color);
    }

    .item-table tbody tr:hover {
        background: var(--bg-secondary);
        transform: scale(1.01);
        box-shadow: var(--shadow-sm);
    }

    .item-table tbody td {
        padding: 1.25rem 1rem;
        border: none;
        vertical-align: middle;
        color: var(--text-primary);
    }

    .item-code {
        background: var(--bg-secondary);
        color: var(--text-primary);
        padding: 0.5rem 0.75rem;
        border-radius: 8px;
        font-family: 'Courier New', monospace;
        font-weight: 600;
        font-size: 0.9rem;
        border: 1px solid var(--border-color);
    }

    .item-description {
        max-width: 250px;
        color: var(--text-primary);
        line-height: 1.4;
        font-weight: 500;
    }

    .item-price {
        color: var(--success-color);
        font-weight: 600;
        font-size: 1.1rem;
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }

    .currency-symbol {
        color: var(--text-secondary);
        font-size: 0.9rem;
    }

    .stock-quantity {
        display: flex;
        align-items: center;
        gap: 0.75rem;
    }

    .stock-badge {
        padding: 0.5rem 1rem;
        border-radius: 20px;
        font-size: 0.8rem;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .stock-badge.high {
        background: rgba(16, 185, 129, 0.1);
        color: var(--success-color);
        border: 1px solid rgba(16, 185, 129, 0.3);
    }

    .stock-badge.medium {
        background: rgba(245, 158, 11, 0.1);
        color: var(--warning-color);
        border: 1px solid rgba(245, 158, 11, 0.3);
    }

    .stock-badge.low {
        background: rgba(239, 68, 68, 0.1);
        color: var(--danger-color);
        border: 1px solid rgba(239, 68, 68, 0.3);
    }

    .stock-badge.out {
        background: rgba(107, 114, 128, 0.1);
        color: var(--text-secondary);
        border: 1px solid rgba(107, 114, 128, 0.3);
    }

    .stock-number {
        font-weight: 600;
        color: var(--text-primary);
        font-size: 1.1rem;
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
        .item-container {
            padding: 1rem;
        }
        
        .header-title {
            font-size: 2rem;
        }
        
        .stats-container {
            grid-template-columns: 1fr;
        }
        
        .item-table-container {
            padding: 1rem;
        }
        
        .action-buttons {
            flex-direction: column;
        }
        
        .item-description {
            max-width: 150px;
        }
    }
</style>

<div class="item-container">
    <!-- Item Header -->
    <div class="item-header">
        <div class="header-content">
            <h1 class="header-title">Inventory Management</h1>
            <p class="header-subtitle">Manage your product inventory and stock levels</p>
            
            <div class="header-actions">
                <a href="${pageContext.request.contextPath}/app/items?action=new" class="add-item-btn">
                    <i class="bi bi-plus-circle-fill"></i>
                    Add New Item
                </a>
            </div>
        </div>
    </div>

    <!-- Statistics Cards -->
    <div class="stats-container">
        <div class="stat-card total">
            <div class="stat-icon">
                <i class="bi bi-box-seam-fill"></i>
            </div>
            <div class="stat-value" id="totalItems">0</div>
            <div class="stat-label">Total Items</div>
        </div>
        
        <div class="stat-card stock">
            <div class="stat-icon">
                <i class="bi bi-archive-fill"></i>
            </div>
            <div class="stat-value" id="totalStock">0</div>
            <div class="stat-label">Total Stock</div>
        </div>
        
        <div class="stat-card low">
            <div class="stat-icon">
                <i class="bi bi-exclamation-triangle-fill"></i>
            </div>
            <div class="stat-value" id="lowStockItems">0</div>
            <div class="stat-label">Low Stock Items</div>
        </div>
        
        <div class="stat-card value">
            <div class="stat-icon">
                <i class="bi bi-currency-dollar"></i>
            </div>
            <div class="stat-value" id="totalValue">LKR 0</div>
            <div class="stat-label">Total Value</div>
        </div>
    </div>

    <!-- Search Container -->
    <div class="search-container">
        <div class="search-box">
            <i class="bi bi-search search-icon"></i>
            <input type="text" class="search-input" id="itemSearch" placeholder="Search items by code, description, or price...">
        </div>
    </div>

    <!-- Item Table Container -->
    <div class="item-table-container">
        <div class="table-header">
            <h2 class="table-title">
                <i class="bi bi-table" style="color: var(--primary-color); margin-right: 0.5rem;"></i>
                Product Inventory
            </h2>
            <div class="item-count" id="itemCount">0 items</div>
</div>

<div class="table-responsive">
            <table class="item-table" id="itemTable">
    <thead>
    <tr>
      <th>Item Code</th>
      <th>Description</th>
      <th>Unit Price</th>
                        <th>Stock Level</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
                    <c:choose>
                        <c:when test="${not empty itemList}">
    <c:forEach var="item" items="${itemList}">
      <tr>
                                    <td>
                                        <span class="item-code">${item.itemCode}</span>
                                    </td>
                                    <td>
                                        <div class="item-description">${item.description}</div>
                                    </td>
                                    <td>
                                        <div class="item-price">
                                            <span class="currency-symbol">LKR</span>
                                            <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${item.unitPrice}" />
                                        </div>
                                    </td>
                                    <td>
                                        <div class="stock-quantity">
                                            <span class="stock-badge ${item.stockQuantity > 50 ? 'high' : item.stockQuantity > 20 ? 'medium' : item.stockQuantity > 0 ? 'low' : 'out'}">
                                                ${item.stockQuantity > 50 ? 'High' : item.stockQuantity > 20 ? 'Medium' : item.stockQuantity > 0 ? 'Low' : 'Out'}
                                            </span>
                                            <span class="stock-number">${item.stockQuantity}</span>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="action-buttons">
                                            <a href="${pageContext.request.contextPath}/app/items?action=edit&id=${item.itemId}" class="btn-edit">
                                                <i class="bi bi-pencil-fill"></i>
                                                Edit
                                            </a>
                                            <a href="${pageContext.request.contextPath}/app/items?action=delete&id=${item.itemId}" class="btn-delete" onclick="return confirm('Are you sure you want to delete this item?')">
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
                                        <i class="bi bi-box"></i>
                                        <h3>No Items Found</h3>
                                        <p>Start building your inventory by adding your first product.</p>
                                        <a href="${pageContext.request.contextPath}/app/items?action=new" class="add-item-btn">
                                            <i class="bi bi-plus-circle-fill"></i>
                                            Add First Item
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
        const itemRows = document.querySelectorAll('#itemTable tbody tr');
        const totalItems = itemRows.length;
        let totalStock = 0;
        let lowStockItems = 0;
        let totalValue = 0;
        
        // Calculate statistics from table data
        itemRows.forEach(row => {
            const stockCell = row.querySelector('.stock-number');
            const priceCell = row.querySelector('.item-price');
            
            if (stockCell && priceCell) {
                const stock = parseInt(stockCell.textContent) || 0;
                const price = parseFloat(priceCell.textContent.replace('LKR', '').trim()) || 0;
                
                totalStock += stock;
                totalValue += (stock * price);
                
                if (stock <= 20 && stock > 0) {
                    lowStockItems++;
                }
            }
        });
        
        document.getElementById('totalItems').textContent = totalItems;
        document.getElementById('totalStock').textContent = totalStock;
        document.getElementById('lowStockItems').textContent = lowStockItems;
        document.getElementById('totalValue').textContent = 'LKR ' + totalValue.toLocaleString();
        document.getElementById('itemCount').textContent = totalItems + ' item' + (totalItems !== 1 ? 's' : '');

        // Search functionality
        const searchInput = document.getElementById('itemSearch');
        const tableRows = document.querySelectorAll('#itemTable tbody tr');

        searchInput.addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            
            tableRows.forEach(row => {
                const itemCode = row.querySelector('.item-code')?.textContent.toLowerCase() || '';
                const description = row.querySelector('.item-description')?.textContent.toLowerCase() || '';
                const price = row.querySelector('.item-price')?.textContent.toLowerCase() || '';
                
                if (itemCode.includes(searchTerm) || description.includes(searchTerm) || price.includes(searchTerm)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });

            // Update item count
            const visibleRows = Array.from(tableRows).filter(row => row.style.display !== 'none');
            document.getElementById('itemCount').textContent = visibleRows.length + ' item' + (visibleRows.length !== 1 ? 's' : '');
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