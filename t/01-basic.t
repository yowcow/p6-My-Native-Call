use v6;
use lib 'lib';
use My::Native::Call;
use Test;

use-ok 'My::Native::Call';

is calc_double(1), 2;
is calc_double(2), 4;
is calc_double(15), 30;

done-testing;
