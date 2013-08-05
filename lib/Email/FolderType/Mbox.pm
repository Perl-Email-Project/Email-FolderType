use strict;
use warnings;
package Email::FolderType::Mbox;
# ABSTRACT: class to help Email::FolderType recognise MH mail directories

# since Mbox is the default always return 1

sub match { 1 }

1;
