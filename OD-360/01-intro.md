---
bbfNumber: OD-360
bbfTitle: BBF YANG Best Current Practices
bbfIssue: Issue
bbfVersion: 1 Amendment 1
bbfMonth: March
bbfYear: 2023
bbfType: document
bbfStatus:
bbfContrib:

# information shown on each page header
siteurl: index.html
project: Broadband Forum YANG Modules
tagline: A set of YANG modules for managing access networks

# this removes the release number from the default subtitle
subtitle: '%bbfIssue%: %bbfVersion% %bbfStatus%'

# don't display these in the banner
version: ''
status: ''

# information shown in the footer
reponame: yang
repodesc: '%project%'

# don't number sections (guidelines are already numbered manually)
numberSections: false

buttons:
- label: HTML
  title: OD-360 Single-file HTML
  url: index.htm
- label: PDF
  title: OD-360 PDF
  url: index.pdf
- label: YANG Modules
  title: YANG modules on GitHub
  url: https://github.com/BroadbandForum/%reponame%

bbfRevisionHistory:
- number: Issue 1
  approval: 15 February 2022
  publication: 15 February 2022
  editors: |
      Joey Boyd, Adtran
  changes: Original
- number: Issue 1 Amendment 1
  approval: 15 March 2023
  publication: 15 March 2023
  editors: |
      Joey Boyd, Adtran
  changes: Add 'units' statement guidelines
...

!include cover-page.md

!include od-notice.md

!include front-matter.md

# References

::: {#refs} :::
:::

# Overview

OD-360 provides a set of Best Current Practices for development of YANG Data Models in the Broadband Forum (BBF). The approach taken in establishing a set of best current practices is to utilize existing practices where those are relevant to the work of the Forum.

## YANG Language Version

The BBF has adopted YANG 1.1 @RFC7950 for use in all BBF YANG Data Models.

# YANG Guidelines

These YANG guidelines are organized as follows:

* Those based on IETF YANG Guidelines
* Additional BBF-specific guidelines

## Terminology

Throughout these guidelines, the term module can be used as a generic term for
a YANG module or submodule. When describing properties that are specific to
submodules, the term submodule is used instead.

## Template

New YANG modules MAY be created from the BBF template as shown here:
[bbf-template.yang](https://wiki.broadband-forum.org/display/BBF/OD-360%3A+YANG+Module+Template).
This template is based on the IETF YANG module template defined in the IETF YANG
Guidelines.
