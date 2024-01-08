<?php

namespace Modules\Department\database\seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Modules\Tag\Models\Department;

class DepartmentDatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Disable foreign key checks!
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');

        /*
         * Departments Seed
         * ------------------
         */

        // DB::table('departments')->truncate();
        // echo "Truncate: departments \n";

        Department::factory()->count(20)->create();
        $rows = Department::all();
        echo " Insert: departments \n\n";

        // Enable foreign key checks!
        DB::statement('SET FOREIGN_KEY_CHECKS=1;');
    }
}
