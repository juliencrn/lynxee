#!/bin/bash

# Arguments: royalties jsoncid imagecid tag1,tag2 => encoded in HEX 
# https://www.online-toolz.com/tools/text-hex-convertor.php
# + add 0x before

# update me each time you have re-deployed
SC_ADDRESS="erd1qqqqqqqqqqqqqpgq3ztcmjzdkq5xkm445xtj7v0ygmgaue7qjg9q2gd7at"

TOKEN_TICK="0x544d5443" # TMTC
TOKEN_NAME="0x546f696d656d65" # Toimeme

erdpy --verbose \
    contract call ${SC_ADDRESS} \
    --recall-nonce \
    --pem="wallets/owner/owner.pem" \
    --gas-limit=100000000 \
    --value=50000000000000000 \
    --function="issueToken" \
    --arguments ${TOKEN_NAME} ${TOKEN_TICK} \
    --send \
    --proxy="https://devnet-gateway.elrond.com" \
    --chain="D"