# GitHub Secrets Setup for Firebase Deployment

This document explains how to configure GitHub repository secrets for automated Firebase Hosting deployment.

## Prerequisites

1. GitHub repository access (admin permissions)
2. Firebase project created at [console.firebase.google.com](https://console.firebase.google.com/)
3. Firebase Hosting enabled in your project

## Step 1: Create Firebase Service Account

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project
3. Click **Project Settings** (gear icon)
4. Go to **Service Accounts** tab
5. Click **Generate New Private Key** button
6. This will download a JSON file containing your service account credentials
7. Keep this file safe - you'll paste its contents next

## Step 2: Add GitHub Secrets

1. Go to your [GitHub repository](https://github.com/cjantjies1-cloud/ThelawMan)
2. Click **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret** for each of the following:

### Secret 1: FIREBASE_SERVICE_ACCOUNT

- **Name:** `FIREBASE_SERVICE_ACCOUNT`
- **Value:** Paste the **entire JSON content** from the service account JSON file you downloaded
  - Start with `{` and end with `}`
  - Include all the fields as-is

### Secret 2: FIREBASE_PROJECT_ID

- **Name:** `FIREBASE_PROJECT_ID`
- **Value:** Your Firebase project ID (visible in Firebase Console)
  - Example: `the-lawman-12345`

## Step 3: Verify Secrets are Set

After adding the secrets, you can see them in:
Settings → Secrets and variables → Actions

They will show as masked (hidden) for security.

## Step 4: Test the Workflow

1. Push a change to the `main` branch:

```bash
git add .
git commit -m "Test Firebase deployment workflow"
git push origin main
```

1. Go to the **Actions** tab in your GitHub repository
1. You should see the "Deploy to Firebase Hosting" workflow running
1. Wait for it to complete (should take 2-3 minutes)
1. Check the Firebase Console to confirm the deployment

## Troubleshooting

### Workflow fails with "permission denied"

- Verify the service account has "Firebase Hosting Admin" role
- In Google Cloud Console → Service Accounts → Select service account → Grant role

### Firebase project ID not found

- Check spelling of the project ID
- Copy from Firebase Console exactly as shown

### Deployment succeeds but site shows 404

- Verify `firebase.json` points to correct directory: `"public": "build/web"`
- Ensure Flutter web build was successful

## Security Best Practices

1. **Never commit the service account JSON file** - It's already in `.gitignore`
2. **Rotate keys regularly** - Delete old keys in Google Cloud Console
3. **Limit service account permissions** - Only grant "Firebase Hosting Admin" role
4. **Keep credentials private** - Don't share the JSON file

## Removing Secrets

If you need to reset secrets:

1. Go to Settings → Secrets and variables → Actions
2. Click the trash icon next to the secret
3. Create a new service account and add the new secret

## Additional Resources

- [GitHub Secrets Documentation](https://docs.github.com/en/actions/security-guides/encrypted-secrets)
- [Firebase Service Accounts](https://firebase.google.com/docs/admin/setup)
- [Firebase GitHub Action](https://github.com/FirebaseExtended/action-hosting-deploy)
