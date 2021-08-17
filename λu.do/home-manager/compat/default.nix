# compat :: default
{ ... }: (builtins.getFlake (toString ../.)).legacyPackages.${builtins.currentSystem}
