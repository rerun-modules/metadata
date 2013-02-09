#!/usr/bin/env roundup
#
#/ usage:  rerun stubbs:test -m rerun-metadata -p yaml [--answers <>]
#

# Helpers
# -------
[[ -f ./functions.sh ]] && . ./functions.sh

# The Plan
# --------
describe "yaml"

# ------------------------------
# Generate metadata into yaml and validate output.
it_generates_yaml_for_module() {
    OUT=$(mktemp /tmp/stubbs.yaml.XXXX)
    rerun rerun-metadata:yaml stubbs > $OUT
 
   # If python and PyYAML are available, parse the file and print some metadata.
    if command -v python && python -c 'import yaml; ' 
    then
        script=$(mktemp /tmp/validate.sh.XXXX)
        cat >$script<<EOF
#!/usr/bin/env python
import yaml
stream = open("$OUT", 'r')
data = yaml.load(stream)
print data["stubbs"]["description"]
print data["stubbs"]["version"]
print data["stubbs"]["commands"]["add-module"]["options"]["module"]
print data["stubbs"]["commands"]["add-command"]["options"]["module"]
print data["stubbs"]["commands"]["add-option"]["options"]["module"]
EOF
        chmod +x $script
        $script 
        return $?
    else
        # Otherwise use this crappy rudimentary check. 
        test "stubbs:" = "$(head -1 $OUT)"
    fi
    rm $OUT
}
# ------------------------------

