*metadata:yaml*: Generate metadata in the yaml format.

Example
-------

Generate yaml for the "waitfor" module:

    rerun metadata:yaml waitfor > /tmp/waitfor.yaml
    
The produced yaml:

    waitfor:
      description: "utility commands that wait for a condition."
      shell: "bash"
      version: 1.0.0
      requires: 
      externals: 
      license: 
      commands:
        ping:
          description: "wait for ping response from host"
          options:
            host:
              description: "the host to reach"
              arguments: true
              required: true
              short: 
              long: host
              default: ""
              export: false
            interval:
              description: "seconds between checks"
              arguments: true
              required: false
              short: 
              long: interval
              default: 30
              export: false
