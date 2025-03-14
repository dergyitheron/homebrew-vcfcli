# Copyright 2023 VMware, Inc. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

class VcfCli < Formula
  desc "VCF command-line tool"
  homepage "https://github.com/vmware/homebrew-vcfcli"
  version "5.0.0"

  checksums = {
    "darwin-amd64" => "ed4d4c618dcb7caa6008caa4cb235c4c8950e6e00e006be1acfe796dcfaade09",
    "darwin-arm64" => "5838aa5a23c771b7e0e0ddd6d241a8c1eada104806c2dc6d8d117ba3aab1125d",
  }

  $arch = "arm64"
  on_intel do
    $arch = "amd64"
  end

  $os = "darwin"

  url "https://packages.broadcom.com/artifactory/vcf-distro/vcf-cli/#{$os}/#{$arch}/v#{version}/vcf-cli.tar.gz"
  sha256 checksums["#{$os}-#{$arch}"]

  def install
    # Install the VCF CLI
    bin.install "vcf-cli-#{$os}_#{$arch}" => "vcf"
  end

  # This verifies the installation
  test do
    # DO NOT set the eula or ceip values here as they would be persisted
    # for the user's release installation.  Instead, just use commands that
    # don't trigger the prompts.

    assert_match "version: v#{version}", shell_output("#{bin}/vcf version")
    output = shell_output("#{bin}/vcf plugin -h")
    assert_match "Manage CLI plugins", output
  end
end
