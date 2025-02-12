cask 'microsoft-git' do
  name 'Microsoft-fork of Git'
  homepage 'https://github.com/microsoft/git'

  version '2.38.1.vfs.0.0'
  sha256 '432a6ab896e5d9374ceb7afca1dab69b3c564e554ac46c85f4beae69ea0e16ad'

  url "https://github.com/microsoft/git/releases/download/v#{version}/git-#{version}-intel-x86_64.pkg"

  pkg "git-#{version}-intel-x86_64.pkg", allow_untrusted: true

  conflicts_with formula: 'git'
  
  depends_on cask: 'git-credential-manager-core'

  uninstall script: {
            executable: '/usr/local/git/uninstall.sh',
            args:       ['--yes'],
            sudo:       true,
            },
        pkgutil: 'com.git.pkg'
end
