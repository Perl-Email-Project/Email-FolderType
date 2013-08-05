use strict;
use warnings;
package Email::FolderType::Ezmlm;
# ABSTRACT: class to help Email::FolderType recognise ezmlm archives

sub match {
  my $folder = shift;
  return ($folder =~ m{//$}  || -d "$folder/archive");
}

1;
