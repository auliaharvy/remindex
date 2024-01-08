<?php

namespace Modules\DocumentType\database\seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Modules\Tag\Models\DocumentType;

class DocumentTypeDatabaseSeeder extends Seeder
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
         * DocumentTypes Seed
         * ------------------
         */

        // DB::table('documenttypes')->truncate();
        // echo "Truncate: documenttypes \n";

        DocumentType::factory()->count(20)->create();
        $rows = DocumentType::all();
        echo " Insert: documenttypes \n\n";

        // Enable foreign key checks!
        DB::statement('SET FOREIGN_KEY_CHECKS=1;');
    }
}
