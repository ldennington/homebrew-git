cask 'git-credential-manager-core' do
  arch = Hardware::CPU.intel? ? "x64" : "arm64"
  prefix = Hardware::CPU.intel? ? "/usr/local" : "/opt/homebrew"
  name 'Git Credential Manager'
  homepage 'https://aka.ms/gcm'

  version "2.0.877"
  if Hardware::CPU.intel?
    sha256 'c04778bd2ad0e414b94b374877d734acb384dc45d6be9e0531e94b264cc00927'
  else
    sha256 'f5df1268ec355ead03f2b28b41e436260062ea4a5a57b609c56e2ba52bc4c20f'
  end

  url "https://github.com/ldennington/git-credential-manager/releases/download/v#{version.major_minor_patch}/gcm-osx-#{arch}-#{version.major_minor_patch}.pkg"
  pkg "gcm-osx-#{arch}-#{version}.pkg", allow_untrusted: true
  uninstall script: {
                      executable: "#{prefix}/share/gcm-core/uninstall.sh",
                      sudo:       true,
                    },
            pkgutil: 'com.microsoft.GitCredentialManager'
end
