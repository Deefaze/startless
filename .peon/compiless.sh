_src="$(dirname $0)/src/scss/main.less"
_tgt="$(dirname $0)/src/css/styles.css"

eCapt "Compiler"
lessc -v
eDesc "Source" $_src
eDesc "Target" $_tgt

eLN
eWait "Lint..."
lessc -l $_src

eLN
eWait "Compile..."
lessc -x -su=on $_src $_tgt