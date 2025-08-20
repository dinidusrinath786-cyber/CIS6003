# 🎓 Pahana Edu Billing System - Advanced Programming Assignment

<div align="center">

![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=coffeescript&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Apache Tomcat](https://img.shields.io/badge/Apache%20Tomcat-F8DC75?style=for-the-badge&logo=apache-tomcat&logoColor=black)
![Maven](https://img.shields.io/badge/Maven-C71A36?style=for-the-badge&logo=apache-maven&logoColor=white)
![JSP](https://img.shields.io/badge/JSP-000000?style=for-the-badge&logo=java&logoColor=white)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)

**CIS6003 Advanced Programming | Academic Year 2024 | Semester 1**

**Module Leader:** priyanga@icbtcampus.edu.lk

[![Build Status](https://img.shields.io/badge/Build-Passing-brightgreen)](https://github.com/yourusername/PahanaEduBillingSystem)
[![Version](https://img.shields.io/badge/Version-1.0.0-blue)](https://github.com/yourusername/PahanaEduBillingSystem/releases)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

</div>

---

## 📋 Table of Contents

- [🎯 Project Overview](#-project-overview)
- [🏗️ System Architecture](#️-system-architecture)
- [✨ Core Features](#-core-features)
- [🛠️ Technology Stack](#️-technology-stack)
- [📊 UML Design Diagrams](#-uml-design-diagrams)
- [🚀 Installation & Setup](#-installation--setup)
- [🧪 Testing Strategy](#-testing-strategy)
- [📚 API Documentation](#-api-documentation)
- [🔧 Configuration](#-configuration)
- [📁 Project Structure](#-project-structure)
- [🎮 User Guide](#-user-guide)
- [📈 Future Enhancements](#-future-enhancements)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)

---

## 🎯 Project Overview

**Pahana Edu Billing System** is a comprehensive, enterprise-grade web application designed specifically for educational bookshops and retail businesses. This system addresses the critical need for computerized billing management, replacing manual customer account maintenance with a robust, scalable solution.

### 🎯 **Assignment Requirements Fulfilled**

✅ **Task A:** Complete UML diagrams with design decisions (20 marks)  
✅ **Task B:** Interactive system with web services, design patterns, and database (40 marks)  
✅ **Task C:** Test-driven development with automation (20 marks)  
✅ **Task D:** Git/GitHub repository with version control (20 marks)

### 🏢 **Business Context**

Pahana Edu serves **hundreds of customers monthly** in Colombo City, requiring:
- **Automated customer management** with unique account numbers
- **Real-time inventory tracking** and stock management
- **Professional billing system** with calculation automation
- **Secure user authentication** and role-based access control
- **Comprehensive reporting** for business intelligence

---

## 🏗️ System Architecture

### **Three-Tier Architecture Implementation**

```
┌─────────────────────────────────────────────────────────────┐
│                    Presentation Layer                       │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────────────┐  │
│  │   Login     │ │  Dashboard  │ │   Billing Forms     │  │
│  │   JSP       │ │   JSP       │ │   JSP               │  │
│  └─────────────┘ └─────────────┘ └─────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                    Business Logic Layer                     │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────────────┐  │
│  │   DAO       │ │   Service   │ │   Utility           │  │
│  │   Pattern   │ │   Layer     │ │   Classes           │  │
│  └─────────────┘ └─────────────┘ └─────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                    Data Access Layer                        │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────────────┐  │
│  │   MySQL     │ │   JDBC      │ │   Connection        │  │
│  │   Database  │ │   Driver    │ │   Pool              │  │
│  └─────────────┘ └─────────────┘ └─────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
```

### **Design Patterns Implemented**

1. **DAO (Data Access Object) Pattern**
   - Abstracts database operations
   - Provides consistent data access interface
   - Enables easy switching between data sources

2. **Singleton Pattern**
   - Database connection management
   - Configuration management
   - Service layer instances

3. **MVC (Model-View-Controller) Pattern**
   - JSP as View layer
   - Servlets as Controller layer
   - JavaBeans as Model layer

4. **Factory Pattern**
   - Object creation management
   - Database connection factory
   - Service object factory

---

## ✨ Core Features

### 🔐 **Authentication & Security**
- **Secure Login System** with BCrypt password hashing
- **Session Management** with automatic timeout
- **Role-based Access Control** (Admin/User)
- **SQL Injection Protection** via prepared statements
- **Input Validation & Sanitization** on all user inputs

### 👥 **Customer Management**
- **Unique Account Number Generation** (Auto-increment)
- **Complete Customer Profiles** with contact details
- **Advanced Search & Filtering** capabilities
- **Customer History Tracking** with timestamps
- **CRUD Operations** with data integrity constraints

### 📦 **Inventory Management**
- **Real-time Stock Tracking** with automatic updates
- **Product Catalog Management** with detailed descriptions
- **Dynamic Pricing** with decimal precision
- **Low Stock Alerts** and notifications
- **Item Code System** for easy identification

### 🧾 **Advanced Billing System**
- **Multi-step Bill Creation** workflow
- **Dynamic Item Addition** with real-time calculations
- **Automatic Stock Deduction** via database triggers
- **Professional Invoice Generation** with detailed line items
- **Grand Total Calculations** with tax considerations
- **Print-Ready Bills** with professional formatting

### 📊 **Dashboard & Analytics**
- **Interactive Sales Charts** powered by Chart.js
- **Real-time Business Metrics** and KPIs
- **Quick Action Cards** for common operations
- **Live Clock** with Sri Lankan timezone
- **Business Intelligence Reports**

---

## 🛠️ Technology Stack

### **Backend Technologies**
- **Java 11+** - Core programming language
- **Jakarta EE 9.1** - Enterprise Java platform
- **Apache Tomcat 11** - Web application server
- **Maven 3.8+** - Build automation and dependency management

### **Frontend Technologies**
- **JSP (JavaServer Pages)** - Dynamic web content
- **HTML5 & CSS3** - Modern web standards
- **JavaScript ES6+** - Interactive functionality
- **Chart.js** - Data visualization
- **Bootstrap 5** - Responsive design framework

### **Database & Persistence**
- **MySQL 8.0+** - Relational database management
- **JDBC 4.2** - Database connectivity
- **Connection Pooling** - Performance optimization
- **Stored Procedures** - Business logic implementation

### **Development Tools**
- **IntelliJ IDEA Ultimate** - Integrated development environment
- **Git & GitHub** - Version control and collaboration
- **JUnit 5** - Unit testing framework
- **Mockito** - Mocking framework for testing

---

## 📊 UML Design Diagrams

### **Use Case Diagram**
```
┌─────────────────────────────────────────────────────────────┐
│                        Actors                               │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐    │
│  │   Admin     │    │    User     │    │   System    │    │
│  │   User      │    │             │    │             │    │
│  └─────────────┘    └─────────────┘    └─────────────┘    │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                      Use Cases                              │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────────────┐  │
│  │   Login     │ │  Manage     │ │   Generate          │  │
│  │   System    │ │  Customers  │ │   Bills             │  │
│  └─────────────┘ └─────────────┘ └─────────────────────┘  │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────────────┐  │
│  │   Manage    │ │  View       │ │   Print             │  │
│  │   Inventory │ │  Reports    │ │   Invoices          │  │
│  └─────────────┘ └─────────────┘ └─────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
```

### **Class Diagram**
```
┌─────────────────────────────────────────────────────────────┐
│                    Core Classes                             │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐    │
│  │    User     │    │   Customer  │    │    Item     │    │
│  │             │    │             │    │             │    │
│  │ -userId     │    │ -customerId │    │ -itemId     │    │
│  │ -username   │    │ -accountNo  │    │ -itemCode   │    │
│  │ -password   │    │ -name       │    │ -description│    │
│  │ -fullName   │    │ -address    │    │ -unitPrice  │    │
│  │ -createdAt  │    │ -telephone  │    │ -stockQty   │    │
│  └─────────────┘    └─────────────┘    └─────────────┘    │
└─────────────────────────────────────────────────────────────┘
```

### **Sequence Diagram**
```
┌─────────┐    ┌─────────┐    ┌─────────┐    ┌─────────┐
│  User   │    │  Login  │    │  User   │    │Database │
│         │    │ Servlet │    │   DAO   │    │         │
└─────────┘    └─────────┘    └─────────┘    └─────────┘
     │             │             │             │
     │ 1. Login    │             │             │
     │ Request     │             │             │
     │────────────▶│             │             │
     │             │ 2. Validate │             │
     │             │ Credentials │             │
     │             │────────────▶│             │
     │             │             │ 3. Query    │
     │             │             │ Database    │
     │             │             │────────────▶│
     │             │             │             │
```

---

## 🚀 Installation & Setup

### **Prerequisites**
- **Java Development Kit (JDK) 11 or higher**
- **Apache Maven 3.8+**
- **MySQL Server 8.0+**
- **Apache Tomcat 11.0+**
- **Git 2.30+**

### **Step 1: Clone Repository**
```bash
git clone https://github.com/yourusername/PahanaEduBillingSystem.git
cd PahanaEduBillingSystem
```

### **Step 2: Database Setup**
```bash
# Start MySQL Server
sudo systemctl start mysql

# Connect to MySQL as root
mysql -u root -p

# Create database and user
CREATE DATABASE pahana_edu_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'pahana_user'@'localhost' IDENTIFIED BY 'your_secure_password';
GRANT ALL PRIVILEGES ON pahana_edu_db.* TO 'pahana_user'@'localhost';
FLUSH PRIVILEGES;

# Import database schema
mysql -u pahana_user -p pahana_edu_db < database/schema.sql
```

### **Step 3: Configuration**
Update `src/main/java/com/pahanasolutions/PahanaEdu/db/DatabaseConnection.java`:
```java
private static final String DB_URL = "jdbc:mysql://localhost:3306/pahana_edu_db?useSSL=false&serverTimezone=UTC";
private static final String DB_USER = "pahana_user";
private static final String DB_PASSWORD = "your_secure_password";
```

### **Step 4: Build Project**
```bash
# Clean and compile
mvn clean compile

# Package as WAR file
mvn package

# Run tests
mvn test
```

### **Step 5: Deploy to Tomcat**
```bash
# Copy WAR file to Tomcat webapps
cp target/PahanaEdu.war $TOMCAT_HOME/webapps/

# Start Tomcat
$TOMCAT_HOME/bin/startup.sh

# Check logs
tail -f $TOMCAT_HOME/logs/catalina.out
```

### **Step 6: Access Application**
Open your browser and navigate to:
```
http://localhost:8080/PahanaEdu/
```

---

## 🧪 Testing Strategy

### **Test-Driven Development (TDD) Approach**

#### **1. Unit Testing**
- **JUnit 5** framework for test execution
- **Mockito** for mocking dependencies
- **Test coverage** target: 80%+

#### **2. Test Classes Structure**
```
src/test/java/
├── com/pahanasolutions/PahanaEdu/
│   ├── dao/
│   │   ├── UserDAOTest.java
│   │   ├── CustomerDAOTest.java
│   │   └── ItemDAOTest.java
│   ├── servlet/
│   │   ├── LoginServletTest.java
│   │   └── BillingServletTest.java
│   └── util/
│       └── ValidationUtilTest.java
```

#### **3. Test Data Management**
- **Test fixtures** for consistent test data
- **Database seeding** for integration tests
- **Mock objects** for unit tests

#### **4. Test Automation**
```bash
# Run all tests
mvn test

# Run specific test class
mvn test -Dtest=UserDAOTest

# Generate test coverage report
mvn jacoco:report
```

### **Test Plan Documentation**

#### **Test Rationale**
- **Unit Tests**: Verify individual component functionality
- **Integration Tests**: Validate component interactions
- **System Tests**: End-to-end functionality verification

#### **Test Cases Coverage**
- **Authentication**: Login/logout, session management
- **Customer Management**: CRUD operations, validation
- **Inventory Management**: Stock updates, price calculations
- **Billing System**: Bill generation, calculations, printing

---

## 📚 API Documentation

### **Authentication Endpoints**

#### **POST /login**
```http
POST /PahanaEdu/login
Content-Type: application/x-www-form-urlencoded

username=admin&password=secure_password
```

**Response:**
```json
{
  "status": "success",
  "message": "Login successful",
  "user": {
    "userId": 1,
    "username": "admin",
    "fullName": "Administrator"
  }
}
```

#### **POST /logout**
```http
POST /PahanaEdu/logout
```

### **Customer Management Endpoints**

#### **GET /customers**
```http
GET /PahanaEdu/customers
Authorization: Bearer {session_token}
```

#### **POST /customers**
```http
POST /PahanaEdu/customers
Content-Type: application/json

{
  "accountNumber": "CUST001",
  "name": "John Doe",
  "address": "123 Main St, Colombo",
  "telephone": "+94-11-123-4567"
}
```

### **Inventory Management Endpoints**

#### **GET /items**
```http
GET /PahanaEdu/items
Authorization: Bearer {session_token}
```

#### **POST /items**
```http
POST /PahanaEdu/items
Content-Type: application/json

{
  "itemCode": "BOOK001",
  "description": "Advanced Java Programming",
  "unitPrice": 2500.00,
  "stockQuantity": 50
}
```

---

## 🔧 Configuration

### **Environment Variables**
```bash
# Database Configuration
export DB_HOST=localhost
export DB_PORT=3306
export DB_NAME=pahana_edu_db
export DB_USER=pahana_user
export DB_PASSWORD=your_secure_password

# Application Configuration
export APP_PORT=8080
export APP_CONTEXT=/PahanaEdu
export SESSION_TIMEOUT=1800
```

### **Application Properties**
```properties
# src/main/resources/application.properties
app.name=Pahana Edu Billing System
app.version=1.0.0
app.environment=development

# Database
db.driver=com.mysql.cj.jdbc.Driver
db.url=jdbc:mysql://${DB_HOST}:${DB_PORT}/${DB_NAME}
db.username=${DB_USER}
db.password=${DB_PASSWORD}

# Security
security.session.timeout=${SESSION_TIMEOUT}
security.password.minLength=8
security.password.requireSpecialChars=true
```

---

## 📁 Project Structure

```
PahanaEduBillingSystem/
├── 📁 src/
│   ├── 📁 main/
│   │   ├── 📁 java/
│   │   │   └── 📁 com/pahanasolutions/PahanaEdu/
│   │   │       ├── 📁 dao/           # Data Access Objects
│   │   │       │   ├── UserDAO.java
│   │   │       │   ├── CustomerDAO.java
│   │   │       │   └── ItemDAO.java
│   │   │       ├── 📁 db/            # Database connectivity
│   │   │       │   └── DatabaseConnection.java
│   │   │       ├── 📁 model/         # Data models
│   │   │       │   ├── User.java
│   │   │       │   ├── Customer.java
│   │   │       │   └── Item.java
│   │   │       ├── 📁 servlet/       # HTTP request handlers
│   │   │       │   ├── LoginServlet.java
│   │   │       │   ├── CustomerServlet.java
│   │   │       │   └── BillingServlet.java
│   │   │       └── 📁 util/          # Utility classes
│   │   │           ├── ValidationUtil.java
│   │   │           └── SecurityUtil.java
│   │   └── 📁 webapp/
│   │       ├── 📁 app/               # JSP view files
│   │       │   ├── dashboard.jsp
│   │       │   ├── customers.jsp
│   │       │   └── billing.jsp
│   │       ├── 📁 css/               # Stylesheets
│   │       │   ├── main.css
│   │       │   └── components.css
│   │       ├── 📁 js/                # JavaScript files
│   │       │   ├── dashboard.js
│   │       │   └── validation.js
│   │       ├── index.jsp
│   │       ├── login.jsp
│   │       └── register.jsp
│   └── 📁 test/
│       └── 📁 java/
│           └── 📁 com/pahanasolutions/PahanaEdu/
│               ├── 📁 dao/            # DAO test classes
│               ├── 📁 servlet/        # Servlet test classes
│               └── 📁 util/           # Utility test classes
├── 📁 database/
│   ├── schema.sql                    # Database schema
│   └── sample_data.sql               # Sample data
├── 📁 docs/
│   ├── UML_Diagrams/                 # Design documentation
│   ├── API_Documentation/            # API reference
│   └── User_Manual/                  # User guide
├── 📁 scripts/
│   ├── deploy.sh                     # Deployment script
│   └── setup.sh                      # Setup script
├── pom.xml                           # Maven configuration
├── README.md                         # This file
└── LICENSE                           # MIT License
```

---

## 🎮 User Guide

### **Getting Started**

#### **1. First-Time Access**
1. Navigate to `http://localhost:8080/PahanaEdu/`
2. Click **"Register New Account"**
3. Fill in your details and create account
4. Login with your credentials

#### **2. Dashboard Overview**
- **Quick Actions**: Direct access to main functions
- **Sales Analytics**: Visual representation of business data
- **System Status**: Current user and system information
- **Live Clock**: Real-time display in Sri Lankan timezone

### **Customer Management**

#### **Adding New Customers**
1. Navigate to **Customers** → **Add New Customer**
2. Enter required information:
   - Account Number (auto-generated)
   - Full Name
   - Complete Address
   - Contact Telephone
3. Click **Save Customer**

#### **Managing Existing Customers**
- **View All**: Complete customer list with search
- **Edit**: Modify customer details
- **Delete**: Remove customer with confirmation
- **Search**: Find customers by name or account number

### **Inventory Management**

#### **Adding New Items**
1. Go to **Manage Items** → **Add New Item**
2. Enter item details:
   - Item Code (unique identifier)
   - Description (detailed product name)
   - Unit Price (in LKR with decimal precision)
   - Stock Quantity (current inventory count)
3. Click **Save Item**

#### **Stock Management**
- **View Stock Levels**: Current quantities display
- **Update Stock**: Adjust quantities as needed
- **Price Updates**: Modify unit prices
- **Low Stock Alerts**: Automatic notifications

### **Billing Process**

#### **Step 1: Customer Selection**
1. Navigate to **Create Bill**
2. Select customer from dropdown
3. Click **Proceed to Add Items**

#### **Step 2: Adding Items**
1. Select item from dropdown (shows availability)
2. Enter quantity (validated against stock)
3. Click **Add** to include in bill
4. Repeat for multiple items
5. Review line items and totals

#### **Step 3: Finalization**
1. Verify all items and quantities
2. Check calculated grand total
3. Click **Finalize and Create Bill**
4. System generates bill and updates inventory

---

## 📈 Future Enhancements

### **Phase 2 Features (Q2 2025)**
- [ ] **Email Integration**: Automated bill delivery
- [ ] **Multi-location Support**: Branch management
- [ ] **Barcode Scanning**: Mobile inventory management
- [ ] **Payment Integration**: Multiple payment methods

### **Phase 3 Features (Q3 2025)**
- [ ] **Mobile Application**: iOS and Android apps
- [ ] **Cloud Deployment**: AWS/Azure hosting
- [ ] **Advanced Analytics**: Machine learning insights
- [ ] **API Gateway**: Third-party integrations

### **Phase 4 Features (Q4 2025)**
- [ ] **Multi-tenant Architecture**: SaaS model
- [ ] **Real-time Notifications**: Push notifications
- [ ] **Advanced Reporting**: Custom report builder
- [ ] **Internationalization**: Multi-language support

---

## 🤝 Contributing

We welcome contributions from the developer community! Here's how you can help:

### **Development Workflow**

1. **Fork** the repository on GitHub
2. **Clone** your fork locally:
   ```bash
   git clone https://github.com/yourusername/PahanaEduBillingSystem.git
   ```
3. **Create** a feature branch:
   ```bash
   git checkout -b feature/amazing-feature
   ```
4. **Make** your changes with proper testing
5. **Commit** with descriptive messages:
   ```bash
   git commit -m 'Add amazing feature: detailed description'
   ```
6. **Push** to your fork:
   ```bash
   git push origin feature/amazing-feature
   ```
7. **Submit** a Pull Request with detailed description

### **Code Standards**

- **Java**: Follow Oracle Java Code Conventions
- **JSP**: Use consistent naming and structure
- **CSS**: Follow BEM methodology
- **JavaScript**: Use ES6+ standards
- **Testing**: Maintain 80%+ code coverage

### **Commit Message Format**
```
type(scope): description

[optional body]

[optional footer]
```

**Types:** `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

---

## 📄 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for complete details.

```
MIT License

Copyright (c) 2024 Pahana Solutions

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## 🏆 Academic Achievement

This project successfully demonstrates:

- **Advanced Programming Concepts** (CIS6003)
- **Object-Oriented Design Principles**
- **Web Application Development**
- **Database Design & Management**
- **Test-Driven Development**
- **Version Control & Collaboration**
- **Professional Documentation Standards**

---

<div align="center">

**🎓 Srinath Hettiarachi

</div>
