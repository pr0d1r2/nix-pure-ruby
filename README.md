# nix-pure-ruby

Drop-in pure nix shell to be placed in Ruby (and Rails) projects.

## Usage

Usable via set of encapsulated nix [sub] shells:

### RuboCop

Run:

```zsh
nix/pure/rubocop/run.nixsh
```

## Updating

Updateable via set of encapsulated nix [sub] shells:

### nix sources

Modify `nix/sources.json` and run:

```zsh
nix/sources.update.nixsh
```

### RuboCop bundle

Modify `nix/pure/rubocop/Gemfile` and run:

```zsh
nix/pure/rubocop/update.nixsh
```
