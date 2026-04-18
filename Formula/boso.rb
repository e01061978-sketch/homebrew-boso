class Boso < Formula
  desc "Boso AI — self-hosted coding agent. Your box, your model."
  homepage "https://boso.com"
  url "https://ai.boso.com/releases/boso-0.0.6.pyz"
  sha256 "fc84d171a5ab7025b387e05c51034e8a796da4aa784dcdb3456cc9d2423ec524"
  version "0.0.6"

  depends_on "python@3.12"

  def install
    libexec.install "boso-0.0.6.pyz" => "boso.pyz"
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
