#!/bin/bash

# Arguments: royalties jsoncid imagecid tag1,tag2 => encoded in HEX
# https://www.online-toolz.com/tools/text-hex-convertor.php
# + add 0x before

# update me each time you have re-deployed
SC_ADDRESS="erd1qqqqqqqqqqqqqpgqa2nz4zk8h8d2k7ynrvg6hhl2h40txsj2jg9qqsdnwr"
# DEVNET CONFIG
PROXY="https://devnet-gateway.elrond.com"
CHAIN="D"

# # TESTNET CONFIG
# PROXY="https://testnet-gateway.elrond.com"
# CHAIN="T"

# # MAINNET CONFIG
# PROXY="https://gateway.elrond.com"
# CHAIN="M"

erdpy --verbose \
    contract call ${SC_ADDRESS} \
    --recall-nonce \
    --pem="wallets/owner/owner.pem" \
    --gas-limit=100000000 \
    --function="startPublicSale" \
    --send \
    --proxy=${PROXY} \
    --chain=${CHAIN}
