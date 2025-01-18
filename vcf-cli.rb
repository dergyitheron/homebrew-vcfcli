# Copyright 2023 VMware, Inc. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

class VcfCli < Formula
  desc "VCF command-line tool"
  homepage "https://github.com/vmware/homebrew-vcfcli"
  version "3.1.0"

  checksums = {
    "darwin-amd64" => "2884b497e50c1d1c3093ceca7a6c87c0989820695ddc95c4606dde079b8dc413",
    "darwin-arm64" => "70ef64139c51f0e34160a014e68309cf285a894f08d180470026077478594638",
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
