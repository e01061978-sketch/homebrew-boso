class Boso < Formula
  desc "Boso AI — self-hosted coding agent. Your box, your model."
  homepage "https://boso.com"
  url "https://ai.boso.com/releases/boso-0.2.2.pyz"
  sha256 "67b0232359ced785a23ccf8d7761e4bcea1c3e6f2efbd51f822cddcf2466b3cc"
  version "0.2.2"

  depends_on "python@3.12"

  def install
    libexec.install "boso-0.2.2.pyz" => "boso.pyz"
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
