function jupyterlab --wraps=jupyter-lab\ --no-browser  --description alias\ jupyterlab=jupyter-lab\ --no-browser
  jupyter-lab --no-browser $argv;
end
