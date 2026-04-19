class Boso < Formula
  desc "Boso AI — self-hosted coding agent. Your box, your model."
  homepage "https://boso.com"
  url "https://ai.boso.com/releases/boso-0.1.0.pyz"
  sha256 "eab971bf9fa5a8b7315725c89b1a0d132f0bfdf6c1c855bc2cbf34c414fce331"
  version "0.1.0"

  depends_on "python@3.12"

  def install
    libexec.install "boso-0.1.0.pyz" => "boso.pyz"
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
