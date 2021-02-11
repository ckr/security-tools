
metasploit()
{
	CURPATH="${PWD}"
	SCRIPTPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
	cd $SCRIPTPATH/metasploit
	docker-compose run --rm --service-ports -e MSF_UID=$(id -u) -e MSF_GID=$(id -g) ms ./msfconsole -r docker/msfconsole.rc "$@"
	cd $CURPATH
}

msfconsole1()
{
	if [[ -z "$MSF_PATH" ]]; then
	path=`dirname $0`

	# check for ./msfconsole.rc
	if [[ ! -f $path/msfconsole.rc ]] ; then

		# we are not inside the project
		realpath --version > /dev/null 2>&1 || { echo >&2 "I couldn't find where metasploit is. Set \$MSF_PATH or execute this from the project root"; exit 1 ;}

		# determine script path
		pushd $(dirname $(realpath $0)) > /dev/null
		path=$(pwd)
		popd > /dev/null
	fi
	MSF_PATH=$(dirname $(dirname $path))
	fi

	cd $MSF_PATH

	PARAMS="$@"

	# if [[ $PARAMS == *"--rebuild"* ]]; then
	# echo "Rebuilding image"
	# docker-compose build
	# exit $?
	# fi

	docker-compose run --rm --service-ports -e MSF_UID=$(id -u) -e MSF_GID=$(id -g) ms ./msfconsole -r docker/msfconsole.rc "$PARAMS"
}

msfvenom1()
{
	if [[ -z "$MSF_PATH" ]]; then
	path=`dirname $0`

	# check for ./docker/msfconsole.rc
	if [[ ! -f $path/../msfconsole.rc ]] ; then

		# we are not inside the project
		realpath --version > /dev/null 2>&1 || { echo >&2 "I couldn't find where metasploit is. Set \$MSF_PATH or execute this from the project root"; exit 1 ;}

		# determine script path
		pushd $(dirname $(realpath $0)) > /dev/null
		path=$(pwd)
		popd > /dev/null
	fi
	MSF_PATH=$(dirname $(dirname $path))
	fi

	cd $MSF_PATH

	PARAMS="$@"

	if [[ $PARAMS == *"--rebuild"* ]]; then
	echo "Rebuilding image"
	docker-compose build
	exit $?
	fi

	# we need no database here
	docker-compose run --rm --no-deps ms ./msfvenom "$PARAMS"
}