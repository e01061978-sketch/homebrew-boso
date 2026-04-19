class Boso < Formula
  desc "Boso AI — self-hosted coding agent. Your box, your model."
  homepage "https://boso.com"
  url "https://ai.boso.com/releases/boso-0.0.15.pyz"
  sha256 "39d0e004b6e5d5845c0033cc78c2405c19073b4425701ab6e1f874ce53426f0f"
  version "0.0.15"

  depends_on "python@3.12"

  def install
    libexec.install "boso-0.0.15.pyz" => "boso.pyz"
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
