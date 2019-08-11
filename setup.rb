#! /usr/bin/ruby

require 'fileutils'

SOFTWARE_VERSIONS = {}

set_software_versions
install_homebrew
install_brew_packages
install_xcode_command_line_tools
set_up_rbenv
set_up_nvm


def set_software_versions
  ARGV.map { |arg| arg.split("=") }.to_h.merge(SOFTWARE_VERSIONS)
end

def install_homebrew
  system_calls "/usr/bin/ruby -e '$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)'"
end


def install_homebrew_packages
  system_calls "brew install #{brew_packages}"
end

def install_xcode_command_line_tools
  system_calls "xcode-select --install"
end


def set_up_rbenv
  system_calls(
    "rbenv init",
    "rbenv install #{SOFTWARE_VERSIONS[:ruby]}",
    "rbenv global #{SOFTWARE_VERSIONS[:ruby]}",
    "gem install bundler",
    "rbenv rehash"
  )
end

def set_up_nvm
  home_dir = Dir.home
  bash_profile = "#{home_dir}/.bash_profile"
  FileUtils.touch(bash_profile) unless File.exist?(bash_profile) # required for nvm script to work
  system_calls "wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash"

  set_up_nodejs
end

def set_up_nodejs
  node_version = SOFTWARE_VERSIONS[:node] || 'node'

  system_calls(
    "nvm install #{node_version}",
    "nvm alias default #{node_version}"
  )
end


def system_calls(*calls)
  exec_call = -> (call) { system `#{call}` }
  calls.each(&exec_call)
rescue => error
  puts error
end


def brew_packages
  File.readlines('./brew_packages.txt')
      .map { |line| line.gsub(/\n/, ' ') }
      .inject(&:+)
end
