# @summary Set hostname and related settings
#
# @param hostname short hostname for system
# @param domain domain to use to create FQDN
#
class hostname (
  String $hostname,
  Optional[String] $domain = undef
) {
  case $facts['os']['family'] {
    'Darwin': { include hostname::darwin }
    'Archlinux': { include hostname::systemd }
    'Arch': { include hostname::systemd }
    'RedHat': { include hostname::systemd }
    default: { fail("Hostname module does not support ${facts['os']['family']}") }
  }
}
