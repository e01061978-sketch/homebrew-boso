class Boso < Formula
  desc "Boso AI — self-hosted coding agent. Your box, your model."
  homepage "https://boso.com"
  url "https://ai.boso.com/releases/boso-0.0.11.pyz"
  sha256 "a91c92c2e4c066dabccc4b23f36554eb996681f9be4148f5f7cd42a8e60a3aa9"
  version "0.0.11"

  depends_on "python@3.12"

  def install
    libexec.install "boso-0.0.11.pyz" => "boso.pyz"
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
