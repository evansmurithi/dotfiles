# dotfiles

My configuration files.

[![Travis CI](https://img.shields.io/travis/com/evansmurithi/dotfiles?style=flat-square)](https://travis-ci.com/evansmurithi/dotfiles)

**Table of Contents**

<!-- toc -->

- [About](#about)
  * [Installing](#installing)
- [Contributing](#contributing)
  * [Running the tests](#running-the-tests)

<!-- tocstop -->

## About

### Installing

```console
$ make
```

This will create symlinks from this repo to your home folder.

## Contributing

### Running the tests

The tests use [shellcheck](https://github.com/koalaman/shellcheck). Tests are
run in a container.

```console
$ make test
```
