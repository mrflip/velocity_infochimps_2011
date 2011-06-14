name        "spidermonkey_cluster"
description "Spidermonkey cluster project"

run_list(*%w[
])

#
# Attributes applied if the node doesn't have it set already.
# Override the active_users attribute in the role (gibbon_cluster, etc) if
# necessary
#
default_attributes({
    :java => {
      :install_flavor => 'sun'
    },
})
