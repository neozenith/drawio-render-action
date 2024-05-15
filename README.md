# Draw.io Render Action

This GitHub Action renders Draw.io diagrams to PNG files using XVFB.

## Inputs

- `input_path`: The path to the Draw.io files (default: `.`)
- `output_path`: The path to save the rendered PNG files (default: `./output`)

## Example Usage

Add the following file to your repo:

**`.github/workflows/render-drawio.yml`**

```yaml
name: Render Draw.io Diagrams

on:
  push:
    branches:
      - main

jobs:
  render:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Render Draw.io diagrams
      uses: neozenith/drawio-render-action@v1
      with:
        input_path: 'docs/diagrams'
        output_path: 'docs/pngs'

    - name: Upload Artifacts
      uses: actions/upload-artifact@v2
      with:
        name: drawio-pngs
        path: docs/pngs

    # Optional Step to commit rendered files
    # Not necessary when building GH Pages as the generated output
    # gets published as an artifact and not logner need to commit back
    # This is useful if you want up to date diagrams in your GH Markdown files.
    # - name: Commit and Push Rendered Diagrams
    #   run: |
    #     git config --global user.name 'github-actions[bot]'
    #     git config --global user.email 'github-actions[bot]@users.noreply.github.com'
    #     git add .
    #     git commit -m "Render Draw.io diagrams"
    #     git push
    #   env:
    #     GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

## Example Output

![architecture-example](docs/png/architecture-example.png)
