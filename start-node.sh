DATA_DIR=$PWD/datadir
KEYSTORE_DIR=$DATA_DIR/keystore
# NAME:-novalex

account=$(
  geth account list --datadir $DATA_DIR  --keystore $KEYSTORE_DIR \
  2> /dev/null \
  | head -n 1 \
  | cut -d"{" -f 2 | cut -d"}" -f 1
)

echo "$account"

geth --datadir $DATA_DIR \
  --keystore $KEYSTORE_DIR \
  --networkid 8888 \
  --port 30303 \
  --rpc \
  --rpcapi 'db,eth,net,web3,admin,personal,miner' \
  --rpccorsdomain '*' \
  --rpcaddr 0.0.0.0 \
  --rpcport 8545 \
  --rpcvhosts '*' \
  --ws \
  --wsaddr 0.0.0.0 \
  --wsport 8546 \
  --wsorigins '*' \
  --mine \
  --minerthreads=1 \
  --unlock 0x$account \
  --etherbase=0x0000000000000000000000000000000000000000 \
  --allow-insecure-unlock \
  --targetgaslimit 420000000