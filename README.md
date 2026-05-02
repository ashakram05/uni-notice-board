# 🏛️ University Digital Notice Board

> A static website for academic announcements, exam schedules, and admission updates — built and deployed through a fully automated CI/CD pipeline using GitHub Actions and Docker.

**Course:** DevOps for Cloud Computing (CSC331)  
**Institution:** COMSATS University Islamabad, Lahore Campus  
**Instructor:** M Khizar Hayat  
**Semester:** 6th — FALL 2023, Section C  

---

## 📌 Project Overview

This project demonstrates an industry-aligned DevOps workflow for a static website. Every push to the repository automatically triggers a pipeline that:

1. Validates HTML and CSS code quality
2. Builds the website using Parcel
3. Packages it into a Docker container
4. Pushes the image to Docker Hub

No manual deployment steps are needed — everything is automated through GitHub Actions.

---

## 🌐 Live Pages

| Page | File | Description |
|------|------|-------------|
| Homepage | `src/index.html` | Navigation hub and latest highlights |
| Notices | `src/notices.html` | Academic announcements |
| Exams | `src/exams.html` | Exam timetable and rules |
| Admissions | `src/admissions.html` | Program info and important dates |
| Contact | `src/contact.html` | Department contact details |

---

## 🛠️ Tech Stack

| Tool | Version | Purpose |
|------|---------|---------|
| HTML5 / CSS3 | — | Frontend markup and styling |
| Parcel | v2.12 | Build tool and bundler |
| HTMLHint | v1.1.4 | HTML code quality linting |
| Stylelint | v16 | CSS code quality linting |
| Docker | — | Containerization |
| Nginx | 1.25-alpine | Web server inside container |
| GitHub Actions | — | CI/CD automation |
| Docker Hub | — | Container image registry |

---

## 📁 Folder Structure

```
uni-notice-board/
├── .github/
│   └── workflows/
│       └── ci.yml          ← CI/CD pipeline definition
├── src/
│   ├── index.html          ← Team Lead
│   ├── notices.html        ← Member
│   ├── exams.html          ← Member
│   ├── admissions.html     ← Member
│   └── contact.html        ← Member
├── styles/
│   └── style.css           ← Shared stylesheet
├── .gitignore
├── .dockerignore
├── .htmlhintrc             ← HTMLHint rules
├── .stylelintrc.json       ← Stylelint rules
├── Dockerfile              ← Multi-stage Docker build
├── nginx.conf              ← Nginx server config
├── package.json            ← Scripts and dependencies
└── README.md
```

---

## ⚙️ CI/CD Pipeline

The pipeline runs automatically on every push to `develop` or any `feature/**` branch.

```
Push to GitHub
      │
      ▼
┌─────────────────────┐
│   Job 1             │
│   code-quality      │  ← HTMLHint + Stylelint
└────────┬────────────┘
         │ only if passed
         ▼
┌─────────────────────┐
│   Job 2             │
│   build             │  ← Parcel → dist/
└────────┬────────────┘
         │ only if passed
         ▼
┌─────────────────────┐
│   Job 3             │
│   docker            │  ← Build image + Push to Docker Hub
└─────────────────────┘
```

> If any job fails, all subsequent jobs are skipped. This ensures broken code is never containerized.

---

## 🚀 Local Setup

### Prerequisites

Make sure these are installed on your machine:

- [Node.js v20+](https://nodejs.org)
- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [Git](https://git-scm.com)

### 1. Clone the Repository

```bash
git clone https://github.com/YOUR_USERNAME/uni-notice-board.git
cd uni-notice-board
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Run Linters

```bash
# Lint HTML
npx htmlhint "src/**/*.html"

# Lint CSS
npx stylelint "styles/**/*.css"
```

Expected output:
- HTMLHint: `5 files linted. No errors.`
- Stylelint: *(blank = success)*

### 4. Build the Website

```bash
npm run build
```

Expected output: `✨ Built in Xs` and a `dist/` folder is created.

### 5. Build Docker Image

```bash
docker build -t uni-notice-board .
```

Expected output: `Successfully tagged uni-notice-board:latest`

### 6. Run the Container

```bash
docker run -p 8080:80 uni-notice-board
```

Then open your browser and go to:

```
http://localhost:8080
```

---

## 🐳 Docker

### Image

```
YOUR_DOCKERHUB_USERNAME/uni-notice-board:latest
```

### Pull and Run from Docker Hub

```bash
docker pull YOUR_DOCKERHUB_USERNAME/uni-notice-board:latest
docker run -p 8080:80 YOUR_DOCKERHUB_USERNAME/uni-notice-board:latest
```

### Dockerfile Overview

The Dockerfile uses a **multi-stage build**:

- **Stage 1 (builder):** Uses `node:20-alpine` to install dependencies and run `npm run build`
- **Stage 2 (serve):** Uses `nginx:1.25-alpine` to serve the built `dist/` folder

This keeps the final image small — it contains only Nginx and the static files, not Node.js or any dev tools.

---

## 🌿 Branching Strategy

| Branch | Purpose |
|--------|---------|
| `develop` | Main integration branch — protected, all PRs merge here |
| `feature/teamlead-homepage` | Team Lead's feature branch for index.html |
| `feature/member-pages` | Member's feature branch for remaining pages |

**Branch Protection Rules on `develop`:**
- Direct pushes are not allowed
- All changes must go through a Pull Request
- Status checks (CI pipeline) must pass before merging
- Only the Team Lead can merge Pull Requests

---

## 🔐 GitHub Secrets Required

The following secrets must be added in GitHub → Settings → Secrets → Actions:

| Secret Name | Value |
|-------------|-------|
| `DOCKERHUB_USERNAME` | Your Docker Hub username |
| `DOCKERHUB_TOKEN` | Your Docker Hub access token |

---

## 👥 Team

| Role | Responsibility |
|------|---------------|
| Team Lead | Repository setup, index.html, branch protection, merging PRs |
| Member | notices.html, exams.html, admissions.html, contact.html |

---

## 📄 License

This project is for academic purposes only — COMSATS University Islamabad, Lahore Campus.
