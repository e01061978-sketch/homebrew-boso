class Boso < Formula
  desc "Boso AI — self-hosted coding agent. Your box, your model."
  homepage "https://boso.com"
  url "https://ai.boso.com/releases/boso-0.0.16.pyz"
  sha256 "6e2de33e6afb8e1419f9f9cee73ffeb3b350cf2308aa68f1ccfc5a65bdfcac60"
  version "0.0.16"

  depends_on "python@3.12"

  def install
    libexec.install "boso-0.0.16.pyz" => "boso.pyz"
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
