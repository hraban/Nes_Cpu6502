{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
  inputs.flake-parts.url = "flake-parts";
  inputs.systems.url = "github:nix-systems/default";

  outputs = { self, flake-parts, ... }@inputs: flake-parts.lib.mkFlake { inherit inputs; } {
    systems = import inputs.systems;
    perSystem = { pkgs, ... }: {
      packages.default = pkgs.stdenv.mkDerivation {
        name = "Nes_Cpu6502";
        src = ./.;
        nativeBuildInputs = with pkgs; [
          pkg-config
        ];
        buildInputs = with pkgs; [
          sdl3
        ];
        installPhase = ''
          mkdir -p $out/bin
          cp Nes_Cpu6502 $out/bin
        '';
        meta.mainProgram = "Nes_Cpu6502";
      };
    };
  };
}
