use v6;
use LibraryMake;
use NativeCall;

unit class My::Native::Item is repr('CStruct');

has uint32       $.id;
has Pointer[Str] $.name;

my sub library {
    state $so;
    if !$so { $so = get-vars('')<SO> }
    ~(%?RESOURCES{"libitem$so"});
}

my sub create-item(uint32, Str --> ::?CLASS)
    is native(&library)
    is symbol('item_create') { * }

my sub destroy-item(::?CLASS)
    is native(&library)
    is symbol('item_destroy') { * }

method new(::?CLASS:U: Int:D :$id, Str:D :$name --> ::?CLASS) {
    create-item($id, $name);
}

method destroy(::?CLASS:D:) {
    destroy-item(self);
}

method name(::?CLASS:D: --> Str) {
    $!name.deref;
}
