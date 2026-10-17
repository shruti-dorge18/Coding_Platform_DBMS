# Coding Platform DBMS

A MySQL-based DBMS mini-project for managing users, coding problems, contests, and problem submissions using relational database concepts.

## Database Tables

- **Users:** Stores user IDs, usernames, and email addresses.
- **Problems:** Stores problem names, difficulty levels, and points.
- **Contests:** Stores contest names, dates, and total problems.
- **Submissions:** Tracks user submissions, attempted problems, and submission status.

## Concepts Used

- Relational database design
- Primary keys and foreign keys
- Referential integrity
- SQL queries using `SELECT`, `WHERE`, and `JOIN`
- Aggregate functions: `COUNT()` and `SUM()`
- Data grouping using `GROUP BY`

## Project Structure

```text
Coding_Platform_DBMS/
├── coding_platform.sql
├── CodingPlatform_Schema_and_ER_Diagrams.pdf
├── output/
│   └── SQL output screenshots
└── README.md
```

## How to Run

**Prerequisite:** MySQL Server

Execute the SQL script on Ubuntu:

```bash
sudo mysql < coding_platform.sql
```

The script creates the database and tables, inserts sample records, and executes example queries.
