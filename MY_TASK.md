# 👤 MEMBER 1 — Your Task

## Your Assigned File: src/notices.html (Academic Notices Page)

## What You Must Do:
1. Accept the GitHub collaboration invite from your email
2. Clone the repo: git clone https://github.com/TEAMLEAD_USERNAME/uni-notice-board.git
3. Go to develop branch: git checkout develop
4. Create your branch: git checkout -b feature/member1-notices
5. Work ONLY on: src/notices.html
6. Run linting, build, and Docker locally (see commands below)
7. Push and create a Pull Request targeting develop

## Your HTML File: src/notices.html
- Shows academic notices/announcements
- Contains at least 6 notice items
- Uses .notice-item, .notice-item.urgent, .notice-item.info classes
- Includes notice dates and descriptions

## Run These Commands Before Committing:
npx htmlhint "src/**/*.html"
npx stylelint "styles/**/*.css"
npm run build
docker build -t uni-notice-board .
docker run -p 8080:80 uni-notice-board
→ Open http://localhost:8080/notices.html and take screenshot

## Git Commands to Push:
git add src/notices.html
git commit -m "Add notices.html - Member 1"
git push origin feature/member1-notices
→ Then go to GitHub and create a Pull Request
