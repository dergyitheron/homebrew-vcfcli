# Copyright 2023 VMware, Inc. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

class VcfCli < Formula
  desc "VCF command-line tool"
  homepage "https://github.com/vmware/homebrew-vcfcli"
  version "9.0.1"

  checksums = {
    "darwin-amd64" => "a0e5c52e5869ba9b40293022fa9c33b9dd91bdc7efca396789f9836999bf9bcf",
    "darwin-arm64" => "8ea88dfb046f189cc8c6f63a8a01b0e8f5c79e8e1b01b6dd3ae862d9d8abe245",
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
