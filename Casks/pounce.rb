cask "pounce" do
  version "0.1.0"
  sha256 "e82139f1c20ebe47276e23fef3c514a852067934ffe66350748489b57a451d8a"

  url "https://github.com/3000-2/pounce/releases/download/v#{version}/Pounce-#{version}.zip"
  name "Pounce"
  desc "Keyboard-driven clicking and scrolling for macOS"
  homepage "https://github.com/3000-2/pounce"

  app "Pounce.app"

  caveats <<~EOS
    Pounce는 아직 공증(notarize)되지 않았습니다. 설치 시 --no-quarantine을 권장합니다:
      brew install --cask --no-quarantine 3000-2/tap/pounce

    첫 실행 후 시스템 설정 → 개인정보 보호 및 보안 → 손쉬운 사용에서
    Pounce를 켜고 앱을 다시 실행하세요.
  EOS
end
