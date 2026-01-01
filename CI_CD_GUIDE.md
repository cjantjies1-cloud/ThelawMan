# CI/CD Infrastructure Guide

This document describes the continuous integration and deployment setup for The LawMan Flutter app.

## Overview

The project uses GitHub Actions to automatically build and deploy the Flutter web application to Firebase Hosting whenever code is pushed to the `main` branch.

## Architecture

```text
Developer Push to main
         ↓
   GitHub Actions
         ↓
   Flutter Build (Web)
         ↓
   Firebase Deploy
         ↓
   Live Hosting (Firebase)
```

## Workflow: Deploy to Firebase Hosting

**File:** `.github/workflows/firebase-hosting-deploy.yml`

### Triggers

- Automatic deployment on any push to `main` branch

### Steps

1. **Checkout Code** - Pulls latest code from repository
2. **Setup Flutter** - Installs Flutter 3.16.0 stable
3. **Get Dependencies** - Runs `flutter pub get`
4. **Build Web** - Compiles Flutter to web: `flutter build web --release`
5. **Setup Node.js** - Installs Node 18 (required by Firebase CLI)
6. **Install Firebase CLI** - Latest firebase-tools version
7. **Deploy** - Uses Firebase hosting deploy action with service account auth

### Duration

Expected runtime: **3-5 minutes**

## Configuration Files

### firebase.json

Configures Firebase Hosting deployment:

- **public:** `build/web` - Points to Flutter web build output
- **rewrites:** Routes all URLs to `index.html` (SPA support)

### GitHub Secrets Required

Two secrets must be configured in GitHub repository settings:

1. `FIREBASE_SERVICE_ACCOUNT` - Full JSON service account credentials
2. `FIREBASE_PROJECT_ID` - Firebase project identifier

See [SECRETS_SETUP.md](.github/SECRETS_SETUP.md) for detailed setup instructions.

## Deployment Targets

### Web (Automatic - Main Branch)

- **URL:** Firebase Hosting URL (visible in Firebase Console)
- **Triggered by:** Push to `main` branch
- **Status:** Check GitHub Actions tab

### Android (Manual)

- **Command:** `flutter build appbundle --release`
- **Output:** `build/app/outputs/bundle/release/app-release.aab`
- **Target:** Google Play Console
- **Keystore:** `android/the_lawman_keystore.jks`

See [BUILD_AAB.md](../BUILD_AAB.md) for detailed instructions.

## Monitoring Deployments

### Via GitHub

1. Navigate to your repository
2. Click **Actions** tab
3. Select "Deploy to Firebase Hosting" workflow
4. Check the latest run status
5. Click the run to see detailed logs

### Via Firebase Console

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project
3. Click **Hosting** in left sidebar
4. View deployment history and statistics
5. Rollback if needed using the menu

## Troubleshooting

### Workflow fails to start

- Check if secrets are properly configured
- Verify `main` branch name is correct
- Ensure `.github/workflows/firebase-hosting-deploy.yml` is valid

### Flutter build fails

- Check logs in GitHub Actions for specific error
- Run `flutter clean` and rebuild locally
- Verify `pubspec.yaml` dependencies are correct

### Firebase deployment fails

- Confirm Firebase project ID is correct
- Check service account has "Firebase Hosting Admin" role
- Ensure `firebase.json` is correctly formatted
- Verify `build/web/` directory exists after Flutter build

### Site shows 404 or blank page

- Check that Flutter web build completed successfully
- Verify `firebase.json` points to `build/web` directory
- Clear browser cache and hard refresh (Ctrl+Shift+R)

## Best Practices

### Code Changes

- Always test locally before pushing: `flutter run -d chrome`
- Keep `pubspec.lock` committed for consistent builds
- Review workflow logs after deployment

### Secrets Management

- Never commit service account JSON file
- Rotate service account keys periodically
- Use environment variables in CI/CD, never hardcode credentials
- Restrict service account to minimum required permissions

### Deployment

- Tag releases in git for easy tracking
- Document breaking changes in commit messages
- Monitor Firebase Console for deployment issues
- Test in preview channel before going to production

## Adding More Workflows

To add additional workflows (testing, linting, etc.):

1. Create new YAML file in `.github/workflows/`
2. Define triggers (push, pull_request, schedule, etc.)
3. Add steps to perform desired tasks
4. Commit and push to activate

Example for adding a test workflow:

```yaml
name: Flutter Tests

on:
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter test
```

## Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Flutter CI/CD Best Practices](https://flutter.dev/docs/deployment/cd)
- [Firebase Hosting Deployment](https://firebase.google.com/docs/hosting)
- [Firebase GitHub Action](https://github.com/FirebaseExtended/action-hosting-deploy)
