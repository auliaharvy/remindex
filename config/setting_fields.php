<?php

return [
    'app' => [
        'title' => 'General',
        'desc' => 'All the general settings for application.',
        'icon' => 'fas fa-cube',

        'elements' => [
            [
                'type' => 'text', // input fields type
                'data' => 'string', // data type, string, int, boolean
                'name' => 'app_name', // unique name for field
                'label' => 'App Name', // you know what label it is
                'rules' => 'required|min:2|max:50', // validation rule of laravel
                'class' => '', // any class for input
                'value' => 'Remindex', // default value if you want
            ],
        ],
    ],
    'custom_css' => [
        'title' => 'Custom Code',
        'desc' => 'Custom code area',
        'icon' => 'fa-solid fa-file-code',

        'elements' => [
            [
                'type' => 'textarea', // input fields type
                'data' => 'string', // data type, string, int, boolean
                'name' => 'custom_css_block', // unique name for field
                'label' => 'Custom Css Code', // you know what label it is
                'rules' => '', // validation rule of laravel
                'class' => '', // any class for input
                'value' => '', // default value if you want
                'help' => 'Paste the code in this field.', // Help text for the input field.
                'display' => 'raw', // Help text for the input field.
            ],
        ],

    ],
];
