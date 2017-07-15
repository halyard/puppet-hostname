##
# Definitions for Macs
class hostname::darwin {
  $local_hostname = $hostname::hostname
  $local_domain = $hostname::domain

  exec { 'set computername':
    command => "sudo /usr/sbin/scutil --set ComputerName ${local_hostname}",
    unless  => "test `scutil --get ComputerName` == '${local_hostname}'",
    require => Sudoers::Allowed_Command['hostname_scutil']
  }

  exec { 'set hostname':
    command => "sudo /usr/sbin/scutil --set HostName ${local_hostname}",
    unless  => "test `scutil --get HostName` == '${local_hostname}'",
    require => Sudoers::Allowed_Command['hostname_scutil']
  }

  exec { 'set localhostname':
    command => "sudo /usr/sbin/scutil --set LocalHostName ${local_hostname}",
    unless  => "test `scutil --get LocalHostName` == '${local_hostname}'",
    require => Sudoers::Allowed_Command['hostname_scutil']
  }

  sudoers::allowed_command{ 'hostname_scutil':
    command          => '/usr/sbin/scutil',
    user             => $::id,
    require_password => false,
    comment          => 'Allow boxen user to control scutil',
    require_exist    => false
  }
}
