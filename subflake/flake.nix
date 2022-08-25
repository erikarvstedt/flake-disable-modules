{
  outputs = { ... }: {
    nixosModules.default = [
      ./module1.nix
      ./module2.nix
    ];
  };
}
