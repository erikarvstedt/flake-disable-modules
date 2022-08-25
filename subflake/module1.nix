{ lib, ...}:
{
  options.testValue = lib.mkOption { default = "success"; };
}
