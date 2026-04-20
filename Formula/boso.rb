class Boso < Formula
  desc "Boso AI — self-hosted coding agent. Your box, your model."
  homepage "https://boso.com"
  url "https://ai.boso.com/releases/boso-0.2.1.pyz"
  sha256 "954d9da53098ec340f7afb08e582325fca6045ec5144e697f19d5fa0d271ea3e"
  version "0.2.1"

  depends_on "python@3.12"

  def install
    libexec.install "boso-0.2.1.pyz" => "boso.pyz"
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
