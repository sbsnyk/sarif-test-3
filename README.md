# SARIF Upload Test

## Requirements

```shell
brew install gh                          # GitHub CLI
gh extensions install github/gh-codeql   # CodeQL extension for the GitHub CLI

# A valid GitHub personal access token with `Read and Write access to secret scanning alerts and security events`
export GITHUB_TOKEN="..."
```

## Usage

`./upload.sh`

## Remarks
* The included [SARIF file](./code-results.sarif) uses the `relatedLocations` property with appropriate contents to allow referencing other locations from the `message.markdown` property. Note that the [official GitHub documentation](https://docs.github.com/en/code-security/code-scanning/integrating-with-code-scanning/sarif-support-for-code-scanning) does not mention the `markdown` property for result records and instead refers to `message.text`. It seems to work anyway, but might not be the most idiomatic approach.
* GitHub only uses the `partialFingerprints` property (which is optional) and from that calculates the `fingerprints` property internally. The GitHub CLI usually uses as value the `primaryLocationStartColumnFingerprint` (start column) within that dictionary.
* [GitHub docs on partial fingerprints](https://docs.github.com/en/code-security/code-scanning/integrating-with-code-scanning/sarif-support-for-code-scanning#including-data-for-fingerprint-generation)
* [SARIF Spec on partial fingerprints](https://docs.oasis-open.org/sarif/sarif/v2.1.0/cs01/sarif-v2.1.0-cs01.html#_Toc1601261)

