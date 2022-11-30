function warp-stop --wraps='wg-quick down ~/wgcf-profile.conf' --description 'alias warp-stop=wg-quick down ~/wgcf-profile.conf'
  wg-quick down ~/wgcf-profile.conf $argv; 
end
