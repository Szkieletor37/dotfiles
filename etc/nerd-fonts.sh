# mkdir /usr/share/fonts
git clone https://github.com/ryanoasis/nerd-fonts.git ~/nerd-fonts
cd ~/nerd-fonts
git config core.sparsecheckout true
echo "/patched-fonts/ShareTechMono" >> .git/info/sparse-checkout
git read-tree -m -u HEAD
#mkdir ~/ShureTechMono-Nerd-Font
#cd ~/ShureTechMono-Nerd-Font
#git init 
#git config core.sparseCheckout true
#git remote add origin https://github.com/ryanoasis/nerd-fonts.git
#echo "patched-fonts/ShareTechMono/" > .git/info/sparse-checkout

