# AsciiDocDITA

**AsciiDocDITA** is a style package for [Vale](https://vale.sh/) that allows you to validate your AsciiDoc content and identify markup that does not have a direct equivalent in DITA 1.3.

In combination with [asciidoctor-dita-topic](https://github.com/jhradilek/asciidoctor-dita-topic) and [dita-convert](https://github.com/jhradilek/dita-custom-xslt), this project can be used to rapidly convert AsciiDoc content to DITA:

1.  Identify incompatible markup in the AsciiDoc source file:

    ```console
    $ vale source_file.adoc
    ```
2.  Convert the AsciiDoc file to a generic DITA topic:

    ```console
    $ asciidoctor -r dita-topic -b dita-topic source_file.adoc
    ```
3.  Convert the generic DITA topic to a specialized DITA concept, reference, or task:

    ```console
    $ dita-convert -gt task source_file.dita
    ```

## Installation

1.  Install the latest available version of Vale as described in [the official documentation](https://vale.sh/docs/install).
2.  Create a `.vale.ini` file in the main directory of your AsciiDoc project:

    ```ini
    StylesPath = .vale/styles
    inAlertLevel = suggestion
    Packages = https://github.com/jhradilek/asciidoctor-dita-vale/releases/latest/download/AsciiDocDITA.zip

    [*.adoc]
    BasedOnStyles = AsciiDocDITA

    # Disable selected rules:
    AsciiDocDITA.ShortDescription = NO
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
*   Read the [the official documentation](https://vale.sh/docs/install) to learn how to use Vale in and editor such as VSCode, Neovim, or Emacs, or run it as a GitHub action.

## Copyright

Copyright © 2025 Jaromir Hradilek

This program is free software, released under the terms of the MIT license. It is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
