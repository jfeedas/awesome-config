<?php

    require __DIR__ . '/constants.php';

    $data = file_get_contents(DIGI_URL);

    $data = json_decode($data, true);
    $data = $data['autogidas'];

    $storage = file_get_contents(__DIR__ . "/storage.txt");
    $storage = unserialize($storage);
    $all = $data[0]['users'] + $data[1]['users'];
    
    $report = 0;
    if($all > $storage['max']){
        $report = 1;
        $storage['max'] = $all;
    }

    echo json_encode(
        [
            'www' => $data[0]['users'],
            'mobile' => $data[1]['users'],
            'all' => $all,
            'max' => $storage['max'],
            'report' => $report,
        ]
    );

    file_put_contents(__DIR__ . "/storage.txt", serialize($storage));
