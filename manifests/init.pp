class hostname(
  $hostname = $hostname,
) {

  exec { 'set computername':
    command => "sudo /usr/sbin/scutil --set ComputerName ${hostname}",
    unless  => "test `scutil --get ComputerName` == '${hostname}'",
    require => Sudoers['scutil_sudoers']
  }

  exec { 'set hostname':
    command => "sudo /usr/sbin/scutil --set HostName ${hostname}",
    unless  => "test `scutil --get HostName` == '${hostname}'",
    require => Sudoers['scutil_sudoers']
  }

  exec { 'set localhostname':
    command => "sudo /usr/sbin/scutil --set LocalHostName ${hostname}",
    unless  => "test `scutil --get LocalHostName` == '${hostname}'",
    require => Sudoers['scutil_sudoers']
  }

  exec { 'set computername':
    command => "sudo /usr/sbin/scutil --set ComputerName ${hostname}",
    unless  => "test `scutil --get ComputerName` == '${hostname}'",
    require => Sudoers['scutil_sudoers']
  }

  boxen::osx_defaults { 'set netbiosname':
    user   => $::boxen_user,
    key    => 'NetBIOSName',
    domain => 'com.apple.smb.server',
    value  => $hostname
  }

  sudoers { 'scutil_sudoers':
    users       => $::boxen_user,
    hosts       => 'ALL',
    commands    => [
      '(ALL) NOPASSWD: /usr/sbin/scutil',
    ],
    type        => 'user_spec',
  }
}
