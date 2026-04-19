class Boso < Formula
  desc "Boso AI — self-hosted coding agent. Your box, your model."
  homepage "https://boso.com"
  url "https://ai.boso.com/releases/boso-0.0.13.pyz"
  sha256 "726ee532a4016a731a8f744e0cfcd908e2e48535ffe80c2643437cc002800f7e"
  version "0.0.13"

  depends_on "python@3.12"

  def install
    libexec.install "boso-0.0.13.pyz" => "boso.pyz"
    (bin/"boso").write <<~SH
      #!/usr/bin/env sh
      exec "#{Formula["python@3.12"].opt_bin}/python3.12" "#{libexec}/boso.pyz" "$@"
    SH
    chmod 0755, bin/"boso"
  end

  test do
    assert_predicate bin/"boso", :executable?
  end
end
