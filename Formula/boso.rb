class Boso < Formula
  desc "Boso AI — self-hosted coding agent. Your box, your model."
  homepage "https://boso.com"
  url "https://ai.boso.com/releases/boso-0.2.0.pyz"
  sha256 "b08021449d411aafab6e7ff24adde8d8e994b1b4024a9537ef6349ebdc9a7a1f"
  version "0.2.0"

  depends_on "python@3.12"

  def install
    libexec.install "boso-0.2.0.pyz" => "boso.pyz"
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
