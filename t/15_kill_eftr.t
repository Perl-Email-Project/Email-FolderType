use Test::More tests => 4;

use Email::FolderType::Register qw[register_type];

ok ! eval "register_type", $@;
ok ! eval "register_type 'foo'", $@;
ok ! eval "register_type 'foo', 'bar'", $@;
ok ! eval "register_type 'foo', sub {}, 'bar'", $@;
