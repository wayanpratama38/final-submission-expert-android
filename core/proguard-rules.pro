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

#-dontwarn java.lang.invoke.StringConcatFactory
#
# Di Package
# Keep Koin classes
-keep class org.koin.** { *; }
-keepclassmembers class org.koin.** { *; }

# Keep CoreModuleKt (modul Koin di core)
-keep class com.example.core.di.CoreModuleKt { *; }
-keepclassmembers class com.example.core.di.CoreModuleKt { *; }

# Data Package
-keep class com.example.core.data.source.local.room.MealDao { *; }
-keep class com.example.core.data.source.local.entity.MealEntity { *; }

-keep class * extends androidx.room.RoomDatabase
-keep @androidx.room.Dao class *
-keep @androidx.room.Entity class *

-keep class com.example.core.data.source.remote.response.MealItem { *; }
-keep class com.example.core.data.source.remote.response.DetailResponse { *; }

-keep class com.example.core.data.source.Resource { *; }
-keepclassmembers class * implements java.io.Serializable {
  static final long serialVersionUID;
}

# Domain Package
-keep class com.example.core.domain.model.Meal { *; }
-keep class com.example.core.domain.repository.IMealRepository { *; }
-keep class com.example.core.domain.usecase.MealUseCase { *; }
-keep class com.example.core.domain.usecase.MealInteractor { *; }
-keep class com.example.core.utils.DataMapper { *; }
-keep class com.example.core.utils.AppExecutors { *; }


# Keep Class ViewBinding
-keep class **ViewBinding { *; }
-keep class com.example.core.databinding.** { *; }


-dontwarn java.lang.invoke.StringConcatFactory



