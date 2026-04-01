{
  description = "Calculator module - wraps libcalc C library for Logos";

  inputs = {
    logos-module-builder.url = "github:logos-co/logos-module-builder/b6cf87d30e2995e023496fcfc7f06e8127c6ac5b";

    # If your external library is a flake input (source to be built by Nix),
    # add it here and pass it via externalLibInputs below.
    # example-lib = {
    #   url = "github:example/example-lib";
    #   flake = false;
    # };
  };

  outputs = inputs@{ logos-module-builder, ... }:
    logos-module-builder.lib.mkLogosModule {
      src = ./.;
      configFile = ./metadata.json;
      flakeInputs = inputs;

      # If using a flake-input external library (uncomment and adapt):
      # externalLibInputs = {
      #   example_lib = inputs.example-lib;
      # };
    };
}