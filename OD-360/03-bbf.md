## BBF YANG Guidelines {.new-file}

This section adds BBF-specific guidelines that go beyond the scope of the IETF
YANG Guidelines.

### BBF-1: Use of IANA/IETF YANG Modules

BBF YANG modules MUST use standard IANA/IETF YANG modules whenever possible. In
this context, "use" implies adherence to the letter and spirit of such modules
and of their defining RFCs.

Individual Working Text documents MUST reference the standard models which
are applicable.

### BBF-2: Line Length

The length of each line of text in a YANG module MUST not exceed 70 characters.

### BBF-3: Deviations

Deviations MUST NOT be used in BBF YANG modules.

However, deviations can be used alongside BBF YANG modules as described in the section BBF Deviation Guidelines.

### BBF-4: Short Names

Lists and leaf-lists may have many elements resulting in large amounts of data present on the line. For XML encoding, the name of each node appears twice for every element of the list or leaf-list. Although IETF-12 states that identifiers SHOULD include complete words, the expedient use of short names SHOULD be imposed to shorten on-the-wire messaging and improve efficiency. 

### BBF-5: Descriptions and References

All descriptions MUST read as sentences or sentence fragments containing proper capitalization and punctuation, e.g., ending with periods. However, [reference statements](#bbf-25-reference-statements) need not meet this requirement and do not need to terminate with a period.

### BBF-6: Special Values

Special values SHOULD be parameterized in an enumeration as part of a union with the normal values.

Enumerations SHOULD NOT be used in cases where a special value means "XXX or less" or "YYY or more".

Example:

```
  typedef snr-margin {
    type union {
      type enumeration {
        enum "undetermined" {
          description
            "Indicates the value is not determined.";
        }
      }
      type int16 {
        range "-511..511";
      }
    }
    description
      "Reports the signal-to-noise ratio margin. A first special value
       (undetermined) indicates that the signal-to-noise ratio margin
       is undetermined. A second special value (-511) indicates that
       the signal-to-noise ratio margin is less than or equal to -51.1
       dB. A third special value (+511) indicates that the
       signal-to-noise ratio margin is greater than or equal to
       +51.1dB.";
```
In the above example, -511 refers to a value less than or equal to -51.1; +511 refers to a value greater than or equal to +51.1 and the enum "undetermined" refers to a value which is undetermined.

### BBF-7: Paragraph Separation in Description Statements

For description statements which contain multiple paragraphs, each paragraph SHOULD be separated using a blank line.

Example:
```
  description
    "This is the first paragraph of the description.
   
     This is the second paragraph of the description.";
```

### BBF-8: Revision Statements

Superseded by BBF-15.

### BBF-9: Explicit Modeling

Where YANG allows something or some behavior to be explicitly modeled (e.g., enumerations, range, units, must, etc.) then this SHOULD always be done. Mandatory requirements in descriptions SHOULD be used only where it is not possible or practical to use formal YANG modeling to convey the requirement.

Example:
```
  leaf forwarder {
    type bbf-l2-fwd:forwarder-ref;
    description
      "A reference to a forwarder.

       The following is a constraint that could not be captured in
       YANG: multiple Maintenance Groups referencing the same
       forwarder are allowed, but only if they have a different
       level.

       Note that there is no BBF requirement for multiple levels
       with up-MEPs. Within BBF context multiple levels on a
       forwarder go together with one level using up-MEPs and a
       higher level using MIPs.";
  }
```

### BBF-10: Retroactive Application of OD-360 Guidelines

OD-360 guidelines MAY be retroactively applied to published BBF YANG modules but MUST NOT be applied if the resulting change is backward incompatible with the previously published version. For example, an existing node named using an underscore '_' instead of a dash '-' MUST NOT be changed in published module as the resulting renaming is not backward compatible.

### BBF-11: Multi-word Identifiers

YANG identifiers which represent multiple words, e.g., target margin, SHOULD use a dash between the normally whitespace separated words, e.g., 'target-margin'.

### BBF-12: Acronyms in Description Statements

Acronyms can be used in description statements. However, the first instance of the acronym in a description statement SHOULD have its meaning clearly conveyed.

For example:
```
  leaf cbs {
    type bbf-qos-plc-tp:burst-size;
    description
      "Committed Burst Size (CBS) defines the amount of traffic
       that can be admitted above the Committed Information Rate
       (CIR) and considered green.";
  }
```

### BBF-13: Abbreviations in Description Statements

Abbreviations can be used in description statements. However, the first instance of the abbreviation in a description statement SHOULD have its meaning clearly conveyed.

### BBF-14: Creating and/or Extending BBF YANG Models

This guideline defines the best practices when defining a new BBF YANG model and/or having BBF extend an existing (BBF or non-BBF) YANG model.

When creating or editing BBF YANG models, the following use cases apply:

 1. **Requirements that are captured in a Broadband Forum Technical Report**:
In this case, the BBF YANG model should meet the requirement set forward in the Technical Report.
For example, the models contained in TR-383 build on the requirements of TR-101/156/167/301.

 2. **Requirements (or information models) that are captured in standards documents published by other SDOs and referenced from a Broadband Forum Technical Report, for which the other SDO is not developing a YANG model**:
In this case, the BBF YANG data model should reference the applicable standard and be able to meet the requirement(s) from that document.
For example, the TR-355 G.fast YANG model contains attributes defined in ITU-T Recommendation G.997.2.

 3. **A model requirement which is not formulated as required, or not formulated at all, for the specific use case in a Broadband Forum Technical Report or a standard published by another SDO**:
In this case, the following guidelines apply:

    1. First, the requirement must be formulated based on inputs brought forward to the BBF (i.e., a contribution explaining the need for the requirement).

    2. There must be consensus among the participants in the Work Area/Project Stream to move forward with this requirement.

    3. It is desirable, but not mandatory, for the requirements to be captured in a BBF Technical Report. However, that should not hold up putting the requirement in the YANG model. In other words, if the Work Area agrees that something should be added in a BBF YANG model, then we do not need to wait until the requirement is captured in a Technical Report.

    4. The new requirement must not deviate from any existing requirements in BBF Technical Reports.

    5. The new requirement must be reviewed by any Work Area(s) or Project Stream(s) for which it is clearly applicable (e.g., a PON related requirement is to be reviewed by the FAN WA).

### BBF-15: YANG Model Revisions and License

BBF YANG Models are available in three possible states:

 - Published: Models are made available to the public in GitHub and are associated with a Technical Report.
 - Draft: Models are made available to the public in GitHub and are associated with a draft Working Text.
 - Development: Models are made available to members in Bitbucket while they are in development.

In order to allow BBF members to consume BBF YANG models in any state, the following apply with regards to revision statements and license text.

#### Published

Each published module and submodule SHALL:

 - have a new, if previously published, or initial revision statement containing the TR publication date as the revision date. All submodules associated with a module SHALL have the same revision date as the parent module regardless of whether they were changed.
 - maintain all revision statements from previously published revisions.
 - contain the standard BBF software license with correct copyright year(s). 

#### Draft

Each draft module and submodule SHALL:

 - have a new, if previously published, or initial revision statement containing the draft publication date as the revision date. All submodules associated with a module SHALL have the same revision date as the parent module regardless of whether they were changed.
 - maintain all revision statements from previously published revisions.
 - contain the draft BBF software license with correct copyright year(s). 

#### Development

Each development module and submodule SHALL:

 - have a new, if previously published, or initial revision statement containing the date of the end of the review period of the last pull request that contained the module and/or submodule. All submodules associated with a module SHALL have the same revision date as the parent module regardless of whether they were changed as part of the recent pull request.
 - maintain all revision statements from previously published revisions.
 - contain the standard BBF software license with correct copyright year(s). 
 
The end of the license must state the following (replacing xxx with the Working Text number):

```
  This version of this YANG module is part of WT-xxx; see
  the WT itself for full legal notices.";
```
 
The format of the revision statement in a development module shall be as follows:

```
  revision 2021-09-03 {
    description
      "TBD
       * Approval Date:    TBD.
       * Publication Date: TBD.";
    reference
      "TBD";
  }
```

### BBF-16: Enum Naming

All enums in an enumeration SHOULD be named using names that describe their functional meaning rather than something ambiguous such as an integer string, "1".

For example, this definition is preferred
```
  leaf ra-mode {
    type enumeration {
      enum manual {
        description
          "Mode 1 = MANUAL.";
      }
      enum at-init {
        description
          "Mode 2 = AT_INIT.";
      }
      enum dynamic {
        description
          "Mode 3 = DYNAMIC.";
      }
      enum dynamic-with-sos {
        description
          "Mode 4 = DYNAMIC with SOS.";
      }
    }
```
over this one.
```
  leaf ra-mode {
    type enumeration {
      enum 1 {
        description
          "Mode 1 = MANUAL.";
      }
      enum 2 {
        description
          "Mode 2 = AT_INIT.";
      }
      enum 3 {
        description
          "Mode 3 = DYNAMIC.";
      }
      enum 4 {
        description
          "Mode 4 = DYNAMIC with SOS.";
      }
    }
```

### BBF-17: Value Statements

When modeling an enumeration where each enum corresponds to an integer value specified by a underlying standard specification, a model MAY choose to model those values in the 'value' statement.

The 'value' carries no meaning via NETCONF nor RESTCONF but is used for an implementation and reference aid.

For an enumeration whose underlying values are 0..n, the 'value' statements are not necessary as all enums have an implied value if not explicitly specified. The implied values begin with 0 and increment by 1 for each enum in the enumeration.
```
  leaf ra-mode {
    type enumeration {
      enum manual {
        value 1;
        description
          "Mode 1 = MANUAL.";
      }
      enum at-init {
        value 2;
        description
          "Mode 2 = AT_INIT.";
      }
      enum dynamic {
        value 3;
        description
          "Mode 3 = DYNAMIC.";
      }
      enum dynamic-with-sos {
        value 4;
        description
          "Mode 4 = DYNAMIC with SOS.";
      }
    }
```

### BBF-18: Prefix on 'if-feature' Statements

An 'if-feature' statement on any node defined within a top level grouping which depends on a 'feature' that is defined in the same module as the grouping MUST use the prefix on the feature name contained within the 'if-feature' statement.

```
  module bbf-availability {
    yang-version 1.1;
    namespace "urn:bbf:yang:bbf-availability";
    prefix bbf-avail;
    ...
   
    feature availability {
      description
        "Indicates support for retrieving availability of resources.";
    }
   
    ...
   
    grouping availability {
      description
        "Defines the availability of entities.";
   
      container availability {
        if-feature "bbf-avail:availability";
        presence
          "If present, this container indicates supports for
           retrieving the availability of the entity for which it is
           used.";
        config false;
        description
          "Operational status defining the availability of an
           entity.";
   
        uses availability-parameters;
      }
    }
   
    ...
  }    
```

### BBF-19: Default Case of a Choice Statement - Empty Typed Leaf

*This requirement is derived from section [7.9.3](https://datatracker.ietf.org/doc/html/rfc7950#section-7.9.3) and section [9.11](https://datatracker.ietf.org/doc/html/rfc7950#section-9.11) of RFC 7950 @RFC7950.*

The default case of a choice statement MUST not contain a sole descendant leaf node of type "empty".

Section 7.9.3 states that "The default case is only important when considering the 'default' statements of nodes under the cases (i.e., default values of leafs and leaf-lists, and default cases of nested choices)." It also states that "The default values and nested default cases under the default case are used if none of the nodes under any of the cases are present.".

Section 9.11 states that an empty type cannot have a default value

In the example below, the choice 'manual' has a leaf with an empty type as the only child node. Since an empty leaf cannot have a default value, the behavior of an <edit-config\> request that creates the  'transfer' container without providing any data for the choice 'how' will be the same irrespective of whether the default 'manual' statement is present or not.

The leaf 'manual' will not be created.

```
  container transfer {
    description
      "Configuration associated with the timing
       of a transfer.";
   
    choice how {
      default manual;
      description
        "Transfer timing methods.";
   
      case interval {
        leaf interval {
          type uint16;
          units minutes;
          default 30;
          description
            "Transfer every 'interval' minutes.";
        }
      }
   
      case manual {
        leaf manual {
          type empty;
          description
            "Only transfer when manually triggered.";
        }
      }
    }
  }
```

### BBF-20: Formatting 'error-string' statements
To ensure ease of rendering in client tools such as GUIs etc. and regardless of their length, error-messages MUST be defined as a single line of text and MUST NOT contain explicit line breaks (\\n) or tab (\\t) characters or formatted in any way.

'error-string' statements which span across multiple lines MUST be defined by concatenating individual quoted-string statements defined per line.

This is necessary to ensure that the strings will be correctly concatenated and white space retained as intended and rendered correctly in client tools.

Example:
```
error-message
  "The name of a multicast interface to host can not
   be the name of a multicast network interface.";
```
Per RFC 7950 @RFC7950, section [6.1.3](https://datatracker.ietf.org/doc/html/rfc7950#section-6.1.3), this 'error-message' would be reported as either
```
<error-message>The name of a multicast interface to host can not\nbe the name of a multicast network interface.</error-message>
```
or

```
<error-message>The name of a multicast interface to host can notbe the name of a multicast network interface.</error-message>
```
depending on how the system interprets a new line.

Corrected:
```
error-message
  "The name of a multicast interface to host can not "
+ "be the name of a multicast network interface.";
```
Which would be reported as:
```
<error-message>The name of a multicast interface to host can not be the name of a multicast network interface.</error-message>
```

### BBF-21: Deprecating and Obsoleting Data Nodes
There are times when the need arises to migrate away from using previously published data nodes:

 - A newer, possibly more efficient, method has been defined.
 - Error(s) existing in the current definition that cannot be resolved in a backward compatible way.
 - Data nodes were unnecessary or modeled by mistake, and there is no need to maintain or replace them.

The process for this is as follows:

 1. Change the status of the applicable data nodes from “current” to “deprecated” by adding a status statement with the value “deprecated”.
 2. The deprecated data nodes MUST remain in this state for at least two years.
 3. Beginning with the next publication after at least two years, the data nodes MAY be transitioned from “deprecated” to “obsolete”.
 4. The obsoleted data nodes MUST never be deleted from the YANG model.

### BBF-22: Backwards Compatibility
In general, BBF YANG modules SHOULD NOT introduce changes that are defined as backwards incompatible per RFC 7950 @RFC7950 section [11](https://datatracker.ietf.org/doc/html/rfc7950#section-11). Instead, add new definitions and use methods of deprecating and obsoleting previous definitions per RFC 7950 @RFC7950 section [7.21.2](https://datatracker.ietf.org/doc/html/rfc7950#section-7.21.2) and further clarified by BBF-21.

However, experience has shown that in certain cases, changes that are backwards incompatible according to RFC 7950 @RFC7950 section [11](https://datatracker.ietf.org/doc/html/rfc7950#section-11) may nevertheless be compatible in conjunction with other changes made at the same time. Therefore, it may be possible to address a specific problem, through backwards incompatible changes.

However, before agreeing to such changes to a published YANG module, Work Areas must ensure, to the greatest possible extent, that these changes will indeed be backwards compatible and not impact any existing operator configuration or operations or other SDOs or vendors augmentations of these standardized modules.

### BBF-23: "enable" vs. "enabled"
Data nodes used to enable/disable some function, and whose identifier is intended to include the term “enable”, either solely or as part of a larger name, SHALL use the “enabled” form of the word, e.g., ‘enabled’ or ‘statistics-enabled’. This also applies to the names of enums or bits.

### BBF-24: "oper-state" vs. "oper-status"
BBF YANG modules SHALL use the term ‘oper-state’ when defining a data node that reports the operational state. This is applicable whether it is the full name or part of the name of the data node, e.g., ‘oper-state’, ‘oper-state-timestamp’.

### BBF-25: Reference Statements
The goal of a reference statement is not only to completely and unambiguously guide the user to the documentation that supports the data node(s) being modeled, but also to enable the user to locate data nodes within YANG modules that implement specific attributes or parameters specified in the given documentation by searching through the YANG modules for references to those attributes or parameters. To that end, the following guideline is provided.

Reference statements SHALL reference technical specifications in a consistent manner using one or both of the following formats:

```
reference
  "[<single-reference>; <EOL>]* <single-reference>";

<single-reference> ::=  [<SDO>] <doc#> [(<version>)] [<R/S/C/T/F>] [- <descr>] | <URL> [- <descr>]
```

where

 * <SDO>: Standards Defining Organization
     - Examples: IEEE, ITU-T
     - Optional: For well known document types, e.g., RFC implies IETF and TR implies BBF, the SDO is not required.
 * <doc#>: Document number
     - Examples: TR-101i2, RFC 7950
     - Mandatory
     - For BBF documents, the Issue and/or Amendment and/or Corrigendum are included in the document number in the abbreviated format as described in IETF-7, e.g., TR-101i2, TR-385i2a1.
 * <version>: Version or revision number and/or date
     - Examples: (Revision 12.3), (2008/07)
     - Optional: For documents whose name implies or specifies the version, e.g., RFC 8348, TR-383a6, additional version information is not required.
 * <R/S/C/T/F>: Requirement/Section/Clause/Table/Figure
     - Examples: R-13, Section 3.6, Clause 7.2.1, Table 2, Figure 5-4
     - Optional: Only if applicable.
     - Terminology MUST align with the terms used by the reference, e.g., Sections for RFCs, Clauses for ITU-T specifications.
     - First letter is capitalized, e.g., "Section" instead of "section".
     - If multiple are applicable in a given document, treat each as a separate reference.
 * <descr>: Description of the reference
     - Examples: variable name or specific identifier within the Section or Clause
     - Optional: Should be used when it is possible to uniquely identify the parameter being modeled within the given reference.
         - Examples:
             - An ME defined in an ITU-T G.988 Clause contains one or more parameters. If the reference is for one specific parameter, it must be identified in the reference, e.g., "ITU-T G.988 Clause 9.9.6 - PSTN protocol variant".
             - A parameter defined in an ITU-T G.997.x Clause is typically fully contained within the clause, i.e., no ambiguity. However, for implementers, it is useful to be able to quickly search for a desired parameter when the Clause is not known. For this use case, both the descriptive and shorthand (if applicable) representation should be identified, e.g., "ITU-T G.997.2 Clause 7.2.1.1 - Maximum net data rate (MAXNDRds/us)".
             - However, if the G.997.x parameter represents more than one distinct value, e.g., upstream and downstream, and the data node only applies to one, the reference should only contain the value for which it is applicable, e.g., "ITU-T G.997.2 Clause 7.2.1.1 - Maximum net data rate downstream (MAXNDRds)".
             - A parameter defined in a Table in SFF-8472 is specified by its memory location (address and byte numbers). References for these types of parameters should include the address and bytes, e.g., "SFF-8472 (Revision 12.4) Table 4-1 - Address A0h, Bytes 96-127".
     - In general, the title associated with the reference should not be used unless it also represents one of the above.
 * <URL>: The URL of the associated reference used when there is no formal technical specification
     - Example: github.com/grpc/grpc/blob/master/doc/connection-backoff.md
     - Do not include the URL scheme, e.g., http:// or https://, as it may change. For example, a site may move from an unsecure (http) scheme to a secure (https) scheme.
 * ';': Requirement separator
     - Mandatory: A semicolon MUST be used to terminate all but the last reference when there are multiple references in a reference statement.
     - Each reference MUST start on a new line.
     - This is not applicable when there is only one reference in the reference statement.
 * If a single reference spans multiple lines, the first character on the second and subsequent lines of the reference SHALL align under the first character on the first line of the reference.

Example:

```
reference
  "RFC 5519 Section 5 - mgmdRouterInterfaceQueryInterval;
   TR-101i2 Table 2;
   SFF-8472 (Revision 12.4) Table 9-5 - Address A2h,
   Bytes 40-41;
   ITU-T G.997.2 Clause 7.11.1.1 - Net data rate (NDRds/us);
   ITU-T G.997.2 Clause 7.2.1.1 - Maximum net data rate downstream (MAXNDRds);
   IEEE 802.1Q (2018) Clause 20.23.3;
   IEEE 802.1Q (2018) Table 20-1 - xconCCMdefect;
   github.com/grpc/grpc/blob/master/doc/connection-backoff.md - INITIAL_BACKOFF";
```

Additional Notes:
 
 * While external references must be documented in the 'reference' statement, it is also allowed to refer to them in the description itself. 
 * This guideline does not apply to a reference statement within a revision statement. Those reference statements have a unique format used for drafts and publication.
 * URL references should be periodically reviewed to ensure they still exist or have not been moved.

### BBF-26: Body Statements
The order of body statements in BBF YANG modules SHOULD follow the order as stated in the body-stmt ABNF grammar defined in RFC 7950 @RFC7950 section [14](https://datatracker.ietf.org/doc/html/rfc7950#section-14) and as shown in the YANG Module Template defined in RFC 8407 @RFC8407 Appendix [B](https://datatracker.ietf.org/doc/html/rfc8407#appendix-B). Note that while the ABNF grammar specifies deviation statements follow notifications, the YANG Module Template states "DO NOT put deviation statements in a published module". BBF YANG modules MUST follow this stated guideline on deviation statements.

Body Statement Order:

 * extension statements
 * feature statements
 * identity statements
 * typedef statements
 * grouping statements
 * data definition statements
 * augment statements
 * rpc statements
 * notification statements
 
### BBF-27: 'list' and 'leaf-list' Naming and Descriptions
The name of a 'list' or 'leaf-list' data node SHALL be in the singular form. The motiviation is that the XML representation repeats the name for each entry.

Example YANG:

```
list traffic-management-profile {
  key name;
  description
    "A traffic management profile.";
  
  leaf name {
    type string;
    description
      "The name of the profile.";
  }
}
```

Example XML:

```
<traffic-management-profile>
  <name>multicast</name>
</traffic-management-profile>
<traffic-management-profile>
  <name>hsi</name>
</traffic-management-profile>
```

Note in the example YANG, the description for the 'list' node describes a single entry in the list, "A traffic management profile".

The description statement for a 'list' or 'leaf-list' data node SHALL describe what an entry represents rather than describing the entire list. In other words, the description should follow the example above rather than:

```
list traffic-management-profile {
  key name;
  description
    "A list of traffic management profiles.";
  
  leaf name {
    type string;
    description
      "The name of the profile.";
  }
}
```

### BBF-28: Description on 'when' statements
Not everyone reading a YANG model is an expert in YANG and/or XPath. In order to provide assistence in understanding the intent, all 'when' statements SHALL contain a description statement. This description should convey the intent of the 'when' condition in easy to understand language.

Examples:

```
when "derived-from-or-self(hw:class,'bbf-hwt:transceiver-link') {
  description
    "Applicable when the class of hardware component is either a
     transceiver link or another class derived from a transceiver
     link.";
}
```

```
when "not(boolean(../enable))"
   + " or "
   + "(../enable='true')" {
  description
    "If the administrative state of a session is
     supported, the session must be currently
     administratively enabled to reset the session.";
}
```

### BBF-29: Use of English Contractions
Descriptions in YANG modules are considered to be formal documentation. Therefore, English contractions, e.g., can't, isn't, etc., SHALL NOT be used in description statements.

