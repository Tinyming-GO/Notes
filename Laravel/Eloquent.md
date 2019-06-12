# 定义模型

`php artisan make:model Flight` // 创建Flight模型

// 生成模型时同时生成数据库迁移

```
php artisan make:model Flight --migration
php artisan make:model Flight -m
```

# Eloquent 模型约定

- `protected $table = 'my_flights';` //表名
- `protected $primaryKey = 'uid';` //主键名（默认`id`）
- - `protected $incrementing = false;` //主键自增（默认true）
- - `protected $keyType = 'string';` //主键类型（默认int）
- `public $timestamps = false;` //时间戳（默认true，会自动生成两个字段`created_at` 和 `updated_at`）
- - `protected $dateFormat = 'U';` //自定义时间戳格式
- - `const CREATED_AT = 'creation_date';` //自定义`created_at`字段名称
- - `const UPDATED_AT = 'last_update';` //自定义`updated_at`字段名称
- `protected $connection = 'connection-name';` //为模型指定不同的连接
- 默认字段和默认值
```php
protected $attributes = [
   'delayed' => false,
];
```

# 获取模型（查）

- `$flights = App\Flight::all();` // 返回表的所有结果

- 添加约束(所有约束：https://laravelacademy.org/post/19521.html)

```php
$flights = App\Flight::where('active', 1)
               ->orderBy('name', 'desc')
               ->take(10)
               ->get();
```

- 刷新模型（重新获取）

```php
$flight = App\Flight::where('number', 'FR 900')->first();
$flight->number = 'FR 456';
$flight->refresh();
$flight->number; // "FR 900"
```

- 集合

对 Eloquent 中获取多个结果的方法（比如 `all` 和 `get`）而言，其返回值是 `Illuminate\Database\Eloquent\Collection` 的一个实例，`Collection` 类提供了多个有用的函数来处理。（集合处理函数大全：https://laravelacademy.org/post/9566.html）

- 组块结果集（大数据量）

`chunk` 方法会获取一个指定数量的 Eloquent 模型“组块”，并将其填充到给定闭包进行处理。使用 `chunk` 方法在处理大量数据集合时能够有效减少内存消耗

```php
//每次取200条数据
Flight::chunk(200, function ($flights) {
    foreach ($flights as $flight) {
        //
    }
});
```

- 使用游标

`cursor` 方法允许你使用游标迭代处理数据库记录，一次只执行单个查询，在处理大批量数据时，`cursor` 方法可大幅减少内存消耗

```php
foreach (Flight::where('foo', 'bar')->cursor() as $flight) {
    //
}
```

- 获取单个模型/聚合结果

可以使用 `find` 和 `first` 获取单个记录。这些方法返回单个模型实例而不是模型集合。

```php
// 通过主键获取模型...
$flight = App\Flight::find(1);
// 获取匹配查询条件的第一个模型...
$flight = App\Flight::where('active', 1)->first();
```

还可以通过传递主键数组来调用 find 方法，这将会返回匹配记录集合：`$flights = App\Flight::find([1, 2, 3]);`

- Not Found 异常

`findOrFail` 和 `firstOrFail` 方法会获取查询到的第一个结果。不过，如果没有任何查询结果，`Illuminate\Database\Eloquent\ModelNotFoundException` 异常将会被抛出：

```php
$model = App\Flight::findOrFail(1);
$model = App\Flight::where('legs', '>', 100)->firstOrFail();
```

如果异常没有被捕获，那么 HTTP 404 响应将会被发送给用户。

- 获取聚合结果

当然，你还可以使用查询构建器提供的聚合方法，例如 `count`、`sum`、`max`，以及其它查询构建器提供的聚合函数。这些方法返回计算后的结果而不是整个模型实例：

```php
$count = App\Flight::where('active', 1)->count();
$max = App\Flight::where('active', 1)->max('price');
```

# 插入/更新模型

- 插入

```php
$flight = new Flight;
$flight->name = $request->name;
$flight->save();
```

- 更新

```php
$flight = App\Flight::find(1);
$flight->name = 'New Flight Name';
$flight->save();
```

- 批量更新

```php
App\Flight::where('active', 1)
      ->where('destination', 'San Diego')
      ->update(['delayed' => 1]); //update方法要求以数组形式传递键值对参数，代表着数据表中应该被更新的列。
```

- 批量赋值

```php
<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Flight extends Model
{
    /**
     * 可以被批量赋值的属性.
     *
     * @var array
     */
    protected $fillable = ['name'];

    /**
     * 不能被批量赋值的属性
     *
     * @var array
     */
    protected $guarded = ['price'];
}
//使用 create 方法在数据库中插入一条新的记录。create 方法返回保存后的模型实例。
$flight = App\Flight::create(['name' => 'Flight 10']);
//已经有了一个模型实例，可以使用 fill 方法通过数组属性来填充
$flight->fill(['name' => 'Flight 22']);
```

如果你想要让所有属性都是可批量赋值的，可以将 $guarded 属性设置为空数组：

`protected $guarded = [];`