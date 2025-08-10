### Product Requirements Document (PRD)

#### Vision and Purpose
- The legacy “Ionkare (Liviam)” platform is a healthcare social/coordination app enabling a patient and their supporters to:
  - Create a patient profile and story.
  - Build a “team” of supporters via invites and follow requests.
  - Coordinate via a calendar (events, visits/calls, recurring rules).
  - Share updates and media (images/videos) with privacy controls.
  - Message and receive notifications.
  - Surface facility posts and surveys.

#### Primary Personas
- **Patient**: central user whose health journey and schedule are coordinated; controls privacy and team.
- **Supporter/Visitor**: family/friend/caregiver who follows and participates per privacy rules.
- **Facility/Staff**: posts announcements to patients (legacy “facility_post” API).

#### Core User Flows
- **Authentication and onboarding**
  - Email/password and optionally Google OIDC. Invite links can pre-fill or route onboarding.
- **Patient dashboard**
  - Calendar, carestream/blog widget, team widget, media shortcuts, tutorials/surveys.
- **Team management**
  - Invite supporters; accept/deny requests; follow/unfollow; notification preferences.
- **Calendar**
  - Create/edit/delete events; visit/call types; optional recurrence; ICS export (later).
- **Media**
  - Albums; image/video uploads; thumbnails; like/comment; attach media to events.
- **Notifications**
  - New messages, team updates, likes/comments; clear counters.
- **Facility posts (API)**
  - External system posts content to patient timelines based on conditions/facility.
- **Search**
  - Find accounts by display name; filter to friends/patients; profile visit history.
- **Surveys/Insights**
  - Trigger surveys to patients based on timing, facility settings.

#### Non-Functional Requirements
- **Privacy and security**: privacy levels, HTTPS, hardened sessions/tokens, PII protection.
- **Compliance readiness**: HIPAA alignment for production deployments.
- **Reliability**: background jobs for emails, thumbnails, notifications.
- **Observability**: error tracking and APM.

### MVP Scope (PoC/Prototype)

- **Auth and Onboarding**
  - Email/password login and signup. Google OIDC optional.
  - Invite acceptance; “step 2” to choose patient/visitor role.
  - Session with remember-me cookie.
- **Profiles**
  - Patient vs Visitor basic profiles; avatar upload/cropping; simple privacy toggle.
- **Team**
  - Follow requests (visitor → patient), accept/deny; list followers/following.
  - Start/stop receiving notifications from a patient.
- **Calendar**
  - CRUD single-instance events; types (call/visit); follower visibility per privacy.
  - Recurrence excluded from MVP.
- **Media**
  - Image uploads to S3; thumbnail generation; album listing; simple attachments.
  - Video transcoding excluded.
- **Notifications**
  - In-app counters for “new messages/notifications”; reset endpoints.
  - Async email for invites and password recovery.
- **Search**
  - Accounts by display name.
- **Static pages**
  - Landing, blog placeholder, privacy/terms/help, contact us form.

Out of MVP (Phase 2+):
- Recurring calendar rules; ICS export.
- Conversations/messaging UI.
- Full carestream feed with likes/comments and facility posts.
- Video transcoding; rich media comments/likes.
- Extensive privacy model; profile visits analytics.
- OmniContacts; tracking/analytics; APM integrations.
- Surveys/Insights.

### Modular Feature Breakdown
- **Auth**: local email/password, optional Google OIDC; invites; reset password; sessions.
- **Accounts**: profile CRUD; avatar processing; privacy settings; notification preferences.
- **Team**: follow/unfollow; invite/accept/deny; lists; notification toggles.
- **Calendar**: single-instance events; owner vs follower access; upcoming list.
- **Media**: S3 upload, thumbnailing; albums; later comments/likes.
- **Notifications**: counters and reset; later push/SSE.
- **Search**: by display name; later friends-only and profile visit history.
- **Admin/API (later)**: facility posts; surveys.

### Modern Technical Architecture
- **Recommended (TypeScript-first)**
  - Frontend: Next.js 14+, Tailwind, shadcn/ui.
  - Backend: NestJS (REST first; GraphQL optional).
  - DB: PostgreSQL 15+ with Prisma (JSONB for flexible subdocs).
  - Cache/Queue: Redis 7.x; BullMQ for jobs.
  - Storage: S3-compatible (AWS S3).
  - Media: MVP Sharp for images; later AWS MediaConvert/Cloudflare Stream for video.
  - Auth: Passport (Nest) + JWT/cookies; NextAuth optional; Google OIDC later.
  - Notifications: MVP polling; later WebSockets/SSE.
  - Observability: Sentry + OpenTelemetry; structured logs.
  - Infra: Docker; CI GitHub Actions; IaC Terraform (later).
  - Email: Postmark or SES.
