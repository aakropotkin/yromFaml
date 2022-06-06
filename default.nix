{ lib ? ( builtins.getFlake "nixpkgs" ).lib }:
{
  fromYaml = import ./fromYaml.nix { inherit lib; };
}
