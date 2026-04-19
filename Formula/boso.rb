class Boso < Formula
  desc "Boso AI — self-hosted coding agent. Your box, your model."
  homepage "https://boso.com"
  url "https://ai.boso.com/releases/boso-0.0.19.pyz"
  sha256 "3decb655d54bbefeaee2e50d770ba1ef13288b584e82a122735ef16d3e1dfd95"
  version "0.0.19"

  depends_on "python@3.12"

  def install
    libexec.install "boso-0.0.19.pyz" => "boso.pyz"
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
