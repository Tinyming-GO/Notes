<?php

//time33哈希算法实现（对于字符串而言这是目前所知的最好的哈希算法，速度快，冲突小，分布均匀）
function myHash($str) {
    //time33的定义：hash(i) = hash(i-1) * 33 + str[i]
    $hash = 5381; //为什么初始值是5381？ 据说hash后的分布更好一些。
    $s = md5($str);
    $seed = 5;
    $len = 32; //加密后长度32
    for($i = 0; $i < $len; $i++) {
        // (hash << 5) + hash 相当于 hash * 33
        //$hash = sprintf("%u", $hash * 33) + ord($s{$i});
        //$hash = ($hash * 33 + ord($s{$i})) & 0x7FFFFFFF;
        //$hash = ($hash << $seed) + $hash + ord($s{$i});  //TODO 网上常见，不过仅限于php5.6.0以上版本
        $hash = ($hash << $seed) + ord($s{$i});  //TODO php5.6.0以下，可以使用这个方法，测试效果不错
    }
    return $hash & 0x7FFFFFFF;
}

class ConsistentHash {
    // server列表
    private $_server_list = array();
    // 延迟排序，因为可能会执行多次addServer
    private $_layze_sorted = FALSE;
    public $count = array();

    // 添加服务器
    public function addServer($server) {
        $hash = myHash($server);
        $this->_layze_sorted = FALSE;
        if(!in_array($hash, $this->_server_list)) {
            $this->_server_list[$hash] = $server;
        }
        return $this;
    }

    // 查找服务器
    public function find($key) {
        // 有无服务器
        $len = count($this->_server_list);
        if($len == 0) {
            return FALSE;
        }

        // 服务器排序(升序)
        if(!$this->_layze_sorted) {
            ksort($this->_server_list);
            $this->_layze_sorted = TRUE;
        }

        $hash = myHash($key);

        $keys = array_keys($this->_server_list);
        $values = array_values($this->_server_list);

        // 如果不在区间内，则返回最后一个server（顺时针查找）
        if($hash <= $keys[0] || $hash >= $keys[$len - 1]) {
            if(isset($this->count[$values[$len - 1]])) {
                $this->count[$values[$len - 1]]++;
            } else {
                $this->count[$values[$len - 1]] = 1;
            }
            return $values[$len - 1];
        }

        // 遍历区间，查找key所在区间，找到则返回左边界
        foreach($keys as $k => $pos) {
//            $next_pos = NULL;
//            if(isset($keys[$k + 1])) {
            $next_pos = $keys[$k + 1];
//            }
//            if(is_null($next_pos)) {
//                return $values[$k];
//            }
            // 区间判断(区间内，返回左边界，因为是顺时针查找（从大到小）)
            if($hash >= $pos && $hash <= $next_pos) {
                if(isset($this->count[$values[$k]])) {
                    $this->count[$values[$k]]++;
                } else {
                    $this->count[$values[$k]] = 1;
                }
                return $values[$k];
            }
        }
    }
    // 删除服务器
}

$consisHash = new ConsistentHash();
$consisHash->addServer("192.168.0.1#1")->addServer("192.168.0.112#2")->addServer("192.168.0.21#3")->addServer("192.168.0.31#4")->addServer("192.168.0.31#5");
for($i = 1; $i <= 11133; $i++) {
    $consisHash->find("key{$i}");
//    echo "key{$i} at " . $consisHash->find("key{$i}") . ".\n";
}
print_r($consisHash->count);
