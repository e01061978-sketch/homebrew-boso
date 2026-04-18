class Boso < Formula
  desc "Boso AI — self-hosted coding agent. Your box, your model."
  homepage "https://boso.com"
  url "https://ai.boso.com/releases/boso-0.0.7.pyz"
  sha256 "98cc186d6d780c858abee3e5a1adc56860668830f31115e2c5b02a06e8c91414"
  version "0.0.7"

  depends_on "python@3.12"

  def install
    libexec.install "boso-0.0.7.pyz" => "boso.pyz"
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
