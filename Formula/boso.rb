class Boso < Formula
  desc "Boso AI — self-hosted coding agent. Your box, your model."
  homepage "https://boso.com"
  url "https://ai.boso.com/releases/boso-0.0.18.pyz"
  sha256 "7db49d46081c3c3f9c296d7854dbe46634aae06255479488c0d6f14767e64479"
  version "0.0.18"

  depends_on "python@3.12"

  def install
    libexec.install "boso-0.0.18.pyz" => "boso.pyz"
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
