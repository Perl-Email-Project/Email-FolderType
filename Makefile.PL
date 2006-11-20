use strict;
use warnings;
use ExtUtils::MakeMaker;
WriteMakefile(
  NAME         => 'Email::FolderType',
  VERSION_FROM => 'lib/Email/FolderType.pm',
  (eval { ExtUtils::MakeMaker->VERSION(6.21) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM => {
    'Module::Pluggable' => '0',
    'Test::More' => '0'
  },
  INSTALLDIRS => 'site',
  PL_FILES => {}
);
