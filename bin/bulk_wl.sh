#// 20 max
declare -a ADRESSES=(
    "erd1pfs8xwfaypzyc8sm3dyufxamawhj7se68zdpw5njw9ppwgz7qfdqept4zn"
    "erd1w5u2fc80tye6v4au70cfetnpj0wgkznm4v7uwqkdgwxpqwl7zqaq26vzn5"
    "erd14dhg45peqmz6w38q969s8wy53f22fpahvkhcgfpcqlmnenc0na8quh92ju"
    "erd1w2dzy6su8k44pfqyvrskhajmyq9au4a0axuntvnmkpwf9pqgprws6mjxhw"
    "erd1ez0mykqpaeu0csjjre0al356pywmck4hc67tlhx73lqywrarg5vsnvhlem"
    "erd136unnt0dtpezfjpuc77xhv3qrlaw46mlzx69m0xsq2p3dwrgt8gqr2utke"
    "erd19mdq9fsg8kfawmftau450r7msla9dfl9sr2nhdlk2nt87xypdcps3uz7af"
    "erd12x89fps420scnsfrq7csxhdzuh2pm5awm652cdz0auf0jrtfxp9q5l8j6m"
    "erd12nfgdr9e3esqyfyvaqcgzh56edspxvns4dvvsyqvkmmlnv6nfjys4vn2h2"
    "erd1tdhwa99xmdkte82l57v4leqy30yskfml35u2qjwwq8jf9tcecr9qw4vnmj"
    "erd1zws0eg5j5zyluhm5gfyt4n03ddwypqegaz9h2ykt2a5d50x2akyqq9j99u"
    "erd14tmuln98lcskj0wm8yylz3uwhqt59gnsxv5w7e25kvpr0e5zl5cqw7ymkg"
    "erd1kj8ukfkt6sqelph577mmxxt82wh4usq8v6fwha5re6fagfv9awtskfn6zc"
    "erd19flgr2sk3hlag0e3p75l0px2qqaw9er3tk0zu7jjjwwxd4n6znlqe3wq4c"
    "erd12y8lwr2grpsz0lqpvnua2zz869h6502nnmh6s40secnjke5pk4lstlkf5q"
    "erd1ynakksf68s347rys7ux48000q2dqnggpcf8dlhnautxzupcazr9q3889tz"
    "erd17h3yxw32fz5y4tcz9l0lva2zaaqs8zwvervk6xldr2rfhkskgx4sn5rmjd"
    "erd179r7dafw5vpszujf4dvfsuj373heq2a4pzrfy8z90p5akyy3zscsz3qwdu"
    "erd164st0st7ap8qj9gvkmcp8vvcsupqv52u0slgnvqtrwnu7lnrmj2q3fk97q"
    "erd1ynj5vx56e2lwwj6rznmkx5wtvpux0jx2fq69acugu0wm2atvpquspyhmpt"
    "erd1p4km3ax58eju0dukm4v2hlu8yn9t4njlj6tvderwlx8gv524n3wswy3nc9"
    "erd18uleeeum5h7w7zyfu5d9ezuc68fysdm9hy58tremgg65pytevu3s3g0a6z"
    "erd1r6fhkgq3ghzp0dy2qr4wum29wmqx92y0kqkjkjl204adjxz6ee6qcyftwa"
    "erd1ms4lkzsq9gd88he94qsc5qt4a3thdq0a7wxu069zskc7q8ldwckslg2378"
    "erd13xl7w4s628d0vf53cx7qkmv7w4pvtyqq32zrmn6s6zac2vfuf72qspel9g"
    "erd1xw5hzt5wz6h4rp0y8p3pqxdvzptrt62cf2q92wf9sk8cp6w3fe3q395cvw"
)
#!/bin/bash

# update me each time you have re-deployed
SC_ADDRESS="erd1qqqqqqqqqqqqqpgqas9uuf68zhdmrmf3894vpfmt8dxw9rkt2yyqp4d8kt"

OWNER_PEM="wallets/owner/neodium.pem"

# DEVNET CONFIG
# PROXY="https://devnet-gateway.elrond.com"
# CHAIN="D"
# # TESTNET CONFIG
# PROXY="https://testnet-gateway.elrond.com"
# CHAIN="T"
# # MAINNET CONFIG
PROXY="https://gateway.elrond.com"
CHAIN="1"

PAYLOAD=""
wl() {
    for adress in "${ADRESSES[@]}"; do
        hex=$(erdpy wallet bech32 --decode $adress)
        PAYLOAD+=$hex
    done
    erdpy --verbose contract call ${SC_ADDRESS} \
        --recall-nonce \
        --pem=${OWNER_PEM} \
        --gas-limit=60000000 \
        --function whiteListMany@${PAYLOAD} \
        --send \
        --proxy=${PROXY} \
        --chain=${CHAIN}
}

# Run
# ---
wl
