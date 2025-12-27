public (Firebase Hosting)

Place your FlutterFlow web build contents (the files that include index.html, assets/, and JS bundles) into this public folder.

Quick steps (PowerShell):

# Unzip downloaded FlutterFlow web build and copy contents into public
Expand-Archive -Path "$env:USERPROFILE\Downloads\web_build.zip" -DestinationPath ".\public" -Force

# or copy files from a build folder (adjust path)
robocopy "C:\path\to\build\web" ".\public" /MIR

After files are in public, run `firebase init hosting` and `firebase deploy` (requires Node/npm and firebase-tools).
