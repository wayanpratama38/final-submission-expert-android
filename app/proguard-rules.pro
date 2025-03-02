# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile
#-dontobfuscate
#-keepattributes SourceFile,LineNumberTable

##---------------Begin: proguard configuration for Navigation Component ----------
-keepclassmembers class * extends androidx.navigation.dynamicfeatures.fragment.DynamicNavHostFragment {
    public *;
}

## Library yang hanya digunakan di :app
## Koin
-keep class org.koin.** { *; }
-keepclassmembers class * { @org.koin.core.annotation.* *; }

## Model class aplikasi
-keep class com.example.app.data.model.** { *; }

# OkHttp ProGuard Rules
-keepattributes Signature
-keep class okhttp3.** { *; }
-keep class okhttp3.internal.** { *; }
-dontwarn okhttp3.**
-dontwarn okio.**
-dontwarn javax.annotation.**


## Glide
-keep public class * implements com.bumptech.glide.module.GlideModule

## Coroutines Flow
-keepclassmembernames class kotlinx.coroutines.** { volatile <fields>; }

-keep class com.example.core.di.CoreModuleKt

-keep class **ViewBinding { *; }

-keep class com.example.core.data.source.Resource { *; }
## Recycler View Adapater
-keep class com.example.foodist.presentation.utils.RvAdapter { *; }
