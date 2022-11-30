function orgnotes --wraps='micromamba activate nvim && cd /mnt/e/Polymathy/Writing/blog/org' --wraps='micromamba activate nvim; cd /mnt/e/Polymathy/Writing/blog/org' --description 'alias orgnotes=micromamba activate nvim; cd /mnt/e/Polymathy/Writing/blog/org'
  micromamba activate nvim; cd /mnt/e/Polymathy/Writing/blog/org $argv; 
end
