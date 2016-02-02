use v6;
use LibraryMake;
use NativeCall;

unit class My::Native::Call;

sub library {
    state $so;
    if !$so { $so = get-vars('')<SO> }
    ~(%?RESOURCES{"libfoo$so"});
}

sub calc-double-int(int32 --> int32)
    is native(&library)
    is symbol('calc_double_int')
    is export
    { * }

sub calc-double-float(num32 --> num32)
    is native(&library)
    is symbol('calc_double_float')
    is export
    { * }
