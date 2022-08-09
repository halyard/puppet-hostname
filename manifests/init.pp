# @summary Set hostname and related settings
#
# @param [String] hostname
#   short hostname for system
# @param [Optional[String]] domain
#   domain to use to create FQDN
# @param [Boolean] use_v6
#   should this module add a line for IPv6?
#   Default value: true

#

#
class hostname (
  String $hostname,
  Boolean $use_v6 = true,
  Optional[String] $domain = undef,
) {
  case $facts['os']['family'] {
    'Darwin': {
      class { 'hostname::darwin':
        local_hostname => $hostname,
      }
    }
    'Archlinux', 'Arch', 'RedHat': {
      class { 'hostname::systemd':
        local_hostname => $hostname,
        use_v6         => $use_v6,
        local_domain   => $domain,
      }
    }
    default: { fail("Hostname module does not support ${facts['os']['family']}") }
  }
}
