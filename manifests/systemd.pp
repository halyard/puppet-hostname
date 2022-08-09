##
# Definitions for systemd
#
# @param [String] local_hostname
#   short hostname for system
# @param [String] local_domain
#   domain to use to create FQDN
# @param [Boolean] use_v6
#   should this module add a line for IPv6?

#
class hostname::systemd (
  Boolean $use_v6,
  String $local_hostname,
  Optional[String] $local_domain,
) {
  exec { 'set hostname':
    command => "hostnamectl set-hostname ${local_hostname}",
    path    => ['/usr/bin', '/bin'],
    unless  => "test `hostnamectl --static` == '${local_hostname}'",
  }

  file { '/etc/hosts':
    ensure  => file,
    content => epp('hostname/etc_hosts.epp', {
        local_hostname => $local_hostname,
        local_domain   => $local_domain,
        use_v6         => $use_v6,
    }),
  }
}
