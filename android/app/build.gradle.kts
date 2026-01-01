plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.the_lawman"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.Mogul.the_Lawman"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            val keystorePath = System.getenv("KEYSTORE_PATH") ?: "${rootProject.projectDir}/the_lawman_keystore.jks"
            val keystoreFile = file(keystorePath)

            if (keystoreFile.exists()) {
                keyAlias = System.getenv("KEY_ALIAS") ?: "the_lawman_key"
                keyPassword = System.getenv("KEY_PASSWORD") ?: "theLawman123!"
                storeFile = keystoreFile
                storePassword = System.getenv("STORE_PASSWORD") ?: "theLawman123!"
            } else {
                initWith(getByName("debug"))
                println("Release keystore not found at $keystorePath. Falling back to debug signing for AAB generation.")
            }
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
        }
    }
}

flutter {
    source = "../.."
}
