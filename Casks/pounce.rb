cask "pounce" do
  version "0.1.0"
  sha256 "4b9f53debb9c4ec484aefbb1bb4d3deab2fd655be7f1e85be5621be0f15da3e8"

  url "https://github.com/3000-2/pounce/releases/download/v#{version}/Pounce-#{version}.zip"
  name "Pounce"
  desc "Keyboard-driven clicking and scrolling for macOS"
  homepage "https://github.com/3000-2/pounce"

  app "Pounce.app"

  caveats <<~EOS
    Pounce는 아직 공증(notarize)되지 않아 첫 실행이 Gatekeeper에 차단될 수 있습니다.
    다음 중 하나로 해제하세요:

      xattr -d com.apple.quarantine /Applications/Pounce.app

    또는 첫 실행이 차단된 뒤: 시스템 설정 → 개인정보 보호 및 보안 → "그래도 열기"

    실행 후 시스템 설정 → 개인정보 보호 및 보안 → 손쉬운 사용에서
    Pounce를 켜고 앱을 다시 실행하세요.
  EOS
end
