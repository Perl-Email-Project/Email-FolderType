use ExtUtils::MakeMaker;

WriteMakefile (
               AUTHOR        => 'Casey West <casey@geeknest.com>',
               ABSTRACT      => "determine the type of a mail folder",
               NAME          => 'Email::FolderType',
               PREREQ_PM     => {
                                 'Test::More'            =>  '0.47',
                                },
               VERSION_FROM  => 'lib/Email/FolderType.pm',
              );
