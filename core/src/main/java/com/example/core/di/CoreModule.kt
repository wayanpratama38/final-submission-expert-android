package com.example.core.di

import androidx.room.Room
import com.example.core.data.source.MealRepository
import com.example.core.data.source.local.LocalDataSource
import com.example.core.data.source.local.room.MealDatabase
import com.example.core.data.source.remote.RemoteDataSource
import com.example.core.data.source.remote.network.ApiService
import com.example.core.domain.repository.IMealRepository
import com.example.core.utils.AppExecutors
import net.sqlcipher.database.SQLiteDatabase
import net.sqlcipher.database.SupportFactory
import okhttp3.CertificatePinner
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import org.koin.android.ext.koin.androidContext
import org.koin.dsl.module
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import java.util.concurrent.TimeUnit


val databaseModule = module{
    factory { get<MealDatabase>().mealDao() }
    single {
        val passphrases: ByteArray = SQLiteDatabase.getBytes("meals".toCharArray())
        val factory  = SupportFactory(passphrases)
        Room.databaseBuilder(
            androidContext(),
            MealDatabase::class.java,"Meal.db"
        ).fallbackToDestructiveMigration()
            .openHelperFactory(factory)
            .build()
    }
}

val networkModule = module {
    single {
        val hostName = "themealdb.com"
        val certificatePinner = CertificatePinner.Builder()
            .add(hostName,"sha256/cfyBZmNVYdUGM4NFYlyCgnZnH2fKOyHevCaxN7wwPT8=")
            .build()
        OkHttpClient.Builder()
            .addInterceptor(HttpLoggingInterceptor().setLevel(HttpLoggingInterceptor.Level.BODY))
            .connectTimeout(120, TimeUnit.SECONDS)
            .readTimeout(120, TimeUnit.SECONDS)
            .certificatePinner(certificatePinner)
            .build()
    }

    single {
        val retrofit = Retrofit.Builder()
            .baseUrl("https://www.themealdb.com/api/json/v1/1/")
            .addConverterFactory(GsonConverterFactory.create())
            .client(get())
            .build()
        retrofit.create(ApiService::class.java)
    }
}

val repositoryModule = module {
    single { LocalDataSource(get()) }
    single { RemoteDataSource(get()) }
    factory { AppExecutors() }
    single<IMealRepository> { MealRepository(get(),get(),get()) }
}
