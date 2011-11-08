Puppet::Type.newtype(:syslog_notify) do
  require 'rubygems'
  require 'remote_syslog_logger'

  @doc = 'Sends an arbitrary message to a remote syslog server

   syslog_notify { "Job ran on $fqdn":
     server => "loghost.example.com"
   }

   syslog_notify { "Job ran on $fqdn":
     server => "loghost.example.com",
     port   => 1024, # defaults to 514
   }

   Requires the remote_syslog_logger gem from gem or
   https://github.com/papertrail/remote_syslog_logger
   '

  newproperty(:message) do
    desc "The message to be sent to the remote syslog server."

    def sync
      RemoteSyslogLogger.new( @resource["server"], @resource["port"] ).info( @resource["message"] )
    end

    def retrieve
      :absent
    end

    def insync?(is)
      false
    end

    defaultto { @resource[:name] }
  end

  newparam(:server) do
    desc "The hostname or ip address of the remote syslog server to send to"
  end

  newparam(:port) do
     desc "The port the remote syslog server is listening to."
     defaultto { 514 }
  end

  newparam(:name) do
    desc "An arbitrary tag for your own reference; the name of the message."
    isnamevar
  end

end
