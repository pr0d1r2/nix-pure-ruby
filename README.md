# nix-pure-ruby

Drop-in pure nix shell to be placed in Ruby (and Rails) projects.

This repo extrapolates idea of pure nix shell into multi-level
encapsulated and modularized environments that loads mostly what is
necessary instead of always loading everything.

## Installation

Drop `nix/` folder and `Guardfile` to your Ruby [and Rails] project.
Adjust contents to have required ruby version and Gemfiles to contain
needed gems.

## Usage

Usable via set of encapsulated nix [sub] shells:

### Guard

Run (aliased from bin/):

```zsh
guard
```

Runs RuboCop and RSpec automatically.
In other words - we have reactive TDD loop.

Run:

```zsh
nix/pure/guard/run.nixsh
```

### RuboCop

Run (aliased from bin/):

```zsh
rubocop
```

Runs:

```zsh
nix/pure/rubocop/run.nixsh
```

### RSpec

Run (aliased from bin/):

```zsh
rspec
```

Runs:

```zsh
nix/pure/rspec/run.nixsh
```

#### Parallel RSpec

```zsh
prspec
```

Runs:

```zsh
nix/pure/parallel_rspec/run.nixsh
```

## Updating

Updateable via set of encapsulated nix [sub] shells:

### nix sources

Modify `nix/sources.json` and run:

```zsh
nix/sources.update.nixsh
```

### Guard bundle

Modify `nix/pure/guard/Gemfile` and run:

```zsh
nix/pure/guard/update.nixsh
```

### RuboCop bundle

Modify `nix/pure/rubocop/Gemfile` and run:

```zsh
nix/pure/rubocop/update.nixsh
```

### RSpec bundle

Modify `nix/pure/rspec/Gemfile` and run:

```zsh
nix/pure/rspec/update.nixsh
```

## Direnv with nix

There is `.envrc` which can autoload entire environment on directory
enter.
As always - before allowing it to run - study underlying implementation
with security in mind.
