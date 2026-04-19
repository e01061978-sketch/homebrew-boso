class Boso < Formula
  desc "Boso AI — self-hosted coding agent. Your box, your model."
  homepage "https://boso.com"
  url "https://ai.boso.com/releases/boso-0.0.20.pyz"
  sha256 "2f0c50c47123790411d9f2bea7c0844e7885f02b2a9818ee7983d1e1520b2336"
  version "0.0.20"

  depends_on "python@3.12"

  def install
    libexec.install "boso-0.0.20.pyz" => "boso.pyz"
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
