use v6;
use LibraryMake;
use Shell::Command;

my $destdir = 'resources';
my %vars = get-vars($destdir);

process-makefile('.', %vars);

mkpath $destdir;

say "Configure completed! You can now run '%vars<MAKE>' to build libfoo.";
