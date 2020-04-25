with import <nixpkgs> {};

stdenv.mkDerivation rec {
    name = "rg-graphql";
    buildInputs = [
        pkgs.neo4j
        pkgs.nodejs-10_x
    ];

    env = buildEnv {
        name = name;
        paths = buildInputs;
    };

    shellHook = "export PS1='\n\\[\\033[01;32m\\][nix rg-graphql] \\w\\$\\[\\033[00m\\] '";
}
