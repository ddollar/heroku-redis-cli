# heroku-redis-cli

## Installation

    $ heroku plugins:install https://github.com/ddollar/heroku-redis-cli

## Usage

    $ heroku redis:cli
    redis server:10445>

    $ heroku redis:cli client list
    addr=10.0.0.0:36472 fd=5 idle=1 flags=N db=0 sub=0 psub=0 qbuf=0 obl=0 oll=0 events=r cmd=publish
    addr=10.0.0.0:36473 fd=6 idle=0 flags=N db=0 sub=9565 psub=0 qbuf=0 obl=0 oll=0 events=r cmd=subscribe

## License

MIT
