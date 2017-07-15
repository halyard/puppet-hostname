# == Class: hostname
#
# Set the hostname on a Mac
#
# === Parameters
#  [*hostname*] Hostname to use
#
# === Example
#
#   class { 'hostname':
#     hostname => 'potato',
#     domain   => 'example.com'
#   }
#

class hostname (
  $hostname,
  $domain = undef
) {
  case $::osfamily {
    'Darwin': { include hostname::darwin }
    'Archlinux': { include hostname::systemd }
    default: { fail("Hostname module does not support ${::osfamily}") }
  }
}
