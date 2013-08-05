use strict;
use warnings;
package Email::FolderType::MH;
# ABSTRACT: class to help Email::FolderType recognise MH mail directories

sub match { @_ || return 0; $_[0] =~ m{/\.$}  }

1;
