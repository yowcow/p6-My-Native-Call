use v6;
use My::Native::Node;
use Test;

subtest {
    my My::Native::Node $n .= new(
        key   => 'あいうえ1',
        value => 'かきくけ1',
    );

    subtest {
        is $n.key,   'あいうえ1', 'n->key == あいうえ1';
        is $n.value, 'かきくけ1', 'n->value == かきくけ1';
        ok not $n.next.defined;
    }, 'Initial state after new';

    my My::Native::Node $n2 = $n.append(
        key   => 'ああああ2',
        value => 'いいいい2',
    );
    my My::Native::Node $n3 = $n2.append(
        key   => 'うううう3',
        value => 'ええええ3',
    );

    subtest {
        is $n3.key,     'うううう3';
        is $n3.value,   'ええええ3';
        ok not $n3.next.defined;
    }, '3rd node';

    subtest {
        is $n2.key,     'ああああ2';
        is $n2.value,   'いいいい2';
        ok $n2.next.defined;
    }, '2nd node';

    subtest {
        is $n.key,      'あいうえ1';
        is $n.value,    'かきくけ1';
        ok $n.next.defined;
    }, '1st node';

    subtest {
        is $n.key,           'あいうえ1';
        is $n.next.key,      'ああああ2';
        is $n.next.next.key, 'うううう3';
    }, 'Node chain';

    subtest {
        dies-ok { $n.append(key => 'hoge', value => 'fuga') };
    }, 'Appending fails if next node exists';

    $n.destroy();

}, 'Test create-append-destroy';

done-testing;
