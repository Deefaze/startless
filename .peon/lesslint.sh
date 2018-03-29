_src="$(dirname $0)/src/scss/$2"

eCapt "Compiler"
lessc -v

eLN
eWait "Lint : $_src ..."
lessc -l $_src
