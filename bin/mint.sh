#!/bin/bash

# Arguments: royalties jsoncid imagecid tag1,tag2 => encoded in HEX 
# https://www.online-toolz.com/tools/text-hex-convertor.php
# + add 0x before

# update me each time you have re-deployed
SC_ADDRESS="erd1qqqqqqqqqqqqqpgquz2us4s08agkmv9mr3w8xyqs09tam5gkjg9q7tn7cf"

OWNER_PEM="wallets/owner/owner.pem"
HEIDI_PEM="wallets/users/heidi.pem"

erdpy --verbose \
    contract call ${SC_ADDRESS} \
    --recall-nonce \
    --pem=${HEIDI_PEM} \
    --gas-limit=100000000 \
    --value=10000000000000000 \
    --function="mint" \
    --send \
    --proxy="https://devnet-gateway.elrond.com" \
    --chain="D"
