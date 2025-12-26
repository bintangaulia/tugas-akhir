<?php

namespace App\Http\Middleware;

use Closure;

class JwtMockMiddleware
{
    public function handle($request, Closure $next)
    {
        if ($request->header('Authorization') !== 'Bearer MOCK_JWT_TOKEN') {
            return response()->json([
                'message' => 'Unauthorized'
            ], 401);
        }

        return $next($request);
    }
}
     