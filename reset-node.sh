DATA_DIR=$PWD/datadir
GENESIS_PATH=$PWD/genesis.json

yes | geth removedb --datadir $DATA_DIR
geth init $GENESIS_PATH --datadir $DATA_DIR 