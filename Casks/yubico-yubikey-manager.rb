cask 'yubico-yubikey-manager' do
  version '1.1.1'
  sha256 '40e11dfe770f0bf6e3abc2ef7556463f5c6613eb11113c2a180c7ca66fd60583'

  url "https://developers.yubico.com/yubikey-manager-qt/Releases/yubikey-manager-qt-#{version}-mac.pkg"
  appcast 'https://github.com/Yubico/yubikey-manager-qt/releases.atom'
  name 'Yubikey Manager'
  homepage 'https://developers.yubico.com/yubikey-manager-qt/'

  depends_on macos: '>= :sierra'

  pkg "yubikey-manager-qt-#{version}-mac.pkg"

  uninstall quit:    'com.yubico.ykman',
            pkgutil: 'com.yubico.ykman'

  zap trash: [
               '~/Library/Caches/Yubico/YubiKey Manager',
               '~/Library/Preferences/com.org-yubico.YubiKey Manager.plist',
               '~/Library/Saved Application State/com.yubico.ykman.savedState',
             ],
      rmdir: '~/Library/Caches/Yubico'
end
