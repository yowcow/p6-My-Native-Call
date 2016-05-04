use v6;
use My::Native::Item;
use Test;

subtest {
    my My::Native::Item $item .= new(
        id   => 1234,
        name => 'あいうえお',
    );

    is $item.id,   1234,         'item->id == 1234';
    is $item.name, 'あいうえお', 'item->name == あいうえお';

    lives-ok { $item.destroy };

}, 'Test new/destroy';

done-testing;
