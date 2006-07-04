use Test::More qw[no_plan];

use Email::FolderType::Register qw[register_type];
use Email::FolderType qw[folder_type];

my @names = map $_->{name}, @Email::FolderType::REGISTER;
my @expected_names = qw[Ezmlm Maildir MH Maildir Ezmlm Mbox];

ok eq_set( \@names, \@expected_names ), 'local types match in registery';

register_type TestType => sub { undef };

@names = map $_->{name}, @Email::FolderType::REGISTER;
unshift @expected_names, 'TestType';

ok eq_set( \@names, \@expected_names ), 'local types match in registery after mod';

@Email::FolderType::REGISTER = grep { $_->{name} ne 'Mbox' } @Email::FolderType::REGISTER;

is folder_type("foo"), undef, 'caught undef return';
