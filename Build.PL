use strict;
use Module::Build;

Module::Build
  ->new( module_name => "Email::FolderType",
         license     => 'perl',
         requires    => {
			 'Module::Pluggable' => 0,
             'Test::More'        => 0,
         },
         create_makefile_pl => 'traditional',
        )
  ->create_build_script;
