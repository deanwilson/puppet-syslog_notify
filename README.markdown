# Puppet SyslogNotify Type #

Send `notify` messages directly to a remote syslog server without
writing to the local logs.

## Examples ##

Send a message to the syslog server running on `loghost.example.com`

    syslog_notify { "Job ran on ${::fqdn}":
      server => 'loghost.example.com',
    }

Send to syslog on a non-standard port

    syslog_notify { "Job ran on ${::fqdn}":
      server => 'loghost.example.com',
      port   => 1024, # defaults to 514
    }

## Requirements ##

Requires the remote_syslog_logger gem.

     gem install remote_syslog_logger

     # gem source
     https://github.com/papertrail/remote_syslog_logger

### License ###

Apache 2.0 - [Dean Wilson](http://www.unixdaemon.net)
