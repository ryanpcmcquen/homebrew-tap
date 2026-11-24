# Homebrew Tap for Flint

Install [Flint](https://github.com/ryanpcmcquen/flint) with Homebrew.

The formula is named `flint-ai` to avoid the existing `flint` number-theory
library in Homebrew core. It still installs the `flint` binary and `flint(1)`
man page.

```sh
brew tap ryanpcmcquen/tap
brew install flint-ai
```

Or in one command:

```sh
brew install ryanpcmcquen/tap/flint-ai
```

The formula is updated automatically by a scheduled GitHub Actions workflow
when a new Flint release is published.
