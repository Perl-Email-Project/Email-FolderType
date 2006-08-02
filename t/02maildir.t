use Test::More tests => 3;

use_ok('Email::FolderType',qw(folder_type));

is(folder_type('t/testmaildir/'), 'Maildir');
is(folder_type('t/testmaildir'), 'Maildir');
