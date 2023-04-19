#!/bin/ash
set -eo pipefail

        

# logging functions
mysql_log() {
	local type="$1"; shift
	# accept argument string or stdin
	local text="$*"; if [ "$#" -eq 0 ]; then text="$(cat)"; fi
	local dt; dt="$(date)"
	printf '%s [%s] [Entrypoint]: %s\n' "$dt" "$type" "$text"
}
mysql_note() {
	mysql_log Note "$@"
}
mysql_warn() {
	mysql_log Warn "$@" >&2
}
mysql_error() {
	mysql_log ERROR "$@" >&2
	exit 1
}







docker_verify_minimum_env() {

	if [[ -z "$MYSQL_PASSWORD" &&  -z "$MYSQL_USER" ]]; then
		mysql_error <<-'EOF'
			Application can't init - 
			    You need to specify the following as an environment variable:
			    - MYSQL_ROOT_PASSWORD
			    - MYSQL_USER
		EOF
    else
		mysql_note <<-'EOF'
			All Variables are fine -
            Running application.
		EOF
        exec $APPCMD 

	fi  
    

}


_main() {
    #Checking if minimal env variable provided
    APPCMD="$@"
    
    docker_verify_minimum_env
}


_main "$@"
