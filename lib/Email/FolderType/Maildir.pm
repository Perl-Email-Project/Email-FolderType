use strict;
use warnings;
package Email::FolderType::Maildir;
# ABSTRACT: class to help Email::FolderType recognise maildirs

sub match {
  my $folder = shift;
  return ($folder =~ m{[^/]/$} || -d "$folder/cur");
}

1;
