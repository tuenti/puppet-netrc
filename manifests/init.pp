# Class: puppet-netrc
#
# This module manages puppet-netrc
#
# Parameters: $user is the useraccount on the machine for which the netrc shall be configured, 
#				$machine_user_password_triples is an array of arrays containing three string params: machine, user, password
#				$root_home_directory (optional) is the directory where all user homes are located on the target machine, default value is "/home" 
#
# Actions:
#
# Requires:
#
# Sample Usage: netrc::foruser("netrc_myuser": user => 'myuser', machine_user_password_triples => [['myserver.localdomain','myuser','pw'],['mysecondserver.localdomain','myuser','pw2']])
#               you can also override the path using the `file_path` parameter.
# [Remember: No empty lines between comments and class definition]
class netrc {

}

define netrc::foruser(
  Enum["present", "absent"] $ensure = "present",
  $home_base_directory              = "/home",
  $user,
  $filename                         = ".netrc",
  $file_path                        = "$home_base_directory/$user/$filename",
  $machine_user_password_triples) {


  file { "$file_path":
    ensure  => $ensure,
    content => template('netrc/netrc.erb'),
    mode    => '0600',
    owner   => "$user"
  }
}
