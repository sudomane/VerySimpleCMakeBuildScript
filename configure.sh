RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

function run() {
    # FIXME!
    echo "Not yet implemented!"
    return 1
}

function clean() {
    test -d out

    if [ $? = "0" ]
    then
        rm -rf out
    fi
}

function build() {
    test -d out

    if [ $? = "1" ]
    then
        mkdir out
    fi

    cd out
    cmake ..
    make

    if [ $? = "2" ]
    then
        printf "\n\n======== Build ${RED}[Failed]${NC} ========\n\n"
        return 1
    else
        printf "\n\n======== Build ${GREEN}[Successful]${NC} ========\n\n"
        cd ..
    fi

    return 0
}

function buildandrun() {
    build
    if [ $? = "0" ]
    then
        run
    fi
}

function help() {
    echo "e - build and run"
    echo "r - run executable"
    echo "c - clean"
    echo "b - build"
}

case $1 in
    "r")
        run;;
    "c")
        clean;;
    "b")
        build;;
    "e")
        buildandrun;;
    *)
        help;;
esac