- **Ruby-centric alternative**
  - Rails 7.2 + Hotwire + Devise + Sidekiq + Redis + ActiveStorage(S3) + ViewComponent.
  - Postgres; ImageProcessing + libvips; MediaConvert for videos.
- **Legacy → Modern mapping**
  - CouchDB → Postgres (normalize; JSONB where helpful).
  - Resque/GirlFriday → BullMQ (Nest) or Sidekiq (Rails).
  - Blitline → Sharp worker/Lambda.
  - Elastic Transcoder → MediaConvert/Cloudflare Stream.
  - Sinatra → NestJS/Rails.
  - Rollbar/NewRelic → Sentry/OTel/APM.

### High-level Data Model (MVP)
- **Account**: id, type (patient|visitor), email, password_hash, profile (JSONB), privacy_level, notifications (JSONB)
- **TeamRelationship**: id, patient_id, visitor_id, status (requested|accepted|denied), created_at
- **NotificationCursor**: id, account_id, conversations_cleared_at, notifications_cleared_at
- **Event**: id, owner_id, title, description, type (call|visit), start_time, end_time, visibility, created_by_id
- **Album**: id, account_id, title, description, cover_image_url
- **Media**: id, album_id, account_id, type (image), s3_key, url, width, height, created_at
- **Invite**: id, code, inviter_id, invitee_email, status, created_at, consumed_at

### API Surface (MVP examples)
- **Auth**
  - POST /api/auth/signup
  - POST /api/auth/login
  - POST /api/auth/password/request
  - POST /api/auth/password/reset
- **Accounts**
  - GET /api/me
  - PUT /api/me/profile
  - PUT /api/me/privacy
  - PUT /api/me/avatar
- **Team**
  - GET /api/team/followers
  - GET /api/team/following
  - POST /api/team/requests/:patientId
  - POST /api/team/:patientId/accept|deny
  - POST /api/team/:patientId/notify/start|stop
- **Calendar**
  - GET /api/calendars/:accountId/events?start=&end=
  - POST /api/calendars/:accountId/events
  - PUT /api/calendars/:accountId/events/:eventId
  - DELETE /api/calendars/:accountId/events/:eventId
- **Media**
  - POST /api/media/uploads/presign
  - POST /api/media/albums
  - GET /api/media/:accountId/albums
  - GET /api/media/albums/:albumId
- **Notifications**
  - GET /api/notifications
  - GET /api/notifications/detail?limit=
  - POST /api/notifications/reset/new_messages
  - POST /api/notifications/reset/new_notifications
- **Search**
  - GET /api/search/accounts?query=

### Acceptance Criteria (MVP, selected)
- **Auth**: login works; CSRF protection; password reset email and token flow.
- **Profiles/Avatar**: upload/cropping produces expected sizes; visible in dashboard.
- **Team**: request/accept/deny flows; lists accurate; unauthorized access blocked.
- **Calendar**: owner CRUD; follower visibility per privacy; invalid ranges rejected.
- **Media**: presigned upload; thumbnail generated; album list correct.
- **Notifications**: counters update and can be reset.

### Phased Delivery Plan
- **Phase 0: Foundations (1–2 weeks)** Repo setup, CI, base Next/Nest skeleton, Postgres/Redis, auth baseline.
- **Phase 1: MVP Core (3–5 weeks)** Profiles, Team, Calendar (single events), Media (images only), Notifications counters, Search, static pages.
- **Phase 2: Collaboration (3–4 weeks)** Messaging MVP, push notifications, recurrence, richer privacy, likes/comments.
- **Phase 3: Health features (2–4 weeks)** Facility posts API, surveys/insights, analytics, admin tools.
- **Phase 4: Scale and Compliance** Observability, rate-limits, audit logs, HIPAA hardening.

### Migration Strategy
- Greenfield rebuild; optional data import from legacy CouchDB:
  - ETL from CouchDB views → new tables.
  - Media S3 key remap; regenerate thumbnails as needed.
  - Phased pilot cut-over.

### Risks and Open Questions
- Compliance scope (HIPAA, PHI present?).
- MVP privacy model scope (simple toggle vs full levels).
- Keep or drop facility posts/surveys/gifts for v1.
- Messaging expectations (realtime vs async only).
- OAuth providers to support (Google only initially?).
