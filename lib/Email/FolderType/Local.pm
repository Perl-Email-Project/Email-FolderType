package Email::FolderType::Local;
# $Id: Local.pm,v 1.1 2004/11/02 18:15:26 cwest Exp $
use strict;

use vars qw[$VERSION];
$VERSION = (qw$Revision: 1.1 $)[1];

use Email::FolderType::Register qw[register_type];

=head1 NAME

Email::FolderType::Local - Recognize folder types on the local file system.

=head1 SYNOPSIS

  use Email::FolderType qw[folder_type];

  my $type = folder_type($folder) || 'unknown';
  print "$folder is type $type.\n";

=head2 DESCRIPTION

Registers several mail folder types that would be found on the local filesystem.

=head2 Mbox

  print 'Mbox' if folder_type('mboxmail') eq 'Mbox';

Returns this folder type for pretty much anything. Because of this, Mbox
is registered first so it will be the very last type tested.

=head2 Ezmlm

  print 'Ezmlm' if folder_type('mail//') eq 'Ezmlm';

Returns this folder type if the folder ends in C<//>, or if the folder
contains a directory named C<archive>.

=head2 Maildir

  print 'Maildir' if folder_type('mail/') eq 'Maildir';

Returns this folder type if the folder name ends in C</>, or if the
folder contains a directory named C<cur>.

=head2 MH

  print 'MH' if folder_type('mail/.') eq 'MH';

returns this folder type if the folder name ends in C</.>.

=cut

register_type Mbox    => sub { 'Mbox' };
register_type Ezmlm   => sub { -d join '/', shift, 'archive' };
register_type Maildir => sub { -d join '/', shift, 'cur' };
register_type MH      => sub { shift =~ m[/\.$] };
register_type Maildir => sub { shift =~ m[/$] };
register_type Ezmlm   => sub { shift =~ m[//$] };

1;

__END__

=head1 SEE ALSO

L<Email::FolderType>.

=head1 AUTHOR

Casey West <F<casey@geeknest.com>>.

=head1 COPYRIGHT

  Copyright (c) 2004 Casey West.  All rights reserved.
  This module is free software; you can redistribute it and/or modify it
  under the same terms as Perl itself.

=cut
