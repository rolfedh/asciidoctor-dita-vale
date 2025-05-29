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

    # Disable certain rules:
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
*   To list suggestions that are normally diabled by setting the `MinAlertLevel` option to `warning` in the configuration, run the following command:

    ```console
    $ vale --filter '.Level=="suggestion"' .
    ```
*   Read [the official documentation](https://vale.sh/docs/install) to learn how to use Vale in an editor such as VSCode, Neovim, or Emacs, or run it as a GitHub action.

## Available rules

### Errors

The following rules have their severity set to `error`. The AsciiDoc markup reported by these rules causes the conversion tooling to produce invalid DITA output.

| Vale Rule | Explanation |
| --- | --- |
<a id="entityreference"></a>
| EntityReference | DITA 1.3 supports five character entity references defined in the XML standard: `&amp;`, `&lt;`, `&gt;`, `&apos;`, and `&quot;`. Replace any other character entity references with an appropriate [built-in AsciiDoc attribute](https://docs.asciidoctor.org/asciidoc/latest/attributes/character-replacement-ref/). |
<a id="exampleblock"></a>
| ExampleBlock | DITA 1.3 allows the `<example>` element to appear only within the main body of the topic. Do not use [example blocks](https://docs.asciidoctor.org/asciidoc/latest/blocks/example-blocks/) in sections, within other blocks, or as part of lists. |
<a id="taskexample"></a>
| TaskExample | DITA 1.3 allows only one `<example>` element in a task topic. If multiple examples are needed, combine them in a single [example block](https://docs.asciidoctor.org/asciidoc/latest/blocks/example-blocks/). |
<a id="tasksection"></a>
| TaskSection | DITA 1.3 does not allow [sections](https://docs.asciidoctor.org/asciidoc/latest/sections/titles-and-levels/) in a task topic. If a section is needed, move it to a separate file. |

### Warnings

The following rules have their severity set to `warning`. The AsciiDoc markup reported by these rules causes the conversion tooling to issue a warning, but does not produce invalid DITA output.

| Vale Rule | Explanation |
| --- | --- |
<a id="admonitiontitle"></a>
| AdmonitionTitle | In DITA 1.3, the `<note>` element cannot have a title. Do not assign block titles to [admonitions](https://docs.asciidoctor.org/asciidoc/latest/blocks/admonitions/). |
<a id="audiovideo"></a>
| AudioVideo | The conversion tooling does not implement [audio and video](https://docs.asciidoctor.org/asciidoc/latest/macros/audio-and-video/) macros. |
<a id="authorline"></a>
| AuthorLine | AsciiDoc interprets the first line that directly follows the document title as an author line. Add an empty line after the document title. |
<a id="blocktitle"></a>
| BlockTitle | In DITA 1.3, only the `<example>`, `<fig>`, and `<table>` elements can have a title. Do not assign [block titles](https://docs.asciidoctor.org/asciidoc/latest/blocks/add-title/) to other blocks such as paragraphs, lists, or code blocks. |
<a id="contenttype"></a>
| ContentType | Without a clear content type definition, the Vale style cannot reliably report problems related to procedure modules such as `TaskSection` or `TaskExample`. Add the correct `:_mod-docs-content-type:` definition at the top of the file. |
<a id="crossreference"></a>
| CrossReference | DITA 1.3 does not allow cross references to IDs that are defined outside of the current document. If the referenced ID is not defined within the same file, replace the cross reference with the [document to document](https://docs.asciidoctor.org/asciidoc/latest/macros/inter-document-xref/) cross reference. |
<a id="discreteheading"></a>
| DiscreteHeading | DITA 1.3 does not support discrete headings. Depending on your use case, use [a description list](https://docs.asciidoctor.org/asciidoc/latest/lists/description/), [a level 1 section](https://docs.asciidoctor.org/asciidoc/latest/sections/titles-and-levels/), or move the content to a separate file. |
<a id="equationformula"></a>
| EquationFormula | The conversion tooling does not implement [LaTeX and AsciiMath](https://docs.asciidoctor.org/asciidoc/latest/stem/) formulas. |
<a id="linebreak"></a>
| LineBreak | DITA 1.3 does not support forced line breaks. Split the text in multiple [paragraphs](https://docs.asciidoctor.org/asciidoc/latest/blocks/paragraphs/) and add [the `a` operator](https://docs.asciidoctor.org/asciidoc/latest/tables/format-cell-content/#a-operator) inside of tables. |
<a id="nestedsection"></a>
| NestedSection | DITA 1.3 allows the `<section>` element to appear only within the main body of the topic. If [a level 2 section](https://docs.asciidoctor.org/asciidoc/latest/sections/titles-and-levels/) is needed, move it to a separate file. |
<a id="pagebreak"></a>
| PageBreak | DITA 1.3 does not support page breaks. If visual separation of the text is needed, rewrite your content without using a [page break](https://docs.asciidoctor.org/asciidoc/latest/blocks/breaks/#page-breaks). |
<a id="relatedlinks"></a>
| RelatedLinks | In DITA 1.3, the `<related-links>` element can only contain links. Remove lines that do not contain [a link](https://docs.asciidoctor.org/asciidoc/latest/macros/links/) or [a cross reference](https://docs.asciidoctor.org/asciidoc/latest/macros/xref/), and remove any text that precedes or follows a link or a cross reference. |
<a id="sidebarblock"></a>
| SidebarBlock | DITA 1.3 does not support sidebar content. If visual separation of the text is needed, rewrite your content without using [a sidebar block](https://docs.asciidoctor.org/asciidoc/latest/blocks/sidebars/). |
<a id="tablefooter"></a>
| TableFooter | DITA 1.3 does not support table footers. Rewrite your content without using [a table footer](https://docs.asciidoctor.org/asciidoc/latest/tables/add-footer-row/#assign-footer-to-the-last-row). |
<a id="taskduplicate"></a>
| TaskDuplicate | DITA 1.3 expects task topics to be composed of the following optional elements: `<prereq>`, `<context>`, `<steps>` or `<steps-unordered>`, `<result>`, `<tasktroubleshooting>`, `<example>`, and `<postreq>`. These elements directly correspond to the following [block titles](https://docs.asciidoctor.org/asciidoc/latest/blocks/add-title/) in AsciiDoc: *Prerequisite*/*Prerequisites*, *Procedure*, *Verification*/*Result*/*Results*, *Troubleshooting*/*Troubleshooting step*/*Troubleshooting steps*, and *Next step*/*Next steps*. Because each element can appear only once in a DITA task, duplicate titles are not allowed. Remove any duplicate titles or combine them into one. |
<a id="taskstep"></a>
| TaskStep | DITA 1.3 allows only one `<steps>` or `<steps-unordered>` element in a task topic. Verify that any content that follows the *Procedure* block title is part of a single [ordered](https://docs.asciidoctor.org/asciidoc/latest/lists/ordered/) or [unordered list](https://docs.asciidoctor.org/asciidoc/latest/lists/unordered/). |
<a id="tasktitle"></a>
| TaskTitle | DITA 1.3 expects task topics to be composed of the following optional elements: `<prereq>`, `<context>`, `<steps>` or `<steps-unordered>`, `<result>`, `<tasktroubleshooting>`, `<example>`, and `<postreq>`. These elements directly correspond to the following [block titles](https://docs.asciidoctor.org/asciidoc/latest/blocks/add-title/) in AsciiDoc: *Prerequisite*/*Prerequisites*, *Procedure*, *Verification*/*Result*/*Results*, *Troubleshooting*/*Troubleshooting step*/*Troubleshooting steps*, and *Next step*/*Next steps*. In addition, the *Additional resources* block title directly maps to the `<related-links>` element. Do not use any other block titles. |
<a id="thematicbreak"></a>
| ThematicBreak | DITA 1.3 does not support thematic breaks. If visual separation  of the text is needed, rewrite your content without using [a thematic break](https://docs.asciidoctor.org/asciidoc/latest/blocks/breaks/#thematic-breaks). |

### Suggestions

The following rules have their severity set to `suggestion`. These are convenience rules and do not report problems with the AsciiDoc markup.

| Vale Rule | Explanation |
| --- | --- |
<a id="attributereference"></a>
| AttributeReference | Lists all [attribute references](https://docs.asciidoctor.org/asciidoc/latest/attributes/reference-attributes/) in the file. Use this information to decide which attribute definitions to supply during conversion. |
<a id="conditionalcode"></a>
| ConditionalCode | Lists all `ifdef`, `ifndef`, and `ifeval` [conditional statements](https://docs.asciidoctor.org/asciidoc/latest/directives/conditionals/) in the file. Use this information to decide which attribute definitions to supply during conversion. |
<a id="shortdescription"></a>
| ShortDescription | Suggest assigning `[role="_abstract"]` to a paragraph you want to convert to the `<shortdesc>` element in DITA. |

## Copyright

Copyright © 2025 Jaromir Hradilek

This program is free software, released under the terms of the MIT license. It is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
