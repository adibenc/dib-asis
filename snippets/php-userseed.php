<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;

// php artisan db:seed --class=UserSeeder
class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        try{
            User::create([
                "id" => 1,
                "name" => "demo",
                "username" => "demo",
                "is_active" => "1",
                "email" => "0@mail.com",
                'email_verified_at' => now(),
                "password" => '$2y$10$miASKW54gvYS3/CGP6Ce6.Nzp6OWGNMknUqwK5iSzpCGjKAOyzRHy', // 123
            ]);
        }catch(\Exception $e){
            
        }
        //
        // User::factory()
        //     ->count(3)
        //     ->create();
    }
}
