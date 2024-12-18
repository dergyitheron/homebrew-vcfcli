# homebrew-vcfcli
Homebrew tap for the VCF CLI

## Installation

```console
brew tap vmware/homebrew-vcfcli # Only needs to be done once for the machine

brew install vcf-cli
```

To upgrade to a new release: `brew update && brew upgrade vcf-cli`

To uninstall: `brew uninstall vcf-cli`

### Installing a Specific Version

At the time of writing, Homebrew only officially supported installing the
latest version of a formula, however the following workaround allows to install
a specific version by first extracting it to a local tap:

```console
# Assuming that following the above mentioned commands, a latest version is installed, say v2.1.0.
# User needs to install an older version, say v1.1.0
brew tap-new local/tap
brew extract --version=1.1.0 vmware/homebrew-vcfcli/vcf-cli local/tap
brew install vcf-cli@1.1.0
brew unlink vcf-cli
brew link --overwrite vcf-cli@1.1.0

# To uninstall such an installation and activate the latest version again
brew uninstall vcf-cli@1.0.0
brew link vcf-cli
```
