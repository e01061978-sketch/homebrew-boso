class Boso < Formula
  desc "Boso AI — self-hosted coding agent. Your box, your model."
  homepage "https://boso.com"
  url "https://ai.boso.com/releases/boso-0.0.17.pyz"
  sha256 "76547e99222fad0c1d8da1e28925e709d1cd1a71f79adec9ddebf93cb3fd46d1"
  version "0.0.17"

  depends_on "python@3.12"

  def install
    libexec.install "boso-0.0.17.pyz" => "boso.pyz"
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
