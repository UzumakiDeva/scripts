
#!/bin/bash

echo "🔥 Powerlevel10k Full Setup Starting... 🔥"

# Update & Install Dependencies
sudo apt update && sudo apt install -y zsh git curl wget fonts-powerline

# Install Nerd Fonts
echo "🔽 Installing Nerd Fonts..."
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git ~/nerd-fonts
cd ~/nerd-fonts
./install.sh
cd ..
rm -rf nerd-fonts

# Change default shell to Zsh
echo "🔄 Changing default shell to Zsh..."
chsh -s $(which zsh)

# Install Oh My Zsh
echo "💾 Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k
echo "🚀 Installing Powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Set Theme in .zshrc
echo "🔧 Configuring Zsh..."
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc

# Apply Changes
echo "✅ Installation Complete! Restart your terminal & run: p10k configure"
exec zsh
