puppet-hostname
===========

[![Puppet Forge](https://img.shields.io/puppetforge/v/halyard/hostname.svg)](https://forge.puppetlabs.com/halyard/hostname)
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

