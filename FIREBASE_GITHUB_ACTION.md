# Deploying to Firebase Hosting via GitHub Actions

Steps to enable automatic deploys from this repository to Firebase Hosting (no local Node required):

1. Create a Firebase project (if you haven't) at https://console.firebase.google.com/

2. Create a service account and key:
   - In Firebase Console → Project settings → Service accounts → Click "Generate new private key" (opens Google Cloud Console).
   - In Google Cloud Console create a service account with the role "Firebase Hosting Admin" (or Project Editor) and download the JSON key.

3. Add GitHub secrets to your repository:
   - `FIREBASE_SERVICE_ACCOUNT` → the full JSON contents of the service account key (copy/paste the JSON file content into the secret value).
   - `FIREBASE_PROJECT_ID` → your Firebase project id (the short id shown in the Firebase console).

4. Commit and push your `public/` contents (your FlutterFlow web build) and these workflow files to the `main` branch.

5. On push to `main`, GitHub Actions will run `.github/workflows/firebase-hosting-deploy.yml` and deploy the `public` folder to Firebase Hosting.

Notes:
- This workflow uses `FirebaseExtended/action-hosting-deploy` which authenticates with the service account JSON.
- If you prefer using `firebase login:ci` token instead, you can replace the `firebaseServiceAccount` input with `firebaseToken` and store the token in a secret.
- Make sure `firebase.json` in the repo points `public` to the correct folder (this repo already contains `firebase.json`).
