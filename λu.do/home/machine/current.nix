# machine :: current
{ ... }: (builtins.getFlake (toString ../.)).legacyPackages.${builtins.currentSystem}
