puppet-hostname
===========

[![Puppet Forge](https://img.shields.io/puppetforge/v/halyard/hostname.svg)](https://forge.puppetlabs.com/halyard/hostname)
[![Dependency Status](https://img.shields.io/gemnasium/halyard/puppet-hostname.svg)](https://gemnasium.com/halyard/puppet-hostname)
[![MIT Licensed](http://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://tldrlegal.com/license/mit-license)
[![Build Status](https://img.shields.io/circleci/project/halyard/puppet-hostname/master.svg)](https://circleci.com/gh/halyard/puppet-hostname)

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

