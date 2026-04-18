class Boso < Formula
  desc "Boso AI — self-hosted coding agent. Your box, your model."
  homepage "https://boso.com"
  url "https://ai.boso.com/releases/boso-0.0.1.pyz"
  sha256 "ec366c546a19578cad6f14cf938741a4da978bc2231235a2322e5893634f4718"
  version "0.0.1"

  depends_on "python@3.12"

  def install
    libexec.install "boso-0.0.1.pyz" => "boso.pyz"
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
