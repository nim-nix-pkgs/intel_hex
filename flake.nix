{
  description = ''Intel hex file utility library'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."intel_hex-master".dir   = "master";
  inputs."intel_hex-master".owner = "nim-nix-pkgs";
  inputs."intel_hex-master".ref   = "master";
  inputs."intel_hex-master".repo  = "intel_hex";
  inputs."intel_hex-master".type  = "github";
  inputs."intel_hex-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."intel_hex-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}