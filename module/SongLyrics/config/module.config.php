<?php
return array(
    'view_helpers' => array(
        'factories' => [
            'Lyricize' => '\\SongLyrics\\Factory\\LyricizerFactory',
        ]
    ),
    'service_manager' => [
        'factories' => [
            'AllYourBaseLyrics' => '\\SongLyrics\\Factory\\AllYourBaseFactory',
        ],
    ],
);