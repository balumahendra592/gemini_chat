# Gemini Chat — Flutter + Google Gemini

A simple chat app built with **Flutter** that talks to **Google Gemini** using the official `google_generative_ai` Dart SDK. Type a message, get an AI reply — multi-turn conversation included.

Built for the **Kothastack** YouTube channel. 📺 [Watch the full tutorial](#) · New tech, built — Telugu & English.

---

## Demo

> User types a message → it goes to Gemini → the reply appears in the chat.

*(Add a screenshot or GIF here once recorded — drop it in an `assets/` folder and link it.)*

---

## Features

- Clean chat UI — text field, send button, scrollable message list
- Real multi-turn conversation (Gemini remembers context using `startChat`)
- API key passed safely from outside the code (no hardcoded secrets)
- Simple, beginner-friendly structure — UI and AI logic kept separate

---

## Tech stack

- **Flutter** (Dart)
- **google_generative_ai** — official Google AI Dart SDK
- **Google Gemini** (free tier via Google AI Studio)

---

## Getting started

### 1. Prerequisites

- Flutter installed and working (`flutter doctor` passes)
- A code editor (VS Code or Android Studio)
- A free Gemini API key

### 2. Clone the repo

```bash
git clone https://github.com/kothastack/gemini_chat.git
cd gemini_chat
```

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Get a Gemini API key

1. Go to [Google AI Studio](https://aistudio.google.com)
2. Click **Get API key → Create API key**
3. Copy it and keep it private — **never commit it to GitHub**

### 5. Run the app

Pass your key using `--dart-define` so it stays out of your source code:

```bash
flutter run --dart-define=API_KEY=YOUR_KEY_HERE
```

For web:

```bash
flutter run -d chrome --dart-define=API_KEY=YOUR_KEY_HERE
```

That's it — type a message and Gemini replies.

---

## Run from your editor (optional)

So you don't have to type the key every time, add a launch config at `.vscode/launch.json`:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "gemini_chat",
      "request": "launch",
      "type": "dart",
      "toolArgs": ["--dart-define=API_KEY=YOUR_KEY_HERE"]
    }
  ]
}
```

> ⚠️ Add `.vscode/launch.json` to `.gitignore` so your key isn't committed.

---

## Project structure

```
lib/
  main.dart            → chat screen (UI)
  gemini_service.dart  → talks to Gemini (logic)
```

---

## Android setup

Make sure internet permission is added in `android/app/src/main/AndroidManifest.xml`, above the `<application>` tag:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

---

## Troubleshooting

| Problem | Fix |
|---|---|
| `Method doesn't allow unregistered callers` / empty key | The key didn't reach the app — run with `--dart-define=API_KEY=...`, not a plain `flutter run` |
| `400 — API key not valid` | Check the flag name is exactly `API_KEY` to match `String.fromEnvironment('API_KEY')` |
| `404 — model not found` | Model name changed — check the current flash model in [AI Studio](https://aistudio.google.com) and update `gemini_service.dart` |
| Nothing happens / network error | Add the INTERNET permission (Android), or check your connection |
| Empty replies | Often a safety block or empty prompt — try a different message |

---

## ⚠️ Production note

Passing the key via `--dart-define` is fine for **learning and local testing**. In a **published app**, a determined user can still extract a client-side key.

For production, route requests through **your own backend** so the key never reaches the device. (A backend tutorial is coming on the channel.)

---

## License

MIT — free to use, learn from, and build on.

---

## About

Built by **Regeti Bala Murali Krishna** for **Kothastack**.

🔗 [Portfolio](https://regeti.qzz.io) · 📺 YouTube: [@kothastack](#)

*New tech, built. Build · Deploy · Debug · Learn.*