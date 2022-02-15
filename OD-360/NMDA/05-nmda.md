## BBF NMDA Guidelines {.new-file}

The following guidelines relate to the creation and maintenance of BBF YANG models as they relate to the concept of Network Management Datastore Architecture (NMDA) defined in RFC 8342 @RFC8342.

### NMDA-1: Separate configuration and state nodes

When a new model is created using non-NMDA syntax (i.e. split configuration and state data) for use in a non-NMDA server, and if any attribute has both configuration and state data, one of which is conditional via a feature and/or a "when" statement, then the configuration and state data nodes should not be named the same. This will allow migration to NMDA servers using NMDA compliant syntax (i.e. configuration and state data merged into single nodes) at a later time, preserving both the conditional nature and the intended ability to support the same state data node in the NMDA model with just a change in namespace.

Example model with configuration of 'id' dependent on the feature 'configurable-id' while the state node, 'id', is always valid.

```
  module: bbf-things
    +--rw things
    |  +--rw thing* [name]
    |     +--rw name       string
    |     +--rw id         uint32 {configurable-id}
    +--ro things-state
    |  +--ro thing* [name]
    |     +--ro name       string
    |     +--ro id         uint32
```

The same example model with this guideline applied.

```
  module: bbf-things
    +--rw things
    |  +--rw thing* [name]
    |     +--rw name       string
    |     +--rw id         uint32 {configurable-id}
    +--ro things-state
    |  +--ro thing* [name]
    |     +--ro name       string
    |     +--ro actual-id  uint32
```

### NMDA-2: Configuration of a read-only node in an existing published model

If a published standard NMDA syntax compliant model contains a read-only node which needs to now be configurable, a read-write node should be augmented into the published standard to allow for configuration. A side effect of this is there are now two methods to retrieve the same operational value.

Example from *ietf-hardware @RFC8348*.

```
  module: ietf-hardware
    +--rw hardware
    |  +--rw component* [name]
    |     +--rw name         string
    |     +--ro model-name?  string
```

One possible method to augment a configurable 'model-name'.

```
  module: ietf-hardware
    +--rw hardware
    |  +--rw component* [name]
    |     +--rw name         string
    |     +--ro model-name?  string
    |     +--rw configuration
    |        +--rw model-name?  string
```  
