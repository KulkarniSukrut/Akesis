# Akesis — Personal OS

A cross-platform personal tracker built with **Flutter** and **Supabase**. The goal is to log habits, goals, tasks, and daily metrics in one place, then (later) analyze how they affect each other.

> **Status: in active development.** See the checklist below for what works today and what is planned.

## Tech Stack

| Layer | Technology |
|---|---|
| Client | Flutter / Dart (Android, iOS, Web, Desktop targets) |
| Backend | Supabase (PostgreSQL, Auth, Row Level Security) |
| Planned | Python analytics pipeline, LLM-powered summaries |

## Current Status



- [✅ ] Project scaffold and Supabase connection
- [ ] User authentication
- [ ] Database schema designed (tables: ___ )
- [ ] Row Level Security policies
- [ ] Habits
- [ ] Tasks
- [ ] Goals
- [ ] Journal
- [ ] Metrics

### Roadmap (not started)

- Analytics: correlations across sleep, study, fitness, and mood
- AI layer: weekly summaries and natural-language logging

## The Idea

```
TRACK → STORE → ANALYZE → UNDERSTAND → ADAPT
```

Most trackers are checkbox apps. This project aims to surface non-obvious relationships between life dimensions (for example sleep and energy, or study time and mood) over longer periods.

## Screenshots


## Getting Started

```bash
git clone https://github.com/KulkarniSukrut/Akesis.git
cd Akesis
flutter pub get
flutter run
```

Create a Supabase project and add your project URL and anon key where the app expects them (describe the exact file or `--dart-define` here).

## Project Structure

```
lib/        Flutter app source
test/       Tests
android/ ios/ web/ windows/ linux/ macos/   Platform runners
```

## Author

Sukrut Kulkarni — [GitHub](https://github.com/KulkarniSukrut) · [LinkedIn](https://www.linkedin.com/in/sukrutkulkarni06)
