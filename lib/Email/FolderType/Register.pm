package Email::FolderType::Register;
# $Id: Register.pm,v 1.1 2004/11/02 18:15:26 cwest Exp $
use strict;

use vars qw[$VERSION @REGISTER @EXPORT_OK];
$VERSION   = (qw$Revision: 1.1 $)[1];
@EXPORT_OK = qw[register_type];
*REGISTER  = \@Email::FolderType::REGISTER;

use base qw[Exporter];

=head1 NAME

Email::FolderType::Register - handles type registration for Email::FolderType

=head1 SYNOPSIS

  use Email::FolderType::Register qw[register_type];
  
  register_type Ezmlm => sub { $_[0] =~ m!//$! };

=head1 DESCRIPTION

Provides the mechanism for registering folder types for L<Email::FolderType|Email::FolderType>.

=head2 C<register_type($name, $test)>

Registers the folder type C<$name> with a test, C<$test>. Both
parameters are required. The first parameter is a plain text name for a
mail folder type. The second argument is a subroutine reference that's
run as a test. If a test is successful - returning true -
C<Email::FolderType>'s C<folder_type()> function will return the
corrisponding folder type name. If a test fails - returning false - the
mail folder name is ignored.

It is suggested to register folder names as something that could be used
in a Perl package name, for example, alpha-numeric names.

When a type is registered it is C<unshift()>ed onto the top of the list of types
to be tested.

=cut

sub register_type($&;) {
    my ($name, $test) = @_;
    unshift @REGISTER, {
        name => $name,
        test => $test,
    };
    return 1;
}

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
