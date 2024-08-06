#!/bin/zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

TERM_PROGRAMS=( starship fzf bat exa fd rg z nvm lazygit lazydocker )

for program in ${TERM_PROGRAMS[@]}; do
    echo "Installing $program...\n"
    brew install $program
done

CASK_PROGRAMS=( kitty )
for program in ${CASK_PROGRAMS[@]}; do
    echo "Installing $program\n"
    brew install $program --cask
done

echo "Creating oh-my-zsh custom source"
echo 'Installation path: $ZSH/custom'
touch $ZSH/custom/source.zsh
# source zoxide
echo '. $HOMEBREW_PREFIX/etc/profile.d/z.sh' >> ~/.oh-my-zsh/custom/source.zsh
# source fzf
echo 'source <(fzf --zsh)' >> ~/.oh-my-zsh/custom/source.zsh
# source starship
echo 'eval "$(starship init zsh)"' >> ~/.oh-my-zsh/custom/source.zsh
