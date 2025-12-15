import org.jetbrains.kotlin.gradle.tasks.KotlinCompile
import org.gradle.api.tasks.compile.JavaCompile

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}

android {
    namespace = "com.example.ecommerce"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    defaultConfig {
        applicationId = "com.example.ecommerce"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    // ✅ Java 11 + core library desugaring
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = "11"
        // Silence obsolete-options warning
        freeCompilerArgs += listOf("-Xlint:-options")
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for release later
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

// ✅ Desugar dependency (required for Java 11 features)
dependencies {
    // Firebase BoM (required for all Firebase features)
    implementation(platform("com.google.firebase:firebase-bom:34.5.0"))

    // Firebase Cloud Messaging (Notifications)
    implementation("com.google.firebase:firebase-messaging")

    // Keep your desugaring dependency
    add("coreLibraryDesugaring", "com.android.tools:desugar_jdk_libs:2.1.4")
}



// ✅ Ensure all compile tasks target Java 11 and suppress obsolete warnings
tasks.withType<KotlinCompile>().configureEach {
    kotlinOptions.jvmTarget = "11"
    kotlinOptions.freeCompilerArgs += listOf("-Xlint:-options")
}

tasks.withType<JavaCompile>().configureEach {
    sourceCompatibility = "11"
    targetCompatibility = "11"
    options.compilerArgs.add("-Xlint:-options")
}
