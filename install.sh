#!/bin/bash
# Check if Homebrew is Installed  & install it if not
if ! which brew ;
then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
# Install Brew Programs
for i in $( cat list/brew ); do
   brew install $i
done
# Install Caskroom & Configure versions of apps
brew cask
rm /usr/local/Library/Taps/caskroom/homebrew-cask/Casks/expandrive.rb
cp expandrive.rb /usr/local/Library/Taps/caskroom/homebrew-cask/Casks/expandrive.rb
# Installs Brew Cask Apps
brew tap caskroom/versions
for i in $( cat list/cask ); do
   brew cask install $i
done
for i in $( cat list/atom ); do
   apm install $i
done
# Cleanup
brew cleanup
brew cask cleanup
