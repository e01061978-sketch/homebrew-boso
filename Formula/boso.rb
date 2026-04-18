class Boso < Formula
  desc "Boso AI — self-hosted coding agent. Your box, your model."
  homepage "https://boso.com"
  url "https://ai.boso.com/releases/boso-0.0.10.pyz"
  sha256 "9ca256df9d30e18e58d0771725ea9e608039d39fa51f6e9586a62e3dbc5ee19c"
  version "0.0.10"

  depends_on "python@3.12"

  def install
    libexec.install "boso-0.0.10.pyz" => "boso.pyz"
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
