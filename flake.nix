{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    better-fox = {
      url = "github:yokoffing/Betterfox";
      flake = false;
    };
    catppuccin = {
      url = "github:catppuccin/nix";
    };
    nur = {
      url = "github:nix-community/nur";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    subtui = {
      url = "github:MattiaPun/SubTUI";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      forEachSystem = f: nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed f;
    in
    {
      # System configurations by hostname
      nixosConfigurations = {
        "t480" = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/t480
          ];
        };
        "drax" = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/drax
          ];
        };
      };

      # Developer Shells
      devShells = forEachSystem (
        sys:
        let
          pkgs = nixpkgs.legacyPackages.${sys};
        in
        {
          default = pkgs.mkShell {
            name = "config";
            packages = with pkgs; [
              nil
              yaml-language-server
              nix-melt
            ];
          };
        }
      );

      formatter = forEachSystem (sys: nixpkgs.legacyPackages.${sys}.nixfmt-tree);
    };
}
