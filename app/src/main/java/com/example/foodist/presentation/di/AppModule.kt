package com.example.foodist.presentation.di

import com.example.core.domain.usecase.MealInteractor
import com.example.core.domain.usecase.MealUseCase
import com.example.foodist.presentation.detail.DetailViewModel
import com.example.foodist.presentation.home.HomeViewModel
import kotlinx.coroutines.ExperimentalCoroutinesApi
import org.koin.androidx.viewmodel.dsl.viewModel
import org.koin.dsl.module


val useCaseModule = module{
    factory<MealUseCase> { MealInteractor(get()) }
}

@OptIn(ExperimentalCoroutinesApi::class)
val viewModelModule = module {
    viewModel {  HomeViewModel(get()) }
    viewModel { (mealId : String) ->
        DetailViewModel(get(),mealId)
    }

}