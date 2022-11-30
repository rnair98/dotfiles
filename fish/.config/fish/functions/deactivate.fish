function deactivate --wraps=micromamba\ deactivate --description alias\ deactivate=micromamba\ deactivate
  micromamba deactivate $argv;
end   
