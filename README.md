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
- **AI Assistant** — ask questions in plain English (e.g. "show me all O+ donors," "how many pending requests are there") and get real answers pulled from the live database. Uses Google's Gemini API to convert natural language into a safe, structured query — the AI never generates raw SQL, only a whitelisted JSON shape that the backend validates before running it through Prisma

## Tech Stack

**Frontend:** Vanilla HTML/CSS/JavaScript (no framework) — single-page app
**Backend:** Node.js, Express
**Database:** PostgreSQL (hosted on [Neon](https://neon.tech)), accessed via [Prisma ORM](https://www.prisma.io/)
**Auth:** JWT (jsonwebtoken) + bcrypt for password hashing
**AI:** Google Gemini API (`gemini-flash-latest`) via `@google/generative-ai` — powers the natural language assistant
**Deployment:** Frontend on [Vercel](https://vercel.com), backend on [Render](https://render.com)

## Project Structure
```
blood_Bank/
backend/
server.js — Express app, all API routes, auth middleware
prisma/
schema.prisma — database models (Donor, BloodInventory, BloodRequest, Donation, User)
migrations/ — Prisma migration history
frontend/
index.html — entire UI (HTML/CSS/JS) in one file
## API Overview

All routes below (except `/auth/login`) require a `Bearer` token in the `Authorization` header.

| Method | Route | Description |
|---|---|---|
| POST | `/auth/login` | Authenticate and receive a JWT |
| GET / POST | `/donors` | List / register donors |
| GET / POST | `/inventory` | List / add blood inventory batches |
| GET / POST | `/requests` | List / create blood requests |
| PATCH | `/requests/:id/approve` | Approve a pending request |
| GET / POST | `/donations` | List / record donations |
| POST | `/assistant/query` | Ask a natural language question, get a safe, structured database answer |

## Running Locally

**Backend:**
```bash
cd backend
npm install
# create a .env file with DATABASE_URL, JWT_SECRET, and GEMINI_API_KEY
npx prisma migrate dev
node server.js
```

**Frontend:**
Open `frontend/index.html` directly in a browser, or update the `API_BASE` constant at the top of the `<script>` block to point at your local backend (`http://localhost:5000`).

## Notes

- This is a portfolio/demo project — the demo login above is intentionally public so visitors can explore the app. Since the database is shared, please be considerate with the data you add.
- The backend runs on Render's free tier, which spins down after inactivity — the first request after idling may take up to ~50 seconds to respond.

## Roadmap


- [ ] Role-based access (read-only viewer accounts)

---

Built by Kanushka Katariya as part of a personal learning roadmap toward AI Application Engineering.