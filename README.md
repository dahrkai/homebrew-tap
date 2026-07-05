# Dahrk Homebrew tap

Homebrew tap for [Dahrk](https://dahrk.ai). Install the edge client:

```sh
brew install dahrkai/tap/dahrk
```

This installs the `dahrk-node` npm package and exposes the `dahrk` command. Then connect a node:

```sh
dahrk start --token <enrolment-token>
```

## Formula

`Formula/dahrk.rb` is kept up to date automatically: on every tagged release of
[dahrkai/dahrk-node](https://github.com/dahrkai/dahrk-node), its release workflow republishes the
package to npm and pushes the new `url` + `sha256` here.

> **Bootstrap:** the formula ships with a placeholder `sha256` until `dahrk-node` has its first npm
> release. After the first publish, set the real values:
>
> ```sh
> curl -fsSL https://registry.npmjs.org/dahrk-node/-/dahrk-node-<version>.tgz | shasum -a 256
> ```
>
> then update `url`/`sha256` in `Formula/dahrk.rb` and push. See
> [dahrk-node `packaging/homebrew/`](https://github.com/dahrkai/dahrk-node/tree/main/packaging/homebrew)
> for the canonical source of the formula.
