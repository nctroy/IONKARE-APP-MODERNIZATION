# Ionkare Modernization & Security Project Plan

This document outlines the epics, user stories, and tasks required to modernize the Ionkare application and build a comprehensive, enterprise-grade security program around it.

**Project Repository:** [https://github.com/nctroy/IONKARE-APP-MODERNIZATION](https://github.com/nctroy/IONKARE-APP-MODERNIZATION)

## Product Vision (from PRD)

**Goal:** To resurrect and modernize the legacy "Ionkare" platform by performing a greenfield rebuild based on a modern, secure tech stack. The platform enables patients to build a team of supporters, coordinate care through a shared calendar, and share updates securely.

**Primary Personas:** Patient, Supporter/Visitor, Facility/Staff.

**Modern Architecture:** The project will migrate from the legacy Sinatra/CouchDB stack to the PRD's recommended TypeScript-first architecture (Next.js, NestJS, PostgreSQL with Prisma, Redis, Docker, and Terraform).

**Security & Compliance:** Security and privacy are core non-functional requirements, with a long-term goal of HIPAA alignment.

This project plan directly supports this vision by first establishing a secure foundation for the repository and CI/CD (Epic 1) and then building the new application with security integrated into every phase (Epic 2).

## Epic 1: Establish Secure Foundation

**Goal:** To create a clean, secure, and auditable baseline for the project's code and infrastructure. This involves refactoring the Git history and establishing a secure software development lifecycle (SDLC).

### User Story 1: Refactor Git History for Clarity

**As a** security architect,  
**I want to** clean up the main branch's commit history  
**So that** the project's evolution is auditable and each feature is isolated in its own branch for clear review.

#### Tasks & Branches:

**Preserve Current State:**
- **Branch:** `main-legacy`
- **Action:** Create this branch from the current main to save a complete history of the "bloated" version.

**Roll Back main:**
- **Branch:** `main`
- **Action:** Reset the main branch to a clean, early commit (2cb1bcb) to serve as the new foundation.

**Isolate Documentation Changes:**
- **Branch:** `docs/security-documentation`
- **Action:** Cherry-pick the commits related to the SECURITY.md, AI strategy, and data flow diagrams from main-legacy.
- **PR:** Open a Pull Request to merge `docs/security-documentation` into main.

**Isolate CI/CD Workflow Changes:**
- **Branch:** `chore/add-ci-workflows`
- **Action:** Cherry-pick the commits related to CodeQL, Semgrep, Gitleaks, etc., from main-legacy.
- **PR:** Open a Pull Request to merge `chore/add-ci-workflows` into main.

**Isolate Infrastructure as Code (IaC) Changes:**
- **Branch:** `infra/scaffold-terraform`
- **Action:** Cherry-pick the commits related to the initial Terraform and SOC scaffolding from main-legacy.
- **PR:** Open a Pull Request to merge `infra/scaffold-terraform` into main.

## Epic 2: Greenfield MVP Development

**Goal:** To build the Minimum Viable Product (MVP) of the new Ionkare application on a modern tech stack, following the phased plan outlined in the PRD and integrating security throughout the development process (DevSecOps).

### User Story 2 (Phase 0): Secure Foundations

**As a** DevSecOps engineer,  
**I want to** establish the foundational skeleton for the new application and its CI/CD pipeline  
**So that** all future development can build upon a secure, automated, and testable base.

#### Tasks & Branches:

**Create a Feature Branch:**
- **Branch:** `feature/phase-0-foundations`

**Implement the Application Skeleton:**
- **Action:** Set up a monorepo with the basic Next.js frontend and NestJS backend applications.
- **Action:** Establish the initial database schema using Prisma based on the PRD's data model.

**Integrate Security into CI/CD:**
- **Action:** Configure the existing CI workflows (Semgrep, CodeQL, etc.) to scan the new TypeScript codebase.
- **Action:** Add SCA scanning (e.g., Dependabot, Snyk) to the pipeline to monitor npm package vulnerabilities.

**Open a Pull Request:**
- **PR:** Open a PR to merge `feature/phase-0-foundations` into main. The PR will be reviewed for code quality and to ensure all security scans are passing.

### User Story 3 (Phase 1): MVP Core Features

**As a** product developer,  
**I want to** build the core features of the MVP as defined in the PRD  
**So that** we have a functional prototype for initial user feedback.

#### Tasks & Branches:

This large user story will be broken down into smaller, feature-specific branches.

**Authentication Module:**
- **Branch:** `feature/mvp-auth`
- **Action:** Implement email/password signup and login using Passport.js. Ensure secure password hashing (e.g., Argon2), CSRF protection, and secure session management are in place.

**Profiles & Team Management:**
- **Branch:** `feature/mvp-profiles-and-team`
- **Action:** Build the API and UI for creating user profiles and managing follow requests. Ensure proper authorization checks (RBAC/ABAC) are in place to prevent Insecure Direct Object References (IDOR).

**Calendar & Media:**
- **Branch:** `feature/mvp-calendar-and-media`
- **Action:** Implement CRUD operations for calendar events and secure image uploads to S3 using presigned URLs to prevent server-side request forgery (SSRF). Implement server-side validation of file types and sizes.

**Notifications & Static Pages:**
- **Branch:** `feature/mvp-notifications-and-static`
- **Action:** Build the API endpoints for notification counters and the basic static pages (landing, privacy, etc.). Ensure the contact form has rate limiting and input validation to prevent abuse.