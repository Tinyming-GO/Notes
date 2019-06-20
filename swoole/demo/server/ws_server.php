<?php

$server = new swoole_websocket_server("0.0.0.0", 8812);
$server->set([
    'enable_static_handler' => true,
    'document_root'         => "/home/vagrant/code/swoole/data",
]);
//监听websocket连接打开事件
$server->on('open', 'onOpen');
function onOpen($server, $request) {
    print_r($request->fd);
}

//监听ws消息事件
$server->on('message', function(swoole_websocket_server $server, $frame) {
    echo "receive from {$frame->fd}:{$frame->data},opcode:{$frame->opcode},fin:{$frame->finish}\n";
    $server->push($frame->id, "this is server");
});

$server->on('close', function($server, $fd) {
    echo "client {$fd} closed\n";
});

$server->start();