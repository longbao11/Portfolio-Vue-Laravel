<?php

namespace App\Http\Controllers;

use App\Models\Feedback;
use Illuminate\Http\Request;

class FeedbackController extends Controller
{
    public function store(Request $request)
    {
        $data = $request->validate([
            'email' => 'required|email',
            'subject' => 'required|string|max:20',
            'message' => 'nullable|string',
        ]);

        Feedback::create($data);

        return back()->with('success', 'Thank you for your message!');
    }
}
