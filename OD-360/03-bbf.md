## BBF YANG Guidelines {.new-file}

This section adds BBF-specific guidelines that go beyond the scope of the IETF
YANG Guidelines.

### BBF-1: Use of IANA/IETF YANG Modules

BBF YANG modules MUST use standard IANA/IETF YANG modules whenever possible. In
this context, "use" implies adherence to the letter and spirit of such modules
and of their defining RFCs.

Individual Working Text documents SHOULD reference the standard models which
are applicable.

### BBF-2: Line Length

The length of each line of text in a YANG module MUST not exceed 70 characters.

### BBF-3: Deviations

Deviations MUST NOT be used in BBF YANG modules.

However, deviations can be used alongside BBF YANG modules as described in the section BBF Deviation Guidelines.

### BBF-4: Short Names

Lists and leaf-lists may have many elements resulting in large amounts of data present on the line. For XML encoding, the name of each node appears twice for every element of the list or leaf-list. Although IETF-12 states that identifiers SHOULD include complete words, the expedient use of short names SHOULD be imposed to shorten on-the-wire messaging and improve efficiency. 

### BBF-5: Descriptions and References

All descriptions MUST read as sentences or sentence fragments containing proper capitalization and punctuation, e.g., ending with periods. However, reference statements need not meet this requirement and do not need to terminate with a period.

### BBF-6: Special Values

Special values SHOULD be parameterized in an enumeration as part of a union with the normal values.

Enumerations SHOULD NOT be used in cases where a special value means "XXX or less" or "YYY or more", i.e. where the special value indicates clipping.

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
In the above example, -511 refers to a value less than or equal to -51.1; +511 refers to a value greater than or equal to +51.1 and the enum undetermined refers to a value which is undetermined.

### BBF-7: Paragraph Separation in Description Statements

For description statements which contain multiple paragraphs, each paragraph SHOULD be separated using a blank line.

Example:
```
  description
    "This is the first paragraph of the description.
   
     This is the second paragraph of the description.";
```

### BBF-8: Revision Statements

Unpublished versions of BBF YANG modules MAY have 'revision' statements corresponding to individual pull requests. However, published versions MUST remove these 'revision' statements and replace with a single 'revision' statement corresponding to the published version.

### BBF-9: Explicit Modeling

Where YANG allows something or some behavior to be explicitly modeled (e.g. enumerations, range, units, must, etc.) then this SHOULD always be done. Mandatory requirements in descriptions SHOULD be used only where it is not possible to use formal YANG modeling to convey the requirement.

### BBF-10: Retroactive Application of OD-360 Guidelines

OD-360 guidelines SHOULD NOT be retroactively applied to published BBF YANG modules and MUST NOT be applied if the resulting change is backward incompatible with the previously published version. For example, an existing node named using an underscore '_' instead of a dash '-' MUST NOT be changed in published module as the resulting renaming is not backward compatible.

### BBF-11: Multi-word Identifiers

YANG identifiers which represent multiple words, e.g target margin, SHOULD use a dash between the normally whitespace separated words, e.g. 'target-margin'.

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

Abbreviations can be used in description statements. However, the first instance of the acronym in a description statement SHOULD have its meaning clearly conveyed.

### BBF-14: Adding and/or Creating BBF YANG Models

This guideline defines the best practices when defining a new BBF YANG model and/or having BBF extend an existing (BBF or non-BBF) YANG model.

When creating or editing BBF YANG models, the following use cases apply:

 1. **Requirements that are captured in a Broadband Forum Technical Report**
In this case, the BBF YANG model should meet the requirement set forward in the Technical Report.
For example, the models contained in TR-383 build on the requirements of TR-101/156/167/301

 2. **Requirements (or information models) that are captured in standards documents published by other SDOs and referenced from a Broadband Forum Technical Report, for which the other SDO is not developing a YANG model**
In this case, the BBF YANG data model should reference the applicable standard and be able to meet the requirement(s) from that document.
For example, the TR-355 G.fast YANG model contains attributes defined in ITU-T Recommendation G.997.2

 3. **A model requirement which is not formulated in a Broadband Forum Technical Report or a standard published by another SDO**
In this case, the following guidelines apply:

    1. First, the requirement must be formulated based on inputs brought forward to the BBF (i.e. a contribution explaining the need for the requirement).

    2. There must be consensus among the participants in the Work Area/Project Stream to move forward with this requirement.

    3. It is desirable, but not mandatory for the requirements to be captured in a BBF TR. But that should not hold up putting the requirement in the YANG model. In other words, if the Work Area agrees that something should be added in a BBF YANG model, then we do not need to wait until the requirement is captured in a TR.

    4. The new requirement must not break existing BBF TRs.

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
 - contain the standard BBF software license.

#### Draft

Each draft module and submodule SHALL:

 - have a new, if previously published, or initial revision statement containing the draft publication date as the revision date. All submodules associated with a module SHALL have the same revision date as the parent module regardless of whether they were changed.
 - maintain all revision statements from previously published revisions.
 - contain the draft BBF software license.

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

All enums in an enumeration SHOULD be named using names which describe their functional meaning rather than something ambiguous such as an integer string, "1".

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

*The 'value' carries no meaning via NETCONF nor RESTCONF but is used for an implementation and reference aid.*

*For an enumeration whose underlying values are 0..n, the 'value' statements are not necessary as all enums have an implied value if not explicitly specified. The implied values begin with 0 and increment by 1 for each enum in the enumeration.*
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

The default case of a choice statement MUST not contain sole descendant leaf node of type "empty".

Section 7.9.3 states that "The default case is only important when considering the 'default' statements of nodes under the cases (i.e., default values of leafs and leaf-lists, and default cases of nested choices)." It also states that "The default values and nested default cases under the default case are used if none of the nodes under any of the cases are present.".

Section 9.11 states that an empty type cannot have a default value

In the example below, the choice 'manual' has a leaf with an empty type as the only child node. Since an empty leaf cannot have a default value, the behavior of an <edit-config> request that creates the  'transfer' container without providing any data for the choice 'how' will be the same irrespective of whether the default 'manual' statement is present or not.

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
Per RFC 7950 @RFC7950, section [6.1.3](https://datatracker.ietf.org/doc/html/rfc7950#section-6.1.3), this 'error-message' would be reported as:
```
<error-message>The name of a multicast interface to host can not\nbe the name of a multicast network interface.</error-message>
```

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

