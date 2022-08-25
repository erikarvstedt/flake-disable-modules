{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.nixpkgsFixed.url = "github:erikarvstedt/nixpkgs/fix-disabled-modules-abs-paths";
  inputs.subflake.url = "./subflake";

  outputs = { subflake, ... }@inputs: let
    mkTest = nixpkgs: (nixpkgs.lib.evalModules {
      modules = subflake.nixosModules.default ++ [
        {
          # Disable module that throws an error
          disabledModules = [ "${subflake}/module2.nix"];
        }
      ];
    }).config.testValue;
  in {
    before = mkTest inputs.nixpkgs;
    after = mkTest inputs.nixpkgsFixed;
  };
}
