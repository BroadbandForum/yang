## Broadband Forum YANG Modules

### 2021-07-06: [TR-454 Issue 1](https://www.broadband-forum.org/technical/download/TR-454_Issue-1.pdf) YANG Modules for Access Network Map & Equipment Inventory
*Tag: [TR-454-v1.0.0](https://github.com/BroadbandForum/yang/tree/TR-454-v1.0.0)*

TR-454 defines YANG data models for maintaining and reporting Network Map and Equipment Inventory information that is applicable to the Broadband Forum's CloudCO Broadband Access Abstraction (BAA) layer as well as SDN Management and Control functions.

### 2021-06-02: [TR-383 Amendment 4](https://www.broadband-forum.org/technical/download/TR-383_Amendment-4.pdf) Common YANG Modules for Access Networks
*Tag: [TR-383-v1.4.0](https://github.com/BroadbandForum/yang/tree/TR-383-v1.4.0)*

* Add common modules used across Broadband Forum YANG modules
* Add new statistics related to QoS
* Add profiles for frame classification and ingress/egress rewrite actions on sub-interfaces
* Extend hardware transceiver functionality for alarms and reading of vendor-specific and user  EEPROM 
* Extend common interface and Ethernet interface statistics and PM

### 2020-10-13: [TR-355 Amendment 3](https://www.broadband-forum.org/technical/download/TR-355_Amendment-3.pdf) YANG Modules for FTTdp Management, [TR-383 Amendment 3](https://www.broadband-forum.org/technical/download/TR-383_Amendment-3.pdf) Common YANG Modules for Access Networks, [TR-385 Issue 2](https://www.broadband-forum.org/technical/download/TR-385_Issue-2.pdf) ITU-T PON YANG Modules
*Tags: [TR-355-v1.3.0](https://github.com/BroadbandForum/yang/tree/TR-355-v1.3.0), [TR-383-v1.3.0](https://github.com/BroadbandForum/yang/tree/TR-383-v1.3.0), [TR-385-v2.0.0](https://github.com/BroadbandForum/yang/tree/TR-385-v2.0.0)*

* TR-355 Amendment 3
    * Add support for bonding as defined in ITU-T G.998.1, G.998.2, G.998.3 and BBF TR-159
    * Add alarming support for FAST and VDSL
    * Add support for additions and changes from amendments to ITU-T G.997.1 and G.997.2
* TR-383 Amendment 3
    * Enhancements to existing models
    * New models for ANCP and Hardware Management
* TR-385 Issue 2
    * Add support for performance monitoring, power management, ONU presences states and defect reporting

### 2020-01-31: [TR-385c1](https://www.broadband-forum.org/technical/download/TR-385.pdf) ITU-T PON YANG Modules (PDF not updated)
*Tag: [v3.0.1-TR-385c1](https://github.com/BroadbandForum/yang/tree/v3.0.1-TR-385c1)*

* Increase length of *expected-registration-id* from 36 to 72 ASCII characters

### 2020-01-17: [TR-355a2c2](https://www.broadband-forum.org/technical/download/TR-355_Amendment-2.pdf) YANG Modules for FTTdp Management (PDF not updated)
*Tag: [v1.2.2-TR-355a2c2](https://github.com/BroadbandForum/yang/tree/v1.2.2-TR-355a2c2)*

* Correct *must* statements for *preferred-mds*, *minimum-mds* and *maximum-mds*

### 2019-10-21: [TR-355a2c1](https://www.broadband-forum.org/technical/download/TR-355_Amendment-2.pdf) YANG Modules for FTTdp Management (PDF not updated)
*Tag: [v1.2.1-TR-355a2c1](https://github.com/BroadbandForum/yang/tree/v1.2.1-TR-355a2c1)*

* Correct length of *version-number* and *serial-number* in VDSL inventory
* Add missing default values for FAST thresholds
* Correct references in both bbf-fast and bbf-vdsl

### 2019-10-21: [TR-383a2c1](https://www.broadband-forum.org/technical/download/TR-383_Amendment-2.pdf) Common YANG Modules for Access Networks (PDF not updated)
*Tag: [v2.2.1-TR-383a2c1](https://github.com/BroadbandForum/yang/tree/v2.2.1-TR-383a2c1)*

* Correct data type used for *out-unicast-pkts* in bbf-interfaces-performance-management
* Add description of the behavior of the value 0 for *multicast-rate-limit* in bbf-mgmd
* Correct descriptions for *performance-counter* types

### 2019-06-11: [TR-355a2](https://www.broadband-forum.org/technical/download/TR-355_Amendment-2.pdf) YANG Modules for FTTdp Management
*Tag: [v1.2.0-TR-355a2](https://github.com/BroadbandForum/yang/tree/v1.2.0-TR-355a2)*

* Add support for additions and changes from amendments to ITU-T G.997.1 and ITU-T G.997.2

### 2019-02-25: [TR-385](https://www.broadband-forum.org/technical/download/TR-385.pdf) ITU-T PON YANG Modules
*Tag: [v3.0.0-TR-385](https://github.com/BroadbandForum/yang/tree/v3.0.0-TR-385)*

TR-385 defines YANG data models for ITU-T Passive Optical Networks (PON) devices as defined in ITU-T G.984.x, ITU-T G.987.x, ITU-T G.989.x, and ITU-T G.9807.x.

(To avoid confusion, the YANG files from the 2017-05-05 WT-385_draft1 release have been removed.)

### 2018-12-03: [TR-383a2](https://www.broadband-forum.org/technical/download/TR-383_Amendment-2.pdf) Common YANG Modules for Access Networks
*Tag: [v2.2.0-TR-383a2](https://github.com/BroadbandForum/yang/tree/v2.2.0-TR-383a2)*

* Add `ethernet-like` abstract interface type

### 2018-10-01: [TR-355a1](https://www.broadband-forum.org/technical/download/TR-355_Amendment-1.pdf) YANG Modules for FTTdp Management
*Tag: [v1.1.0-TR-355a1](https://github.com/BroadbandForum/yang/tree/v1.1.0-TR-355a1)*

* Add support for Reverse Power Feeding
* Update per the latest versions of associated ITU-T specifications

### 2018-07-13: [TR-374](https://www.broadband-forum.org/technical/download/TR-374.pdf) YANG modules for management of G.hn systems in FTTdp architectures
*Tag: [v4.0.0-TR-374](https://github.com/BroadbandForum/yang/tree/v4.0.0-TR-374)*

TR-374 defines YANG data models for the management of ITU-T G.hn technology when applied to FTTdp architectures.

### 2018-07-13: [TR-383a1](https://www.broadband-forum.org/technical/download/TR-383_Amendment-1.pdf) Common YANG Modules for Access Networks
*Tag: [v2.1.0-TR-383a1](https://github.com/BroadbandForum/yang/tree/v2.1.0-TR-383a1)*

* Extend functionality of Layer 2 forwarding and QoS models 
* Add new model for Layer 2 multicast management
* Remove models which depended on an early draft of ietf-hardware (these will be published again in a subsequent release based on the revision of ietf-hardware contained in [RFC 8348](https://tools.ietf.org/html/rfc8348))

### 2017-11-27: [TR-355c2](https://www.broadband-forum.org/technical/download/TR-355_Corrigendum-2.pdf) YANG Modules for FTTdp Management
*Tag: [v1.0.2-TR-355c2](https://github.com/BroadbandForum/yang/tree/v1.0.2-TR-355c2)*

Various corrections to existing modules and sub-modules. Some of these corrections are not fully backwards compatible.

### 2017-05-08: [TR-383](https://www.broadband-forum.org/technical/download/TR-383.pdf) Common YANG Modules for Access Networks
*Tag: [v2.0.0-TR-383](https://github.com/BroadbandForum/yang/tree/v2.0.0-TR-383)*

TR-383 defines YANG data models for the management of Broadband Forum specified access network equipment used across many deployment scenarios. Broadband Forum-specified access network equipment comprises Access Nodes and FTTdp DPUs. There is no assumption for BBF YANG modules to apply globally, e.g. to apply to access network equipment other than BBF Access Nodes and FTTdp DPUs, or to apply to core network equipment.

TR-383 YANG data models cover the following common areas (see [TR-383](https://www.broadband-forum.org/technical/download/TR-383.pdf) for a full listing of modules and submodules):

* DHCP
* Equipment
* Ethernet
* Layer 2 forwarding
* Interfaces
* PPPoE
* QoS
* Sub-interfaces
* Subscribers
* Types

Where appropriate, these YANG modules augment IETF YANG modules.

### 2017-05-05: [WT-385_draft1] ITU-T PON YANG Modules
*Tags: [v2.0.0-WT-383-draft1](https://github.com/BroadbandForum/yang/tree/v2.0.0-WT-383-draft1), [v3.0.0-WT-385-draft1](https://github.com/BroadbandForum/yang/tree/v3.0.0-WT-385-draft1)*

Full [WT-385_draft1] release (including documentation) plus partial [WT-383_draft1] (Common YANG Modules for Access Networks) release (only what's needed by WT-385).

WT-385 YANG modules in the [draft/interface](draft/interface) directory:

* [bbf-fiber.yang](draft/interface/bbf-fiber.yang): This is the main module.

* [bbf-fiber-if-type.yang](draft/interface/bbf-fiber-if-type.yang): This module defines xPON interface types, including channelgroup, channelpartition, channelpair and channeltermination.

* [bbf-fiber-types.yang](draft/interface/bbf-fiber-types.yang): This module defines identities and data types used by the xPON YANG Modules.

* [bbf-link-table-body.yang](draft/interface/bbf-link-table-body.yang): This module defines a generic link table where each entry links two IETF interfaces. The link relations are used horizontally between the counterpart interfaces on the OLT and the ONU in Combined-NE mode.

[WT-383_draft1]: https://www.broadband-forum.org/software#WT-383_draft1
[WT-385_draft1]: https://www.broadband-forum.org/software#WT-385_draft1

### 2017-03-13: [TR-355c1](https://www.broadband-forum.org/technical/download/TR-355_Corrigendum-1.pdf) YANG Modules for FTTdp Management
*Tag: [v1.0.1-TR-355c1](https://github.com/BroadbandForum/yang/tree/v1.0.1-TR-355c1)*

Various corrections to existing modules and sub-modules. Some of these corrections are not fully backwards compatible.

### 2016-07-18: [TR-355](https://www.broadband-forum.org/technical/download/TR-355.pdf) YANG Modules for FTTdp Management
*Tag: [v1.0.0-TR-355](https://github.com/BroadbandForum/yang/tree/v1.0.0-TR-355)*

TR-355 YANG modules in the [standard/interface](standard/interface) directory:

* [bbf-fastdsl](standard/interface/bbf-fastdsl.yang): This module contains a collection of YANG definitions for an interface which may support one or more DSL or G.fast technologies.

* [bbf-fast](standard/interface/bbf-fast.yang): This module contains a collection of YANG definitions for managing G.fast lines.

* [bbf-vdsl](standard/interface/bbf-vdsl.yang): This module contains a collection of YANG definitions for managing VDSL and DSL lines.

* [bbf-ghs](standard/interface/bbf-ghs.yang): This module contains a collection of YANG definitions for managing G.handshake (ITU-T G.994.1).

* [bbf-melt](standard/interface/bbf-melt.yang): This module contains a collection of YANG definitions for managing Metallic Line Test (MELT) (ITU-T G.996.2).

* [bbf-selt](standard/interface/bbf-selt.yang): This module contains a collection of YANG definitions for managing Single Ended Line Test (SELT) (ITU-T G.996.2).

TR-355 YANG modules in the [standard/common](standard/common) directory:

* [bbf-yang-types](standard/common/bbf-yang-types.yang): This module contains a collection of YANG definitions for common types used throughout Broadband Forum defined modules.
