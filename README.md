# 🩸 LifeLine — Blood Bank Management System

A full-stack blood bank management system for tracking donors, blood inventory, hospital requests, and donation records — built as a portfolio project to demonstrate full-stack development, database design, and authentication.

**🔗 Live Demo:** [blood-bank-one-sooty.vercel.app](https://blood-bank-one-sooty.vercel.app)

**Demo credentials:**
- Username: `drsharma`
- Password: `ChangeMe123!`

---

## Features

- **Dashboard** — real-time stats (total units, registered donors, donations this month, pending requests), blood stock overview by type, auto-generated low-stock/expiry alerts, 12-month donations chart, and a recent activity feed
- **Donor Management** — register and track donors with blood type, contact info, and donation history
- **Blood Inventory** — track blood units by type, batch, collection/expiry dates, and stock status (Critical/Low/Available)
- **Blood Requests** — hospitals can submit requests; admin can approve pending requests
- **Donation Records** — log individual donation events, linked to donor records
- **Authentication** — JWT-based login system with bcrypt-hashed passwords; all data routes require a valid token

## Tech Stack

**Frontend:** Vanilla HTML/CSS/JavaScript (no framework) — single-page app
**Backend:** Node.js, Express
**Database:** PostgreSQL (hosted on [Neon](https://neon.tech)), accessed via [Prisma ORM](https://www.prisma.io/)
**Auth:** JWT (jsonwebtoken) + bcrypt for password hashing
**Deployment:** Frontend on [Vercel](https://vercel.com), backend on [Render](https://render.com)

## Project Structure