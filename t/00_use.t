use Test::More tests => 4;
$^W = 1;

use_ok 'Email::FolderType::Register', 'register_type';
use_ok 'Email::FolderType::Local';
use_ok 'Email::FolderType', 'folder_type';

can_ok __PACKAGE__, 'folder_type', 'register_type';
