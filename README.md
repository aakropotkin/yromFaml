Provides a _purely in_ `nix` ( no _import from derivation_ ) implementation of
`fromYaml` which converts `YAML` to a `nix` value.

**Work in progress**

Currently this only handles conversion of `key: value` style lines into an
attribute set.
Other than that, it is _smart enough_ to ignore comments.

That might not sound like much but honestly it's like 90% of YAML files and
so far this has covered my usage.

Don't be shy - PR with your improvements!
