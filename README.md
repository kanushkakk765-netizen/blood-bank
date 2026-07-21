# 🩸 LifeLine Blood Bank Management System

A full-stack **Blood Bank Management System** built as an Advanced Java college project.  
The system manages blood donors, inventory, requests, and donations with a clean medical-grade UI.

---

## 🌐 Live Preview

> Open `index.html` directly in any browser — no server required for the frontend.

---

## 📸 Screenshots

| Dashboard | Blood Inventory |
|---|---|
| ![Dashboard](screenshots/dashboard.png) | ![Inventory](screenshots/inventory.png) |

| Donor Management | Blood Requests |
|---|---|
| ![Donors](screenshots/donors.png) | ![Requests](screenshots/requests.png) |

---

## ✨ Features

- 📊 **Dashboard** — Live stats, blood stock overview, alerts, monthly donation chart, activity log
- 🩸 **Blood Inventory** — Stock levels with progress bars, expiry tracking, add/manage units
- 👤 **Donor Management** — Register, search, filter, and view full donor profiles
- 🏥 **Blood Requests** — Priority-based request queue (Urgent / Normal / Scheduled), approve & dispatch
- 💉 **Donations** — Record donations with full screening fields (Hb, BP, pulse, temperature)
- 📄 **Reports** — 6 report types + custom date-range reports with PDF preview

---

## 🛠️ Tech Stack

### Frontend
| Technology | Usage |
|---|---|
| HTML5 | Page structure, forms, tables, modals |
| CSS3 | Styling, layout (Grid + Flexbox), animations |
| Vanilla JavaScript | Navigation, modals, tabs, toast notifications |
| Google Fonts | DM Serif Display + DM Sans |

> ⚡ No frameworks — Pure HTML, CSS, and JavaScript only. Zero dependencies.

### Backend (Advanced Java)
| Technology | Usage |
|---|---|
| Java 8+ | Core programming language |
| Java Servlets | Request handling (MVC Controller) |
| JSP (JavaServer Pages) | Dynamic view rendering |
| JDBC | Database connectivity |
| MySQL 8 | Relational database |
| Apache Tomcat 9 | Web application server |
| SHA-256 | Password hashing (MessageDigest) |

### Architecture
```
MVC (Model - View - Controller)
├── Model      → Java POJOs (Donor, BloodInventory, Donation, BloodRequest)
├── View       → JSP Pages
└── Controller → Java Servlets
```

---

## 📁 Project Structure

```
blood-bank/
│
├── index.html                          # Frontend (pure HTML/CSS/JS)
│
├── database/
│   └── blood_bank.sql                  # MySQL schema + seed data + triggers
│
├── src/
│   └── com/bloodbank/
│       ├── model/
│       │   ├── User.java
│       │   ├── Donor.java
│       │   ├── BloodInventory.java
│       │   ├── BloodStock.java
│       │   ├── Donation.java
│       │   └── BloodRequest.java
│       │
│       ├── dao/
│       │   ├── UserDAO.java
│       │   ├── DonorDAO.java
│       │   ├── InventoryDAO.java
│       │   ├── DonationDAO.java
│       │   └── BloodRequestDAO.java
│       │
│       ├── servlet/
│       │   ├── LoginServlet.java
│       │   ├── LogoutServlet.java
│       │   ├── DashboardServlet.java
│       │   └── DonorServlet.java
│       │
│       └── util/
│           ├── DBConnection.java
│           └── PasswordUtil.java
│
└── WebContent/
    ├── WEB-INF/
    │   └── web.xml
    └── jsp/
        ├── login.jsp
        ├── dashboard.jsp
        └── donor/
            ├── list.jsp
            ├── add.jsp
            ├── edit.jsp
            └── view.jsp
```

---

## 🗄️ Database Schema

**Tables:**
- `users` — Admin and staff accounts
- `donors` — Registered blood donors
- `blood_inventory` — Blood unit batches with expiry tracking
- `blood_stock` — Aggregated stock summary per blood type
- `blood_camps` — Blood donation camp records
- `donations` — Individual donation events with screening data
- `blood_requests` — Hospital blood requests with priority
- `dispatch_log` — Audit trail for dispatched blood units

**MySQL Triggers:**
- `after_inventory_insert` — Auto-updates `blood_stock` when new units are added
- `after_dispatch_insert` — Auto-deducts from `blood_stock` when blood is dispatched

---

## ⚙️ Setup & Installation

### Prerequisites
- Java JDK 8 or above
- Apache Tomcat 9
- MySQL 8
- Eclipse IDE (Enterprise Edition)
- MySQL Connector JAR (`mysql-connector-j-8.x.jar`)

### Step 1 — Database Setup
```sql
-- Open MySQL Workbench or terminal
mysql -u root -p
source /path/to/database/blood_bank.sql
```

### Step 2 — Project Setup in Eclipse
1. Open Eclipse → `File` → `New` → `Dynamic Web Project`
2. Name it `BloodBank`
3. Set Target Runtime to **Apache Tomcat 9**
4. Copy all `src/` files into the project's `src/` folder
5. Add `mysql-connector-j-8.x.jar` to `WebContent/WEB-INF/lib/`

### Step 3 — Configure Database Connection
Edit `src/com/bloodbank/util/DBConnection.java`:
```java
private static final String URL      = "jdbc:mysql://localhost:3306/blood_bank_db";
private static final String USER     = "root";
private static final String PASSWORD = "your_mysql_password";
```

### Step 4 — Run on Tomcat
1. Right-click project → `Run As` → `Run on Server`
2. Select **Apache Tomcat 9**
3. Open browser → `http://localhost:8080/BloodBank/login`

### Default Login Credentials
| Username | Password | Role |
|---|---|---|
| admin | admin123 | Admin |
| staff1 | staff123 | Staff |

---

## 🩸 Blood Types Managed

`A+` `A−` `B+` `B−` `AB+` `AB−` `O+` `O−`

---

## 📋 Modules Overview

| Module | Description |
|---|---|
| Login / Logout | Session-based authentication with SHA-256 password hashing |
| Dashboard | Real-time stats, critical stock alerts, expiry warnings |
| Blood Inventory | CRUD for blood batches, expiry tracking, FIFO dispatch |
| Donor Management | Full CRUD, eligibility tracking, 90-day donation interval |
| Blood Requests | Priority queue, approve/dispatch workflow with inventory deduction |
| Donations | Screening form (Hb, BP, pulse, temp), auto inventory update |
| Reports | Stock summary, donor activity, request fulfillment, expiry reports |

---

## 👩‍💻 Developer

**Kanushka Katariya**  
Advanced Java — College Project  
B.Tech / BCA — 2025–26

---

## 📄 License

This project is for educational purposes only.  
© 2026 Kanushka Katariya. All rights reserved.
