class Boso < Formula
  desc "Boso AI — self-hosted coding agent. Your box, your model."
  homepage "https://boso.com"
  url "https://ai.boso.com/releases/boso-0.0.8.pyz"
  sha256 "bd3765ecdd42759ef52deb5deb5fb46856a4f243f4059c96718033c49c9c0501"
  version "0.0.8"

  depends_on "python@3.12"

  def install
    libexec.install "boso-0.0.8.pyz" => "boso.pyz"
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
