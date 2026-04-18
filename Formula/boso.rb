class Boso < Formula
  desc "Boso AI — self-hosted coding agent. Your box, your model."
  homepage "https://boso.com"
  url "https://ai.boso.com/releases/boso-0.0.12.pyz"
  sha256 "7e0849983f040d0ce2a052629e850bf1df833b6eb7ad07c56c1639a4b305b70f"
  version "0.0.12"

  depends_on "python@3.12"

  def install
    libexec.install "boso-0.0.12.pyz" => "boso.pyz"
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
