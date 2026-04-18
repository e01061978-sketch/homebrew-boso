class Boso < Formula
  desc "Boso AI — self-hosted coding agent. Your box, your model."
  homepage "https://boso.com"
  url "https://ai.boso.com/releases/boso-0.0.2.pyz"
  sha256 "1cb6a5f1f409eb38299a162c94aae9c0affa41c99b2b4bbde132ad788cda55ba"
  version "0.0.2"

  depends_on "python@3.12"

  def install
    libexec.install "boso-0.0.2.pyz" => "boso.pyz"
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
