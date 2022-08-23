puppet-hostname
===========

[![Puppet Forge](https://img.shields.io/puppetforge/v/halyard/hostname.svg)](https://forge.puppetlabs.com/halyard/hostname)
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/halyard/puppet-hostname/Build)](https://github.com/halyard/puppet-hostname/actions)
[![MIT Licensed](http://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://tldrlegal.com/license/mit-license)

Module to set hostname and /etc/hosts

## Usage

In your hiera config:

```
hostname::hostname: foo
hostname::domain: example.com
```

```puppet
include hostname
```

## License

hostname is released under the MIT License. See the bundled LICENSE file for details.

