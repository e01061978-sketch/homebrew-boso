class Boso < Formula
  desc "Boso AI — self-hosted coding agent. Your box, your model."
  homepage "https://boso.com"
  url "https://ai.boso.com/releases/boso-0.0.3.pyz"
  sha256 "d63fd658ea3ad35cc0c35e007fea04e95b053a4e12a4e7e0d5cf0cef2ec25685"
  version "0.0.3"

  depends_on "python@3.12"

  def install
    libexec.install "boso-0.0.3.pyz" => "boso.pyz"
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
