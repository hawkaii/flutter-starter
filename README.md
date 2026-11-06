# flutter-starter

A starter template for Flutter app projects. One themed shell, a layout that
already has somewhere to put things, and CI that builds an APK and publishes it
as a GitHub Release on every push.

Click **Use this template** above, or:

```bash
gh repo create my-app --template hawkaii/flutter-starter --public --clone
cd my-app && flutter run
```

## What is in it

```
lib/
├── main.dart                        entry point, one line of work
├── app.dart                         MaterialApp: theme, title, first screen
├── core/
│   └── theme/app_theme.dart         one seed colour → light and dark
└── presentation/
    └── screens/home_screen.dart     the screen you replace
test/
└── widget_test.dart                 the app boots and renders
```

`core/` holds things nothing owns (theme, config, utils); `presentation/` holds
things the user sees. `data/` belongs beside them when models and services
arrive — not inside `presentation/`.

Two files, two jobs: `main.dart` starts the app, `app.dart` decides what it
looks like. Routing, state and localisation all attach in `app.dart`, so `main`
never grows into a list of setup calls.

## Theming

`app_theme.dart` holds a single seed colour:

```dart
static const Color seed = Color(0xFF6B4EFF);
```

Both themes derive from it via `ColorScheme.fromSeed`, so rebranding is one
line. Nothing in the tree should hardcode a `Color(0xFF…)` — read from
`Theme.of(context).colorScheme` instead.

## CI

`.github/workflows/build.yml` runs on every push to `main`, every pull request,
and on demand:

| Job | What it does |
|---|---|
| `check` | `flutter analyze` and `flutter test` |
| `apk` | `flutter build apk --release --split-per-abi`, uploaded as an artifact |
| `release` | publishes the APKs as a GitHub Release tagged `v<version>-<run>` |

`apk` is gated on `check`, so a broken commit never produces a binary. `release`
is skipped on pull requests. A second push cancels the run in flight. Flutter is
pinned in `FLUTTER_VERSION` rather than tracking `stable`, so a release landing
mid-week cannot turn a green build red without a commit — bump it on purpose.

Version comes from `pubspec.yaml`, so `version: 0.2.0+3` produces releases
`v0.2.0-12`, `v0.2.0-13`, … The APKs are renamed to
`<package-name>-<version>-<abi>.apk` on the way out.

## Renaming it for a real project

The package name is permanent the moment you publish to a store, so change it
before the first upload, not after:

```bash
flutter create --project-name myapp --org com.example --platforms android,ios .
```

Then update `title:` in `app.dart`, `name:` and `description:` in
`pubspec.yaml`, and this file.

Before any Play Store upload you still need: a release keystore + Play App
Signing, `bundleRelease` instead of `apk`, and HTTPS for anything the app talks
to. None of that is here on purpose — a template that guesses your signing
setup is worse than one that does not.
