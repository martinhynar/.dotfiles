# PATHS
echo "ES PLUGIN"
# ALIASES
alias ,es_disk_usage_per_node="curl -s -XGET \"http://${ESHOST}:${ESPORT}/_cat/nodes?v&h=disk.avail,name\" | sort"
