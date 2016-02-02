use v6;
use LibraryMake;
use NativeCall;

unit class My::Native::Call;

sub library {
    state $so;
    if !$so { $so = get-vars('')<SO> }
    ~(%?RESOURCES{"libfoo$so"});
}

our sub calc_double(int32 --> int32)
    is native(&library)
    is symbol('calc_double_int')
    is export { * }

=begin pod

=head1 NAME

My::Native::Call - blah blah blah

=head1 SYNOPSIS

  use My::Native::Call;

=head1 DESCRIPTION

My::Native::Call is ...

=head1 AUTHOR

yowcow <yowcow@cpan.org>

=head1 COPYRIGHT AND LICENSE

Copyright 2016 yowcow

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
