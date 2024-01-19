<?php

namespace Modules\Document\database\factories;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Model>
 */
class DocumentFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = \Modules\Document\Models\Document::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'id'                => (string) Str::orderedUuid(),
            'user_id'           => (string) Str::orderedUuid(),
            'type_id'           => (string) Str::orderedUuid(),
            'departemnt_id'     => (string) Str::orderedUuid(),
            'code'              => '',
            'name'              => '',
            'location'          => '',
            'description'       => $this->faker->paragraph,
            'status'            => 1,
            'created_at'        => Carbon::now(),
            'updated_at'        => Carbon::now(),
        ];
    }
}
