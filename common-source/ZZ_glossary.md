## Glossary

### Device ID (DID)

The unique identifier of a device. DID is a free-form string. To assure
uniqueness, it is advisable to use the device's MAC address or serial
number as a DID.

### Gateway Agent

A middleware component of the **relayr** platform acting as a bridge
between IoT devices and the **relayr Cloud**. A Gateway Agent is also a fog
computing module providing data persistency and local device
management capabilities. Each Gateway Agent consists of the following
components: Northbound services, Core and Southbound services.

Components communicate via the local MQTT broker or REST API using
JSON-encoded messages.

### Northbound service

A Northbound service communicates with Core services via the Northbound
Interface. Examples of a Northbound service are a Cloud adapter and
a local UI.

### Cloud adapter

A component responsible for communication with the **relayr
Cloud**. The Cloud adapter translates unified Gateway Agent messaging into

the Cloud-specific protocol.

### Agent Core

The heart of the Gateway Agent, responsible for managing the data exchanged
between Northbound and Southbound services. It also provides data
persistency and local device management capabilities.

### Southbound service

A Southbound service communicates with Core services via the
Southbound Interface. An example of a Southbound service is a
Protocol adapter.

### Protocol adapter

A protocol adapter is responsible for interacting with devices
implementing a particular IoT or industrial protocol and passing this
information to the Core using the Southbound Interface.

### Metadata

Metadata are attributes of a Device. Each metadata has a unique ID and
value. Metadata can be set by a Technician during the enrollment
process or retrieved and reported by a Device. Examples of metadata
are Device Location, Owner email address and Device model ID.

### Measurements

Measurements refer to data readings reported periodically or on
event. Each measurement has a unique ID, timestamp and
value. Measurements are stored persistently in a history database
for further retrieval. Examples of measurements data are temperature
or humidity values reported by device sensors over time.

### Alert

Alerts are used to immediately notify the operator that some part of
the system requires attention. An alert can have two states: **clear** or **set**. Each alert state change is stored as a log record
for further audit. An example of an alert is the "Low Fuel" notification in
a car.

### Log

A log is an important incident in the system. Logs are stateless and
are stored as a record for further audit. Examples of logs are
a certificate expiration or a change of IP address.

### Peer

A peer is a device logically associated with a neighboring
device. Each device can report multiple peers. Peer relationships
between devices are used to create a physical or logical network
topology, which can be given a graphical representation in the UI.

### Task

A task is a control operation scheduled by an operator via a WebUI or
a provided API. The system supports the following tasks:

 - Configuration change,
 - Command execution,
 - Package management. 

Tasks can be executed immediately or scheduled for execution at a
specific point in time. Each scheduled task has a state representing
its operation status.

### Configuration

Configuration parameters are user-defined settings that control
various aspects of a device or an application's behavior. An example of
a configuration parameter is “Light Control”, used to turn a light bulb on or
off.

### Command

A command is a user-defined action executed on a device. Commands allow a specific action or script to run on a device and forward the command
execution result back to the operator. Examples of a command are restarting a device or invoking a system self-checking script to get
meaningful results for troubleshooting.

### Package

A package is a binary or text file. It may contain e.g. software or
configuration updates. Packages are propagated down to a device or a
set of devices.

### Package management

Package Management refers to the process of software and/or
configuration updates on a Gateway or device.
