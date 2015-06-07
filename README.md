puppet-hostname
===========

Module to set hostname for OSX

## Usage

In your hiera config:

```
hostname::hostname: foo
```

```puppet
include hostname
```

## Required Puppet Modules

* [boxen](https://github.com/halyard/puppet-boxen)
* [sudoers](https://github.com/halyard/puppet-sudoers)

