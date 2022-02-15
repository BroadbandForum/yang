## IETF YANG Guidelines {.new-file}

The general principle is that the IETF YANG Guidelines, defined in RFC 8407 @RFC8407, apply in their entirety to BBF YANG modules. However, they are aimed at IETF Standards Track YANG modules and therefore contain some IETF specifics which cannot be taken literally.

* Sections 1 (introduction), 2 (Terminology) and 3 (General Documentation
  Guidelines) are mostly IETF-specific and have little impact on YANG module
  definitions. These sections do not apply unless specifically noted.

* Section 4 (YANG Usage Guidelines) is mostly IETF-independent and has major
  impact on YANG module definitions. This section applies unless specifically
  noted.

* Sections 5 (IANA Considerations), 6 (Security Considerations), 7
  (Acknowledgements), 8 (References) and Appendices A (Module Review Checklist)
  and B (YANG Module Template) are mostly IETF-specific and have little impact
  on YANG module definitions. These sections do not apply unless specifically
  noted.

### IETF-1: YANG Terms

*This requirement extends section [2.2](https://datatracker.ietf.org/doc/html/rfc8407#section-2.2) of RFC 8407 @RFC8407.*

BBF YANG modules MUST use YANG terminology, e.g. when used in descriptions the terms SHOULD refer to "data nodes", "containers", "lists", etc. For example, do not use the term "objects" and instead refer to "data nodes".

### IETF-2: YANG Validation

*This requirement overrides section [3.10](https://datatracker.ietf.org/doc/html/rfc8407#section-3.10) of RFC 8407 @RFC8407.*

BBF YANG modules MUST be validated using pyang 2.3.2 (or later). Validation MUST use the various "lint" options described below.

```
  --lint
  --lint-modulename-prefix=bbf
  --lint-namespace-prefix=urn:bbf:yang:
  --max-line-len=70
```

pyang can be installed via [PyPi](https://pypi.org/).

The GitHub version of the pyang tool is available at [https://github.com/mbj4668/pyang](https://github.com/mbj4668/pyang)

There is a docker image available that contains an installation of pyang, yanglint and yanger. This image may, at times, include a newer version of pyang than is stated in this guideline.
[https://hub.docker.com/r/broadbandforum/yangtools](https://hub.docker.com/r/broadbandforum/yangtools)

### IETF-3: YANG Usage Guidelines

*This requirement restates section [4](https://datatracker.ietf.org/doc/html/rfc8407#section-4) of RFC 8407 @RFC8407 in the context of the BBF.*

BBF YANG modules comply with all syntactic and semantic requirements of YANG 1.1 @RFC7950.

### IETF-4: File Layout

*This requirement overrides section [5.2](https://datatracker.ietf.org/doc/html/rfc7950#section-5.2) of RFC 7950 @RFC7950.*

Each BBF YANG module or submodule MUST be stored in a file called <module-name\>.yang or <submodule-name\>.yang. BBF YANG modules and submodules will not be stored with the revision-date in the name.

### IETF-5: Quoting

*This requirement is an extension to section [6.1.3](https://datatracker.ietf.org/doc/html/rfc7950#section-6.1.3) of RFC 7950 @RFC7950.*

The rules specified in this Section effectively mean that the second and subsequent lines of multi-line strings have to be aligned under the character following the opening double quote.

```
  leaf multi-line-example {
    type string;
    description
      "This is the first line of a multi-line string.
       This is the alignment of the second and subsequent lines.";
  }
```

### IETF-6: Module Naming Conventions

*This requirement overrides section [4.1](https://datatracker.ietf.org/doc/html/rfc8407#section-4.1) of RFC 8407 @RFC8407.*

<module-name\> or <submodule-name\> is the module name or submodule name, which (see below) MUST begin with the prefix “bbf-”.

The remainder of the section applies with appropriate translations of IETF terms to BBF terms, e.g. “IETF” and “IANA” are read as “BBF”, and the “ietf-” prefix is read as “bbf-”.

### IETF-7: Module Header, Meta and Revision Statements

*These requirements override section [4.8](https://datatracker.ietf.org/doc/html/rfc8407#section-4.8) of RFC 8407 @RFC8407.*

#### namespace
See IETF-9.

#### organization
MUST be of the form:

```
  Broadband Forum <https://www.broadband-forum.org>
  <work area name> Work Area";
```

or

```
  Broadband Forum <https://www.broadband-forum.org>
  <project stream name> Project Stream";
```

#### contact
MUST use the following text:

```
  Comments or questions about this Broadband Forum YANG module
  should be directed to <mailto:info@broadband-forum.org>.
```

Followed by:

 - Editor name(s) and affiliation(s)
 - Project Stream Leader name(s) and affiliation(s) - omit if not Project Stream Leader
 - Work Area Director name(s) and affiliation(s)

```
  Editor:      <name>, <company>
  
  Editor:      <name>, <company>
  
  PS Leader:   <name>, <company>
  
  PS Leader:   <name>, <company>
  
  WA Director: <name>, <company>
  
  WA Director: <name>, <company>
```
  
#### description
See IETF-8.

#### revision
The requirements from RFC 8407 apply with the following modifications:

 - The requirements relating to the reference substatement are replaced with a requirement to reference the associated TR Issue, Amendment(if any) and Corrigendum.
 - The requirements relating to reuse of the same revision statement within unpublished versions are reworded to refer only to "versions" and not to "Internet-Drafts".
 
References to associated TRs use "full" TR names, e.g. "TR-181 Issue 2 Amendment 42 Corrigendum 156". 


### IETF-8: Module Header, Meta and Revision Statements - Top Level Description

*This requirement overrides section [4.8](https://datatracker.ietf.org/doc/html/rfc8407#section-4.8) of RFC 8407 @RFC8407.*

The top-level description MUST contain the following:

 - Summary
 - BBF Notice Section
 
### IETF-9: Namespace Assignments

*This requirement overrides section [4.9](https://datatracker.ietf.org/doc/html/rfc8407#section-4.9) of RFC 8407 @RFC8407.*

Section 4.9 applies with appropriate translations of IETF terms to BBF terms, e.g. "IANA" is read as "BBF" and "non-Standards-Track" is read as "example" or "not-for-publication".

BBF YANG module namespace MUST be of the form:

```
  urn:bbf:yang:<module-name>
```

 
### IETF-10: Prefixes - Imported Modules

*This requirement extends section [4.2](https://datatracker.ietf.org/doc/html/rfc8407#section-4.2) of RFC 8407 @RFC8407.*

Imported modules MUST have the same prefix defined in the module they are imported into as is defined in the imported module.

Example:

```
  module bbf-example1 {
    namespace "urn:bbf:yang:bbf-example1";
    prefix bbf-ex1;
    ...
``` 
``` 
  module bbf-example2 {
    namespace "urn:bbf:yang:bbf-example2";
    prefix bbf-ex2;
 
    import bbf-example1 {
      prefix bbf-ex1;  //same prefix as defined in the module, bbf-example1.
    }
    ...
```

### IETF-11: Prefixes - Usage

*These requirements restate section [4.2](https://datatracker.ietf.org/doc/html/rfc8407#section-4.2) of RFC 8407 @RFC8407.*

The following apply to prefix usage of the local module:

 - The local module prefix SHOULD be used instead of no prefix in all path expressions.
 - The local module prefix MUST be used instead of no prefix in all default statements for an identityref or instance-identifier data type.
 - The local module prefix MAY be used for references to typedefs, groupings, extensions, features and identities defined in the module.

### IETF-12: Identifier Naming Conventions

*The following extends section [4.3.1](https://datatracker.ietf.org/doc/html/rfc8407#section-4.3.1) of RFC 8407 @RFC8407.*

These guidelines are stronger than the IETF guidelines because they do not allow upper-case characters and the underscore character:

 - Only lower-case letters, numbers, dashes "-" and dots "." MUST be used in identifier names.
 - Identifiers SHOULD include complete words and/or well-known acronyms or abbreviations. There are some exceptions to this for performance reasons. See BBF-5 for further guidelines.

### IETF-13: Conditional Statements

*The following reiterates section [4.5](https://datatracker.ietf.org/doc/html/rfc8407#section-4.5) of RFC 8407 @RFC8407.*

As stated, conditional requirements for data nodes must be documented somewhere. Where possible, use YANG modeled constraints such as an 'if-feature' to make nodes explicitly optional or a 'when' statement to constrain data based on other data nodes. At a minimum, the description should be used to convey a constraint which cannot be modeled.

### IETF-14: Conditional Augment Statements

*The following reiterates section [4.19.1](https://datatracker.ietf.org/doc/html/rfc8407#section-4.19.1) of RFC 8407 @RFC8407.*

Section 4.19.1 states that the augment statement is often used together with the 'when' statement and/or 'if-feature' statement to make the augmentation conditional on some portion of the data model.

Where possible, all BBF YANG models SHOULD apply either 'when' or 'if-feature' statements to each augment.

### IETF-15: Import or Include By Revision

*The following replaces statements in section [4.7](https://datatracker.ietf.org/doc/html/rfc8407#section-4.7) of RFC 8407 @RFC8407 regarding the use of the 'revision-date' substatement.*

BBF YANG modules MUST NOT use 'revision-date' on import and include statements. 

### IETF-16: Legal Characters in YANG Modules

*The following replaces portions of section [6](https://datatracker.ietf.org/doc/html/rfc7950#section-6) of RFC 7950 @RFC7950.*

BBF YANG modules MUST be written using only printable ASCII characters.

### IETF-17: Prefix on "belongs-to" Statements

*The following extends section [4.2](https://datatracker.ietf.org/doc/html/rfc8407#section-4.2) of RFC 8407 @RFC8407.*

In a submodule, the prefix defined for the parent module in the 'belongs-to' statement MUST match the prefix defined in the parent module for itself.

```
  module bbf-example1 {
    namespace "urn:bbf:yang:bbf-example1;
    prefix bbf-ex1;
 
    include bbf-example1-sub1;
    ...
```   
```   
  submodule bbf-example1-sub1 {
    belongs-to bbf-example1;
      prefix bbf-ex1;
    }
    ...
```

### IETF-18: 'error-message' sub-statement to the 'must' statement

*This requirement overrides section [7.5.4.1](https://datatracker.ietf.org/doc/html/rfc7950#section-7.5.4.1) of RFC 7950 @RFC7950.*

The ‘error-message’ sub-statement MUST be provided to ‘must’ statements in configuration data nodes for proper communication of the constraint validation failure.

### IETF-19: 'description' sub-statement to the 'must' statement

*This requirement overrides section [7.5.4](https://datatracker.ietf.org/doc/html/rfc7950#section-7.5.4) of RFC 7950 @RFC7950.*

The ‘description’ sub-statement MUST be provided to the ‘must’ statement for proper communication of the intent of the statement.

### IETF-20: Tabs and Spacing

*This requirement is an extension to section [6.1.3](https://datatracker.ietf.org/doc/html/rfc7950#section-6.1.3) of RFC 7950 @RFC7950.*

BBF YANG modules MUST NOT contain any tab characters and MUST use 2 space characters for indentation.


