<?php

namespace Modules\Department\Console\Commands;

use Illuminate\Console\Command;

class DepartmentCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:DepartmentCommand';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Department Command description';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        return Command::SUCCESS;
    }
}
