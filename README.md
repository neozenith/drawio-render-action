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
```
