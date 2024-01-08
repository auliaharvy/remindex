<?php

namespace Modules\DocumentType\Console\Commands;

use Illuminate\Console\Command;

class DocumentTypeCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:DocumentTypeCommand';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'DocumentType Command description';

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
