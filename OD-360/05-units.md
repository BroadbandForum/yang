## BBF Guidelines for 'units' Statements {.new-file}

The following guidelines apply to the specification of 'units' statements within Broadband Forum
YANG modules. These guidelines are based on the following reference documentation as well as 
practical usage within Broadband Forum YANG modules:

  1. IEEE Std. 260.1
  2. [NIST Special Publication 811](https://www.nist.gov/pml/special-publication-811)

### Terminology

The following terminology is used throughout these guidelines.
  
  | Term   | Description |
  |--------|-------------|
  | family | refers to a group of 'units' statements representing a common functional area including, but not limited to, time, length, temperature, electricity, speed and memory storage |
  | unit   | the full text name of a unit, e.g., seconds, milliwatts |
  | symbol | the abbreviated form of expressing the units, e.g., mW, dBm |

### UNITS-1: Unit vs Symbol

All 'units' statements SHALL use either the "unit" or the "symbol" as defined in IEEE Std. 260.1 including the proper use of uppercase and lowercase. The chosen method used should be applied consistently within a family of units. In general, the "unit" should be used with the "symbol" being used on a case-by-case basis. For example, use "seconds" or some derivation (see UNITS-3) for time but "dBm" for power level as the term "decibel-milliwatts" is not commonly used.
  
### UNITS-2: Plural Form

Where applicable, the full "unit" text SHALL be written in plural form, e.g., seconds vs. second. This differs from the definitions in IEEE Std. 260.1 but aligns with NIST 811 as well as the current practice in industry standard YANG data models.
  
### UNITS-3: Base vs Derived

The base unit for a given family may not always be the one that provides the best granularity. For example, it would not be common to express 20 nanoseconds as 0.00000002 seconds as doing so would make readability difficult. In those situations, a "unit" derived from the base SHOULD be used where the derived unit is a multiple of 10^3^ from the base, e.g., seconds, milliseconds, nanoseconds.
  
### UNITS-4: Memory

For 'units' statements related to memory that need derived units for reasons similar to the usage described in UNITS-3, the derived unit SHALL be a multiple of 2^10^, e.g., bytes, kibibytes, mebibytes.
  
### UNITS-5: Unit Combinations

'units' statements requiring a combination of units SHALL fully spell out the relationship between the units, e.g., "bits per second" rather than "bits/second". Regarding the applicability of UNITS-2, only the first "unit" will be plural in a combination, e.g., "bits" in "bits per second".
  
### UNITS-6: Equivalent Units

If more than one "unit" definition is applicable for a given type of data, then one should be chosen and applied in a consistent manner. For example, use "bytes" instead of "octets".
  
### UNITS-7: Use of decimal64

For a given data node, a base or "unit" along with the decimal64 type SHOULD be used rather than a derived "unit" along with an integer type.

For example, use

```
  leaf rx-power {
    type decimal64 {
      fraction-digits 4;
    }
    units "watts";
    description
      "The receive power reported in watts.";
  }
```
rather than
```
  leaf rx-power {
    type uint32;
    units "0.1 milliwatts";
    description
      "The receive power reported in tenths of a milliwatt.";
  }
```

When applying this guideline, along with UNITS-3 and UNITS-4, to already published data models, strict adherence may not always be possible due to backward compatiblity issues. In those cases, express the 'units' relative to the closest base or a derived unit, e.g., "0.1 seconds" or "1/256 milliseconds". 


### UNITS-8: Exceptions

At times, there may be a need to preserve the relationship with an underlying standard that would result in a non-adherence to these guidelines. Such instances should be carefuly evaluated on a case-by-case basis to determine if an exception should be made. For example, in TR-385, several data nodes exist that represent data in "125 microsecond PHY frames". Application of UNITS-1 would result in 'units' statements of either "125 microseconds" or "0.125 milliseconds". However, this would result in a disassociation with the underlying standard where the measurement in "PHY frames" is as equally important as is the representation of time.

### UNITS-9: Frames vs Packets vs Messages

The use of "frames", "packets" and "messages" SHOULD be applied in a consistent manner based on the following guidelines:

  - use "frames" when referring to layer 2, e.g., Ethernet frames, VLANs, etc.
  - use "packets" when referring to layer 3, e.g., IP packets
  - use "messages" when referring to protocols, e.g., DHCP messages, IGMP messages, etc.
  
  
  


  

