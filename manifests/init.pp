class hostname (
  $hostname,
) {

  exec { 'set computername':
    command => "sudo /usr/sbin/scutil --set ComputerName ${hostname}",
    unless  => "test `scutil --get ComputerName` == '${hostname}'",
    require => Sudoers::Allowed_Command['hostname_scutil']
  }

  exec { 'set hostname':
    command => "sudo /usr/sbin/scutil --set HostName ${hostname}",
    unless  => "test `scutil --get HostName` == '${hostname}'",
    require => Sudoers::Allowed_Command['hostname_scutil']
  }

  exec { 'set localhostname':
    command => "sudo /usr/sbin/scutil --set LocalHostName ${hostname}",
    unless  => "test `scutil --get LocalHostName` == '${hostname}'",
    require => Sudoers::Allowed_Command['hostname_scutil']
  }

  boxen::osx_defaults { 'set netbiosname':
    user   => $::boxen_user,
    key    => 'NetBIOSName',
    domain => 'com.apple.smb.server',
    type   => 'string',
    value  => $hostname
  }

  sudoers::allowed_command{ 'hostname_scutil':
    command          => '/usr/sbin/scutil',
    user             => $::boxen_user,
    require_password => false,
    comment          => 'Allow boxen user to control scutil',
    require_exist    => false
  }
}
