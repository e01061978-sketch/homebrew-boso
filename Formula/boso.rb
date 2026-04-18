class Boso < Formula
  desc "Boso AI — self-hosted coding agent. Your box, your model."
  homepage "https://boso.com"
  url "https://ai.boso.com/releases/boso-0.0.9.pyz"
  sha256 "745a978267539f760a368d9e1c21c32e7366adfd2dea91a7c0a15ba4004e848d"
  version "0.0.9"

  depends_on "python@3.12"

  def install
    libexec.install "boso-0.0.9.pyz" => "boso.pyz"
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
