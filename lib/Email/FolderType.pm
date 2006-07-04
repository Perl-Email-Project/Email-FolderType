package Email::FolderType;
# $Id: FolderType.pm,v 1.1 2004/11/02 18:15:26 cwest Exp $
use strict;

use vars qw[$VERSION @REGISTER @EXPORT_OK];
$VERSION   = '0.7';
@EXPORT_OK = qw[folder_type];

use base qw[Exporter];
use Email::FolderType::Local;

=head1 NAME

Email::FolderType - determine the type of a mail folder

=head1 SYNOPSIS

  use Email::FolderType qw[folder_type];

  print folder_type "~/mymbox";     # prints 'Mbox'
  print folder_type "~/a_maildir/"; # prints 'Maildir'
  print folder_type "some_mh/.";    # prints 'MH'
  print folder_type "an_archive//"; # prints 'Ezmlm'

=head1 DESCRIPTION

Provides a utility function for detecting the type of a given mail folder. Avaliable types
are subject to the types that are registered. Determination of a type is subject to the
return value of registered types. For more information on registered types please read
L<Email::FolderType::Register>. L<Email::FolderType::Local|Email::FolderType::Local> is
loaded by default.

Because local types are always loaded first, they'll be tested last, in
the reverse order they were registered. See
L<Email::FolderType::Register|Email::FolderType::Register> for more
details.

=head2 C<folder_type($folder)>

Automatically detects what type of mail folder is sent to it. Accepts one required
parameter.

This function will execute tests for each registered type and return the
short name of the mail box. These names may corrispond to Perl modules
in the C<Email::Folder::> namespace. For example, if Maildir is
identified, that corresponds to
L<Email::Folder::Maildir|Email::Folder::Maildir>.

If no type is identified, C<undef> is returned.

=cut

sub folder_type($;) {
    my $folder = shift;
    $_->{test}->($folder) and return $_->{name}
      for @REGISTER;
    return;
}

1;

__END__

=head1 AUTHOR

Casey West <casey@geeknest.com>, Simon Wistow <simon@thegestalt.org>.

=head1 COPYRIGHT

  (C) Copyright 2003, Simon Wistow
  (C) Copyright 2004, Casey West

Distributed under the same terms as Perl itself.

This software is under no warranty and will probably ruin your life,
kill your friends, burn your house and bring about the apocalypse.


=head1 SEE ALSO

L<Email::LocalDelivery>, L<Email::Folder>.

=cut
