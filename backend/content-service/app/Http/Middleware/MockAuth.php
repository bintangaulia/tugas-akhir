<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class MockAuth
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle($request, Closure $next)
    {
        // Simulasi user dari Auth Service
        $request->merge([
            'user' => [
                'id' => 1,
                'name' => 'Mahasiswa Demo',
                'role' => 'admin',
                'prodi' => 'keperawatan',
            ]
        ]);

        return $next($request);
    }
}
