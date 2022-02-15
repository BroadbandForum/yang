## BBF Deviation Guidelines {.new-file}

It is understood that there are times in which a device will need to support a
subset of a standard YANG model whether it be from BBF or any other SDO. YANG
provides a means to explicitly model this subset of support via a
deviation. While a deviation allows for almost any change in the original
definition, it is important that implementations only allow those deviations
which are truly a subset of the original and that do not cause the device to
violate the underlying specification on which the YANG model is based. The
following sections describe the types of deviations and the guidelines by which
they are expected to be used in the Broadband Forum.

### Types of Deviations

The YANG *deviate* statement is used to define the manner in which the server deviates from a particular YANG module. There are 4 types of deviations defined as arguments to the deviate statement:

  - not-supported
    - Indicates the target node is not implemented by the server.
  - add
    - Adds properties to the target node so long as they do not already exist.
  - replace
    - Replaces properties of the target node so long as they already exist.
  - delete
    - Deletes existing properties of the target node.
    
### DEV-1: not-supported

The deviate *not-supported* argument MAY be used to announce lack of support for an optional node.

An optional node is one which does not have a default value nor is made mandatory by use of the mandatory statement. Consider the following object definition which is defined with neither a default value nor a mandatory statement.

```
  leaf error-threshold {
    type uint32;
    description
      "The number of errors, when exceeded, will raise an alarm.";
  }
```  

Since this node is optional, it is acceptable to announce the object as not supported.

```
  deviation error-threshold {
    description
      "The optional error threshold is not supported.";
    deviate not-supported;
  }    
```  

### DEV-2: add - Number of Elements

The deviate *add* argument MAY be used to add a restriction on the number of elements in a *leaf-list* or *list*.

Adding a restriction on the number of elements is accomplished by adding a *min-elements* and/or *max-elements* statement where they were not previously defined. For example, you have a *leaf-list* which does not contain either a *min-elements* or *max-elements* statement and thus does not impose any limit on the number of elements contained in the *leaf-list*.

```
  leaf-list port {
    type string;
    description
      "A port associated with a port group.";
  }
```
A particular implementation may want to limit the number to 4. In this case, a deviation can be used to add the *max-elements* statement to the definition.

```
  deviation port {
    description
      "Limit the maximum number of ports to 4.";
    deviate add {
      max-elements 4;
    }
  }
```

### DEV-3: add - 'must' Constraints

The deviate *add* argument MAY be used to add a constraint on valid data by the use of the must statement.

This constraint may be necessary depending on actual hardware in use. For example, the number of physical interfaces of a particular type will be limited by the number present on the hardware. For this, we could add a constraint on the interface list in *ietf-interfaces @RFC7223* to explicitly announce how many interfaces are supported.

```
  deviation "/if:interfaces" {
    description
      "There are only 8 G.fast interfaces supported.";
    deviate add {
      must "count(interface[type='ianaift:gfast'])=8";
    }
  }
```

### DEV-4: replace - Data Type

The deviate *replace* argument MAY be used to replace a type so long as the replacement type uses the same underlying built-in YANG type and the value represented does not fall outside the range of the definition of the type being replaced.

An integer type can be replaced as long as the replacement uses the same built-in YANG type, e.g. uint32 or int64 and that the range specified falls within the range of the original definition. If the original does not define a range then any range can be specified in the deviation. If the original defines a range of values, the range of the deviation must fall within this defined range. In other words the new minimum value must be greater than or equal to the original and the new maximum value must be less than or equal to the original. For example, the following defines an object of type uint32 with a range of values 1 to 999999.

```
  leaf error-threshold {
    type uint32 {
      range "1..999999";
    }
    description
      "The number of errors, when exceeded, will raise an alarm.";
  }
```

A particular implementation may only allow a range from 10 to 99999. Since this range is a subset of the original range definition, we can replace the uint32 type with another uint32 type that has the new range.

```
  deviation error-threshold {
    description
      "The supported range of values is 10 to 99999.";
    deviate replace {
      type uint32 {
        range "10..99999";
      }
    }
  }
```

A string type can be replaced as long as its replacement is also a string and any specified length or pattern is valid per the original definition. If no length is specified in the original, this means that any length restriction may be added. If a length is specified, it means the new length can be specified so long as the new minimum value is greater than or equal to the original and the new maximum value is less than or equal to the original. If no pattern is specified in the original, any pattern may be added. If a pattern is specified in the original, the new pattern must be equal to or a subset of the original. For example, the following object is defined as a string with no length restriction and a pattern which allows for any alphanumeric character.

```
  leaf name {
    type string {
      pattern '[A-Za-z0-9]*';
    }
    description
      "The name of a thing.";
  }
```

A particular implementation may require that the maximum length of the string be 255 characters and that upper case characters are not supported. This is a valid deviation since the new string is shorter than the original and the character set is a subset of the original pattern.

```
  deviation name {
    description
      "The name may be no more than 255 lowercase letters and/or
       numbers.";
    deviate replace {
      type string {
        length "0..255";
        pattern '[a-z0-9]*';
      }
    }
  }
```

### DEV-5: replace - Number of Elements
The deviate *replace* argument MAY be used to further restrict the number of elements in a *list* or *leaf-list*.

For *min-elements*, the new value must be greater than or equal to the original. For *max-elements*, the new value must be less than or equal to the original. Suppose we have the following definition of a *leaf-list* of ports which must have at least 1 and no more 10 entries.

```
  leaf-list port {
    min-elements 1;
    max-elements 10;
    type string;
    description
      "A port associated with a port group.";
  }
```

Now we have an implementation which must have at least 2 ports but no more than 4 ports configured. Since this falls within the constraints of the original definition, it is a valid deviation.

```
  deviation port {
    description
      "Specify that at least 2 but no more than 4 ports can be
       configured.";
    deviate replace {
      min-elements 2;
      max-elements 4;
    }
  }
```  

### DEV-6: delete

The deviate *delete* argument MUST NOT be used in a deviation.

By deleting a property, the value space of an object is typically being expanded which means the value accepted by the deviated definition is not valid per the original definition and thus, should never be allowed.  
