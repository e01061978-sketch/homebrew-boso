class Boso < Formula
  desc "Boso AI — self-hosted coding agent. Your box, your model."
  homepage "https://boso.com"
  url "https://ai.boso.com/releases/boso-0.0.21.pyz"
  sha256 "a2a89f22c77f0ce5dba4ee82f54b9433f768c56fcd9915d29515bae4934e366a"
  version "0.0.21"

  depends_on "python@3.12"

  def install
    libexec.install "boso-0.0.21.pyz" => "boso.pyz"
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
