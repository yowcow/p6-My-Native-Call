use v6;
use My::Native::Call;
use Test;

use-ok 'My::Native::Call';

subtest {
    is calc-double-int(1), 2;
    is calc-double-int(2), 4;
    is calc-double-int(15), 30;
}, 'Test type int32';

subtest {
    is calc-double-float(1.0.Num), 2.0;
    is calc-double-float(2.5.Num), 5.0;
    is calc-double-float(5.0.Num), 10.0;
}, 'Test type float';

done-testing;
