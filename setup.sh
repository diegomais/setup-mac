echo "What name do you want to use in GIT user.name?"
echo "For example, mine will be \"Diego Mais\""
read git_config_user_name
git config --global user.name "$git_config_user_name"
clear

echo "What email do you want to use in GIT user.email?"
echo "For example, mine will be \"diegomais.dev@gmail.com\""
read git_config_user_email
git config --global user.email $git_config_user_email
clear

echo "Can I set Visual Studio Code as your default GIT editor for you? (y/n)"
read git_core_editor_to_code
if echo "$git_core_editor_to_code" | grep -iq "^y" ;then
	git config --global core.editor code --wait
else
	echo "Okay, no problem. :) Let's move on!"
fi

echo "Generating a SSH Key"
ssh-keygen -t rsa -b 4096 -C $git_config_user_email
ssh-add -K ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub

echo "Start the ssh-agent in the background"
eval "$(ssh-agent -s)"

echo "Automatically load SSH keys"
echo "Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_rsa" > ~/.ssh/config

echo "Installing: Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing: nvm"
/bin/bash -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash)"

echo "Installing: Firebase CLI"
npm install -g firebase-tools

echo "Installing: Nest CLI - Node.js Framework"
npm install -g @nestjs/cli

echo "Installing: Elixir"
brew install elixir

echo "Installing: Phoenix"
mix archive.install hex phx_new 1.5.7

echo "Installing: DBeaver Community Edition"
brew install --cask dbeaver-community

echo "Installing: DevDocs App"
brew install --cask devdocs

echo "Installing: Discord"
brew install --cask discord

echo "Installing: Figma"
brew install --cask figma

echo "Installing: Facebook Flipper - Desktop debugging platform for mobile developers"
brew install --cask flipper

echo "Installing: Google Chrome - Web browser"
brew install --cask google-chrome

echo "Installing: Hyper - Terminal built on web technologies"
brew install --cask hyper

echo "Installing: Insomnia - HTTP and GraphQL Client"
brew install --cask insomnia

echo "Installing: Microsoft Edge - Web browser"
brew install --cask microsoft-edge

echo "Installing: MongoDB Compass - GUI for MongoDB"
brew install --cask mongodb-compass

echo "Installing: Notion - App to write, plan, collaborate, and get organized"
brew install --cask notion

echo "Installing: Postman - Collaboration platform for API development"
brew install --cask postman

echo "Installing: React Native Debugger - App for debugging React Native apps"
brew install --cask react-native-debugger

echo "Installing: Reactotron - App for inspecting React JS and React Native projects"
brew install --cask reactotron

echo "Installing: Skype - App for video chat, voice call and instant messaging"
brew install --cask skype

echo "Installing: SourceTree - Graphical client for Git version control"
brew install --cask sourcetree

echo "Installing: Telegram - Messaging app with a focus on speed and security"
brew install --cask telegram

echo "Installing: Zeplin - Share, organize and collaborate on designs"
brew install --cask zeplin

echo "Installing: Docker"
brew install --cask docker

echo "Installing: Android Studio"
brew install --cask android-studio

echo "Installing: Desktop client for Amazon Music"
brew install --cask amazon-music

echo "Installing: Spotify - Music streaming service"
brew install --cask spotify
