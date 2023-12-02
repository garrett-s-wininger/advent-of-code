{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/4ecab3273592f27479a583fb6d975d4aba3486fe.tar.gz") {} }:

pkgs.mkShell {
    buildInputs = with pkgs; [
        nodejs_20
    ];
}
