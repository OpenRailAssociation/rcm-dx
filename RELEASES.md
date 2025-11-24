# Releases

After reviews are completed and changes are approved by the committee, a new release will be issued. Due to the project being stable, releases will be infrequent.

## Release process

The PDF version of the specification will automatically be built when a new release is being tagged.
To tag a new release follow these steps:

1. Open the new release page: https://github.com/OpenRailAssociation/rcm-dx/releases/new
2. Click on "Tag: Select tag"
3. Click on "Create new tag"
4. Enter the version with `v` as a prefix, e.g. `v2.0.5` and click on "Create"
5. Add a title for the release
6. Describe the changes which are part of this release
7. Ensure that the "Set as the latest release" checkbox is activated
8. Click in "Publish release"

To add the PDF to the release afterwards follow these steps:

1. Open the Actions tab: https://github.com/OpenRailAssociation/rcm-dx/actions
2. Click on the most recent worflow run and scroll to the bottom of the page to "Artifacts"
3. Download the "RCM-DX-Specification_EN" artifact
4. Unpack the ZIP and extract the file `RCM-DX-Specification_EN.pdf`
5. Open the release you created previously and press the edit button (🖉)
6. Add the PDF as an asset to the release
7. Press the "Update release" button
