Release package for Play Console upload

What's included:
- Signed AAB: the_lawman-the_lawman_key-signed.aab
- Upload certificate (PEM): the_lawman-upload-cert.pem
- SHA-1 fingerprint: the_lawman-upload-fingerprint-sha1.txt
- SHA-256 fingerprint: the_lawman-upload-fingerprint-sha256.txt
- Keystore info: the_lawman_keystore_info.txt

Upload steps (Play Console):
1. Open Google Play Console → your app → Release → Production (or internal testing).
2. Under "App signing" (Setup > App signing), register the upload key if required using the SHA-1 and SHA-256 fingerprints in this package.
3. Create a new release and upload `the_lawman-the_lawman_key-signed.aab`.
4. Fill release notes and review the release.

Security:
- Keep the keystore `android/the_lawman_keystore.jks` private and back it up.
- If you want me to remove intermediate/unsigned files from the workspace, tell me.

