use Test::More tests => 7;

use Email::FolderType qw[folder_type];

my $BOXES = "t/boxes";

is folder_type("$BOXES/mbox"), "Mbox", "mbox";
is folder_type("mbox"), "Mbox", "mbox";

is folder_type("maildir/"), "Maildir", 'maildir';
is folder_type("$BOXES/maildir"), "Maildir", 'maildir';

is folder_type("ezmlm//"), "Ezmlm", 'ezmlm';
is folder_type("$BOXES/ezmlm"), 'Ezmlm', 'ezmlm';

is folder_type("mh/."), 'MH', 'mh';

