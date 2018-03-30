declare -x PATH_BASE="$(dirname $0)"
declare -x PATH_ROOT="$PATH_BASE/.peon"
declare -x PATH_INCLUDES="$PATH_ROOT/includes"
declare -x PATH_TOOLS="$PATH_ROOT/tools"

declare -ir VER_MAX_MINOR=99
declare -ir VER_MAX_BUILD=99

declare -ix PEON_VER_MAJOR=0
declare -ix PEON_VER_MINOR=0
declare -ix PEON_VER_BUILD=1
declare -x PEON_VER_FILE="$PATH_ROOT/version.json"

declare -ix PROJECT_VER_MAJOR=0
declare -ix PROJECT_VER_MINOR=0
declare -ix PROJECT_VER_BUILD=1
declare -x PROJECT_VER_FILE="$PATH_BASE/version.json"

declare -x E_RZ="\e[0m"
declare -x E_LN="\n"
declare -x E_ROWH=" # -------------------------------------------------------------------------- # "
declare -x E_ROWW=" >                                                                              "
declare -x E_ROWE=" !                                                                              "
declare -x E_RETS="\e[77D"
declare -x E_HEAD="\e[37;44m"
declare -x E_WAIT="\e[37;45m"
declare -x E_EROR="\e[37;41m"
declare -x E_INFO="\e[34m"
declare -x E_CAPT="\e[33m"