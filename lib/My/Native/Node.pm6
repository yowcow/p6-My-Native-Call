use v6;
use LibraryMake;
use NativeCall;

unit class My::Native::Node is repr('CStruct');

has Pointer[Str] $.key;
has Pointer[Str] $.value;
has My::Native::Node $.next;

my sub library {
    state $so;
    if !$so { $so = get-vars('')<SO> }
    ~(%?RESOURCES{"libnode$so"});
}

my sub create(Str, Str --> ::?CLASS)
    is native(&library)
    is symbol('node_create') { * }

my sub append(::?CLASS, Str, Str --> ::?CLASS)
    is native(&library)
    is symbol('node_append') { * }

my sub destroy(::?CLASS)
    is native(&library)
    is symbol('node_destroy') { * }

method new(::?CLASS:U: Str:D :$key, Str:D :$value --> ::?CLASS) {
    create($key, $value);
}

method append(::?CLASS:D: Str:D :$key, Str:D :$value --> ::?CLASS) {
    die "Next node already exists (key: {self.key})" if self.next.defined;
    append(self, $key, $value);
}

method destroy(::?CLASS:D:) {
    self.next.destroy() if self.next.defined;
    destroy(self);
}

method key(::?CLASS:D: --> Str) { $!key.deref }
method value(::?CLASS:D: --> Str) { $!value.deref }
