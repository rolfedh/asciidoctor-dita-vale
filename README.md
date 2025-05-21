# AsciiDocDITA

**AsciiDocDITA** is a style package for [Vale](https://vale.sh/) that allows you to validate your AsciiDoc content and identify markup that does not have a direct equivalent in DITA 1.3.

## Installation

1.  Install the latest available version of Vale as described in [the official documentation](https://vale.sh/docs/install).
2.  Create a `.vale.ini` file in the main directory of your AsciiDoc project:

    ```ini
    StylesPath = .vale/styles
    MinAlertLevel = warning
    Packages = https://github.com/jhradilek/asciidoctor-dita-vale/releases/latest/download/AsciiDocDITA.zip

    [*.adoc]
    BasedOnStyles = AsciiDocDITA
    ```
3.  Download and install the `AsciiDocDITA` package:

    ```console
    $ vale sync
    ```

## Usage

*   To validate a single AsciiDoc file, run the following command:

    ```console
    $ vale source_file.adoc
    ```
*   To validate all AsciiDoc files in the current directory and all of its subdirectories, run the following command:

    ```console
    $ vale .
    ```
*   To list suggestions that are normally diabled by setting the `MinAlertLevel` option to `warning` in the configuration, run the following command:

    ```console
    $ vale --filter '.Level=="suggestion"' .
    ```
*   Read [the official documentation](https://vale.sh/docs/install) to learn how to use Vale in an editor such as VSCode, Neovim, or Emacs, or run it as a GitHub action.

## Copyright

Copyright © 2025 Jaromir Hradilek

This program is free software, released under the terms of the MIT license. It is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
