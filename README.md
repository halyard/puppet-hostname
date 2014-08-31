puppet-hostname
===========

Module to set hostname for OSX

## Usage

In your hiera config:

```
hostname::hostname: foo
hostname::domain: example.com
```

```puppet
include hostname
```

## Required Puppet Modules

* `boxen`
* `sudo`

