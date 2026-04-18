class Boso < Formula
  desc "Boso AI — self-hosted coding agent. Your box, your model."
  homepage "https://boso.com"
  url "https://ai.boso.com/releases/boso-0.0.5.pyz"
  sha256 "adfb301f500c249af7a140d757bd8e8514a76bded66ae6c93139bd477eaa6652"
  version "0.0.5"

  depends_on "python@3.12"

  def install
    libexec.install "boso-0.0.5.pyz" => "boso.pyz"
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
