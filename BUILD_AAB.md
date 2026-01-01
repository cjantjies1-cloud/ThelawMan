# Building AAB (Android App Bundle)

## Prerequisites

- Flutter SDK installed
- Android SDK configured
- Java Development Kit (JDK) 11 or higher

## Build Configuration

The app is configured with a keystore for signing releases:

**Keystore Details:**

- Default location: `android/release-keystore.jks` (override with `KEYSTORE_PATH`)
- Provide credentials via environment variables or `gradle.properties`:
  - `KEY_ALIAS`
  - `KEY_PASSWORD`
  - `STORE_PASSWORD`

## Building the AAB File

### 1. Basic Build (Development)

```bash
flutter build appbundle
```

### 2. Release Build

```bash
flutter build appbundle --release
```

### 3. With Custom Signing (Optional)

You can override the keystore path and credentials using environment variables:

```bash
export KEYSTORE_PATH="/path/to/keystore.jks"
export STORE_PASSWORD="your_store_password"
export KEY_ALIAS="your_key_alias"
export KEY_PASSWORD="your_key_password"
flutter build appbundle --release
```

## Output Location

The generated AAB file will be located at:

```bash
build/app/outputs/bundle/release/app-release.aab
```

## Publishing to Google Play

1. Go to [Google Play Console](https://play.google.com/console)
2. Create or select your application
3. Navigate to Release → Production
4. Upload the AAB file: `build/app/outputs/bundle/release/app-release.aab`

## Security Notes

⚠️ **Important:** The keystore file and passwords are currently set to development defaults. Before publishing to production:

1. Generate a new, secure keystore with strong passwords
2. Store the keystore securely (do NOT commit to version control)
3. Update the signing configuration with your production keystore
4. Use environment variables or a local properties file for sensitive credentials

## Troubleshooting

### Error: "keystore file not found"

Ensure the keystore path is correct and the file exists.
If the keystore is missing, the build will fall back to the debug keystore so you can still produce an AAB. Replace it with your release keystore before publishing to Play Store.

### Error: "FAILURE: Build failed"

Run `flutter clean` and then retry:

```bash
flutter clean
flutter pub get
flutter build appbundle --release
```

### Check build logs

For detailed error information:

```bash
flutter build appbundle --verbose
```
