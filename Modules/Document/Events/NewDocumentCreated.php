<?php

namespace Modules\Document\Events;

use Illuminate\Queue\SerializesModels;
use Modules\Document\Models\Document;

class NewDocumentCreated
{
    use SerializesModels;

    public $document;

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct(Document $document)
    {
        $this->document = $document;
    }

    /**
     * Get the channels the event should be broadcast on.
     *
     * @return array
     */
    public function broadcastOn()
    {
        return [];
    }
}
