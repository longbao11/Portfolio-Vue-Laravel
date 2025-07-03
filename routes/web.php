<?php

use App\Http\Controllers\FeedbackController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::get('/', function () {
    return Inertia::render('Welcome');
})->name('home');



Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('dashboard', function () {
        return Inertia::render('Dashboard');
    })->name('dashboard');
});

Route::middleware(['auth', 'verified'])->group(function () {
    Route::post('/contact', [FeedbackController::class, 'store'])->name('feedback.store');

    Route::get('/admin/messages', [FeedbackController::class, 'index'])->name('feedback.index');


});

Route::get('/test', fn() => 'It works!');

require __DIR__ . '/settings.php';
require __DIR__ . '/auth.php';
