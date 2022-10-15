function browsh --wraps='docker run -it --rm browsh/browsh' --description 'alias browsh=docker run -it --rm browsh/browsh'
  docker run -it --rm browsh/browsh $argv; 
end
