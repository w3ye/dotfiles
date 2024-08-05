default_shell: 
	@echo "setting zsh as default shell\n"
	@chsh -s `which zsh`

TERMINAL_PROGRAMS := 'yazi' 'lazygit' 'lazydocker' 'eza' 'nvim' 'bat'

mac_install: 
	@echo "\nInstalling oh-my-zsh\n"
	@sh -c `curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh`

	@echo "\nInstalling homebrew\n"
	@/bin/zsh -c `curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh`

	@source ~/.zshrc

	@for program in $(TERMINAL_PROGRAMS); do \
		echo "\nInstalling $$program\n"; \
		brew install $$program --HEAD; \
	done

	@echo "\nInstalling kitty\n"
	brew install --cask kitty

	@echo "\ninstalling dotfiles\n"
	@git clone https://github.com/w3ye/dotfiles.git ~/.dotfiles
	@cd ~/.dotfiles
	@stow mac_config terminal nvim

	brew update

	@make default_shell
