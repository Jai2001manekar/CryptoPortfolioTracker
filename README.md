# 💼 Crypto Portfolio Tracker (SQL-Based Backend)

A secure, role-based, MySQL-powered backend system for tracking cryptocurrency investments, price history, wallet holdings, and user-level profit/loss analysis with full financial insights.

---

## 💡 Innovation & Idea

This project was built to simulate **real-world portfolio management** of cryptocurrencies, with an emphasis on:
- User-level **role-based access** (admin, employee, guest)
- Real-time **P&L tracking** (realized and unrealized)
- **Daily price snapshots** for accurate history
- A detailed **passbook-style transaction log**
- Full backend **logic using stored procedures**, no external code

Unlike traditional crypto dashboards, this SQL backend performs:
- **Live asset holding management**
- **Average buy cost adjustments**
- **Trigger-free trade handling via procedures**
- **Data integrity without external apps**

---

## 📌 Key Features

- ✅ Full MySQL relational schema
- ✅ User roles: `ADMIN`, `SUBORDINATE`, `GUEST`
- ✅ Wallet management
- ✅ Cryptocurrency price tracker
- ✅ Buy/Sell with live cost tracking
- ✅ Stored procedures for controlled trade execution
- ✅ Realized & Unrealized Profit/Loss views
- ✅ Daily price snapshot system (Events)
- ✅ Guest login with **read-only access**

---

## ⚙️ How It Works

| Module        | Description |
|---------------|-------------|
| 🧍 Users        | Stored in `User` table with role control |
| 💼 Wallets      | One wallet per authorized user (Admin/Subordinates) |
| 💸 Transactions | Records all buy/sell activity |
| 📈 Holdings     | Maintains current crypto quantity + average cost |
| 💰 Realized PnL | Tracked on every sell action |
| 📊 Views        | Summarized portfolio, passbook, and profit |
| ⏱️ Events       | Daily price snapshots into `Price_History` |

Stored Procedures enforce:
- ❌ No over-selling
- ✅ Average buy price calculation
- ✅ Realized gain/loss calculation

---

## 🌟 Advantages

- Fully working backend without code dependencies
- Based on real investment models
- Easy to plug into frontend (Java, Android, React)
- Safe and secure: No direct DML access for guests
- Great educational use case for:
  - SQL joins
  - Views
  - Triggers
  - Stored Procedures
  - Role-based permissions

---

## 🚀 Future Scope

- ✅ API layer (REST endpoints) using Java or Node.js
- 📱 Android app with wallet login
- 📤 Email report or PDF generation for passbook
- 💹 Live price sync with external APIs (CoinGecko, CoinMarketCap)
- 📊 Charts using D3.js or Chart.js in frontend
- 🧪 Automated tests using MySQL Unit Tests or Postman
- 🔒 2FA/MFA login security
