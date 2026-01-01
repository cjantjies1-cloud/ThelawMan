# Secure Keystore Setup for GitHub Actions (Android Release Signing)

To securely sign your Android AAB in CI/CD, do NOT commit your keystore to the repository. Instead, use GitHub Actions secrets and upload the keystore at build time.

## 1. Add Keystore as a GitHub Secret (Base64)

- Convert your keystore to base64:

  ```sh
  base64 -w 0 the_lawman_keystore.jks > the_lawman_keystore.jks.base64
  ```

- Copy the contents of `the_lawman_keystore.jks.base64`.
- Go to your GitHub repo → Settings → Secrets and variables → Actions → New repository secret.
- Name: `KEYSTORE_BASE64`
- Value: (paste the base64 string)

## 2. Add Passwords as Secrets

- Add `KEYSTORE_PASSWORD` (store password)
- Add `KEY_PASSWORD` (key password)
- Add `KEY_ALIAS` (key alias)

## 3. Update Workflow

Add these steps before the build step in your workflow:

```yaml
    - name: Decode keystore from secret
      run: |
        echo "$KEYSTORE_BASE64" | base64 -d > app/android/the_lawman_keystore.jks
      env:
        KEYSTORE_BASE64: ${{ secrets.KEYSTORE_BASE64 }}

    - name: Build AAB
      run: |
        cd app
        flutter build appbundle --release --verbose
      env:
        KEYSTORE_PATH: ${{ github.workspace }}/app/android/the_lawman_keystore.jks
        KEY_ALIAS: ${{ secrets.KEY_ALIAS }}
        STORE_PASSWORD: ${{ secrets.KEYSTORE_PASSWORD }}
        KEY_PASSWORD: ${{ secrets.KEY_PASSWORD }}
```

## 4. Remove any committed keystore from the repo

If you have already committed your keystore, remove it and add to `.gitignore`.

---

This approach keeps your keystore secure and enables automated, signed builds in GitHub Actions.
