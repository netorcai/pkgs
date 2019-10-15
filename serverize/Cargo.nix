# Generated by carnix 0.10.0: carnix generate-nix --standalone --src .
# then hacked src and input parameters.

{buildRustCrateHelpers, buildRustCrate, callPackage, fetchFromGitHub}:
with buildRustCrateHelpers;
let inherit (lib.lists) fold;
    inherit (lib.attrsets) recursiveUpdate;
  cratesIO = (callPackage ./crates-io.nix { });
in
rec {
  crates = cratesIO // rec {
    crates.serverize."0.1.0" = deps: { features?(features_.serverize."0.1.0" deps {}) }: buildRustCrate {
      crateName = "serverize";
      version = "0.1.0";
      authors = [ "Florent Becker <Florent.Becker@posteo.net>" ];
      edition = "2018";

      src = fetchFromGitHub {
        owner = "netorcai";
        repo = "serverize";
        rev = "73707d5d9d2c5d93e662ef7433baec401dcb9c5e";
        sha256 = "1fclykgxn63pwlbpzwi47qbz6zspxzam03gshm8pf90rlh7y9vhw";
      };

      dependencies = mapFeatures features ([
        (cratesIO.crates."clap"."${deps."serverize"."0.1.0"."clap"}" deps)
      ]);
    };
    features_.serverize."0.1.0" = deps: f: updateFeatures f (rec {
      clap."${deps.serverize."0.1.0".clap}".default = true;
      serverize."0.1.0".default = (f.serverize."0.1.0".default or true);
    }) [
      (cratesIO.features_.clap."${deps."serverize"."0.1.0"."clap"}" deps)
    ];
  };

  serverize = crates.crates.serverize."0.1.0" deps;
  __all = [ (serverize {}) ];
  deps.ansi_term."0.11.0" = {
    winapi = "0.3.8";
  };
  deps.atty."0.2.13" = {
    libc = "0.2.62";
    winapi = "0.3.8";
  };
  deps.bitflags."1.2.0" = {};
  deps.clap."2.33.0" = {
    atty = "0.2.13";
    bitflags = "1.2.0";
    strsim = "0.8.0";
    textwrap = "0.11.0";
    unicode_width = "0.1.6";
    vec_map = "0.8.1";
    ansi_term = "0.11.0";
  };
  deps.libc."0.2.62" = {};
  deps.serverize."0.1.0" = {
    clap = "2.33.0";
  };
  deps.strsim."0.8.0" = {};
  deps.textwrap."0.11.0" = {
    unicode_width = "0.1.6";
  };
  deps.unicode_width."0.1.6" = {};
  deps.vec_map."0.8.1" = {};
  deps.winapi."0.3.8" = {
    winapi_i686_pc_windows_gnu = "0.4.0";
    winapi_x86_64_pc_windows_gnu = "0.4.0";
  };
  deps.winapi_i686_pc_windows_gnu."0.4.0" = {};
  deps.winapi_x86_64_pc_windows_gnu."0.4.0" = {};
}.serverize
