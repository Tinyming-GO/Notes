<?php

$http = new swoole_http_server("0.0.0.0", 8811);

$http->set([
    'enable_static_handler' => true,
    'document_root'         => "/home/vagrant/code/swoole/data",
]);
$http->on('request', function($request, $response) {
    //print_r($request->get); // 会输出到server端
    $response->cookie('singwa', 'xssss', time() + 1800);
    $response->end('ssss' . json_encode($request->get));
});

$http->start();