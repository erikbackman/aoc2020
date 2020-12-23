with import <nixpkgs> {};
mkShell {
  buildInputs = [
    (haskellPackages.ghcWithPackages (ps: with ps; [
       numbers
       containers
       megaparsec
       text
       lens
    ]))
    haskellPackages.numbers
    cabal-install
    haskellPackages.ghcid
    haskellPackages.ghcide
    haskellPackages.hlint
  ];
}
