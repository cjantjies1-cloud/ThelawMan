plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

fun Project.signingCredential(name: String): String? =
    System.getenv(name) ?: findProperty(name)?.toString()

fun Project.resolveKeystorePath(defaultPath: String, legacyPath: String): String =
    System.getenv("KEYSTORE_PATH")
        ?: findProperty("KEYSTORE_PATH")?.toString()
        ?: legacyPath.takeIf { file(it).exists() }
        ?: defaultPath

fun credentialsMissing(vararg values: String?): Boolean = values.any { it.isNullOrBlank() }

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
        maybeCreate("debug")
        create("release") {
            val defaultKeystorePath = "${rootProject.projectDir}/release-keystore.jks"
            val legacyKeystorePath = "${rootProject.projectDir}/the_lawman_keystore.jks"
            val keystorePath = project.resolveKeystorePath(defaultKeystorePath, legacyKeystorePath)
            val keystoreFile = file(keystorePath)

            if (keystoreFile.exists()) {
                val keyAliasProp = project.signingCredential("KEY_ALIAS")
                val keyPasswordProp = project.signingCredential("KEY_PASSWORD")
                val storePasswordProp = project.signingCredential("STORE_PASSWORD")

                if (credentialsMissing(keyAliasProp, keyPasswordProp, storePasswordProp)) {
                    throw GradleException("Release keystore found at $keystorePath but signing credentials are missing. Please provide KEY_ALIAS, KEY_PASSWORD, and STORE_PASSWORD.")
                }

                keyAlias = keyAliasProp
                keyPassword = keyPasswordProp
                storeFile = keystoreFile
                storePassword = storePasswordProp
            } else {
                val debugConfig = findByName("debug")
                    ?: throw GradleException("Release keystore not found and debug signing config unavailable. Provide a release keystore to build the bundle.")
                initWith(debugConfig)
                logger.warn("Release keystore not found at $keystorePath. Falling back to debug signing for AAB generation.")
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
