# nix-pure-ruby

Drop-in pure nix shell to be placed in Ruby (and Rails) projects.

## Installation

Drop `nix/` folder and `Guardfile` to your Ruby [and Rails] project.
Adjust contents to have required ruby version and Gemfiles to contain
needed gems.

## Usage

Usable via set of encapsulated nix [sub] shells:

### RuboCop

Run:

```zsh
nix/pure/rubocop/run.nixsh
```

### Guard

Run:

```zsh
nix/pure/guard/run.nixsh
```

### RSpec

Run:

```zsh
nix/pure/rspec/run.nixsh
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
