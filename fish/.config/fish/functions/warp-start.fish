function warp-start --wraps='wg-quick up ~/wgcf-profile.conf' --description 'alias warp-start=wg-quick up ~/wgcf-profile.conf'
  wg-quick up ~/wgcf-profile.conf $argv; 
end
