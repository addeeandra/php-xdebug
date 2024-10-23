# php-xdebug

An image of PHP/Composer + XDebug [+ Swoole].

| Version         | php     | xdebug       | composer | swoole   | 
|-----------------|---------|--------------|----------|----------|
| 8.3             | 8.3     | v3.3.2       | latest   | :x:      |
| 8.3-swoole      | 8.3     | v3.3.2       | latest   | v5.1.2   |
| 8.2             | 8.2     | v3.3.2       | latest   | :x:      |
| 8.2-swoole      | 8.2     | v3.3.2       | latest   | v5.1.2   |
| 8.4             | 8.4     | v3.4.0beta1  | latest   | :x:      |
| 8.4-swoole      | 8.4     | v3.4.0beta1  | latest   | v5.1.5   |

## How it works

Dockerfile in this repository extending [php:{version}-cli-alpine](https://hub.docker.com/_/php) from Docker Hub and added xdebug + swoole.

The images split into two stages

- Base Image (php-cli + xdebug) => php-xdebug:{version}
- Swoole Image (php-xdebug:{version} + swoole) => php-xdebug:{version}-swoole

## How to use it in CLI

Let's say you want to run `php` and `composer` without installing anything except docker. You can run it like this.

```bash
docker run --rm -w /usr/src/myapp --volume $PWD:/usr/src/myapp php-xdebug:8.3 php -a
```

It's of course too long, you can add it as command alias in `bashrc` or `zshrc`.

```bash
alias php="docker run --rm -w /usr/src/myapp --volume $PWD:/usr/src/myapp php-xdebug:8.3 php"
```

And as of composer also.
```bash
alias composer="docker run --rm -w /usr/src/myapp --volume $PWD:/usr/src/myapp php-xdebug:8.3 composer"
```

It'll run normally like this.
```bash
php -v
composer install
composer upgrade
```

If the command not terminated after finished a command, you need to add `--interactive --tty` or the short hand `-it` like this.

```bash
alias php="docker run --interactive --tty --rm -w /usr/src/myapp --volume $PWD:/usr/src/myapp php-xdebug:8.3 php"

# or

alias php="docker run -it --rm -w /usr/src/myapp --volume $PWD:/usr/src/myapp php-xdebug:8.3 php"
```

You might end up having multiple stopped containers with random names after running it multiple times, it's recommended that you add `--name` to the command, so it'll use existing stopped container instead of creating new containers.

```bash
alias php="docker run --rm --name my-php --interactive --tty -w /usr/src/myapp --volume $PWD:/usr/src/myapp php-xdebug:8.3 php"
```

If you need to serve an open port, you can add it too.

```bash
alias php="docker run --rm --name my-php -p 8000:8000 --interactive --tty -w /usr/src/myapp --volume $PWD:/usr/src/myapp php-xdebug:8.3 php"
```

## How to really use the xdebug (PHPStorm)

Firstly, you need to pull the image into your local.

```bash
docker pull ghrc.io/addeeandra/php-xdebug:8.3
```

Then follow [this instruction](https://www.jetbrains.com/help/phpstorm/configuring-remote-interpreters.html#additional-configuration-options) to setup your PHP CLI Interpreter.

That's it, you'll got your PHP interpreter and debugger in place.