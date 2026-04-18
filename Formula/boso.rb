class Boso < Formula
  desc "Boso AI — self-hosted coding agent. Your box, your model."
  homepage "https://boso.com"
  url "https://ai.boso.com/releases/boso-0.0.4.pyz"
  sha256 "7631c29d0329e64d1b46450e4e5045ad74aafeeda6e1fc6b74afe0998c63434e"
  version "0.0.4"

  depends_on "python@3.12"

  def install
    libexec.install "boso-0.0.4.pyz" => "boso.pyz"
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
