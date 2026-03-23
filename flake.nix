{
  description = "Calculator module - wraps libcalc C library for Logos";

  inputs = {
    logos-module-builder.url = "github:logos-co/logos-module-builder";
    logos-nix.url = "github:logos-co/logos-nix";
    nixpkgs.follows = "logos-nix/nixpkgs";

    # Example: External library as a flake input
    # Replace with your actual library source
    # example-lib = {
    #   url = "github:example/example-lib";
    #   flake = false;  # Non-flake source
    # };
  };

  outputs = { self, logos-module-builder, nixpkgs, ... }:
    logos-module-builder.lib.mkLogosModule {
      src = ./.;
      configFile = ./module.yaml;
      
      # Pass the external library input to the builder
      # externalLibInputs = {
      #   example_lib = example-lib;
      # };
    };
}
