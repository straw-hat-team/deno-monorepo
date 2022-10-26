%% The type of the exception (its fully-qualified class name, if applicable). The dynamic type of the exception should be preferred over the static type in languages that support it..
-define(EXCEPTION_TYPE, <<"exception.type">>).

%% The exception message..
-define(EXCEPTION_MESSAGE, <<"exception.message">>).

%% A stacktrace as a string in the natural representation for the language runtime. The representation is to be determined and documented by each language SIG..
-define(EXCEPTION_STACKTRACE, <<"exception.stacktrace">>).

%% The name identifies the event..
-define(EVENT_NAME, <<"event.name">>).

%% The domain identifies the context in which an event happened. An event name is unique only within a domain..
-define(EVENT_DOMAIN, <<"event.domain">>).

-define(LOG_EXCEPTION_EXCEPTION_TYPE, <<"log-exception.exception.type">>).

-define(LOG_EXCEPTION_EXCEPTION_MESSAGE, <<"log-exception.exception.message">>).

-define(LOG_EXCEPTION_EXCEPTION_STACKTRACE, <<"log-exception.exception.stacktrace">>).

%% Array of brand name and version separated by a space.
-define(BROWSER_BRANDS, <<"browser.brands">>).

%% The platform on which the browser is running.
-define(BROWSER_PLATFORM, <<"browser.platform">>).

%% A boolean that is true if the browser is running on a mobile device.
-define(BROWSER_MOBILE, <<"browser.mobile">>).

%% Full user-agent string provided by the browser.
-define(BROWSER_USER_AGENT, <<"browser.user_agent">>).

%% Preferred language of the user using the browser.
-define(BROWSER_LANGUAGE, <<"browser.language">>).

%% Name of the cloud provider..
-define(CLOUD_PROVIDER, <<"cloud.provider">>).

%% The cloud account ID the resource is assigned to..
-define(CLOUD_ACCOUNT_ID, <<"cloud.account.id">>).

%% The geographical region the resource is running..
-define(CLOUD_REGION, <<"cloud.region">>).

%% Cloud regions often have multiple, isolated locations known as zones to increase availability. Availability zone represents the zone where the resource is running..
-define(CLOUD_AVAILABILITY_ZONE, <<"cloud.availability_zone">>).

%% The cloud platform in use..
-define(CLOUD_PLATFORM, <<"cloud.platform">>).

%% The Amazon Resource Name (ARN) of an [ECS container instance](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_instances.html)..
-define(AWS_ECS_CONTAINER_ARN, <<"aws.ecs.container.arn">>).

%% The ARN of an [ECS cluster](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/clusters.html)..
-define(AWS_ECS_CLUSTER_ARN, <<"aws.ecs.cluster.arn">>).

%% The [launch type](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html) for an ECS task..
-define(AWS_ECS_LAUNCHTYPE, <<"aws.ecs.launchtype">>).

%% The ARN of an [ECS task definition](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definitions.html)..
-define(AWS_ECS_TASK_ARN, <<"aws.ecs.task.arn">>).

%% The task definition family this task definition is a member of..
-define(AWS_ECS_TASK_FAMILY, <<"aws.ecs.task.family">>).

%% The revision for this task definition..
-define(AWS_ECS_TASK_REVISION, <<"aws.ecs.task.revision">>).

%% The ARN of an EKS cluster..
-define(AWS_EKS_CLUSTER_ARN, <<"aws.eks.cluster.arn">>).

%% The name(s) of the AWS log group(s) an application is writing to..
-define(AWS_LOG_GROUP_NAMES, <<"aws.log.group.names">>).

%% The Amazon Resource Name(s) (ARN) of the AWS log group(s)..
-define(AWS_LOG_GROUP_ARNS, <<"aws.log.group.arns">>).

%% The name(s) of the AWS log stream(s) an application is writing to..
-define(AWS_LOG_STREAM_NAMES, <<"aws.log.stream.names">>).

%% The ARN(s) of the AWS log stream(s)..
-define(AWS_LOG_STREAM_ARNS, <<"aws.log.stream.arns">>).

%% Container name used by container runtime..
-define(CONTAINER_NAME, <<"container.name">>).

%% Container ID. Usually a UUID, as for example used to [identify Docker containers](https://docs.docker.com/engine/reference/run/#container-identification). The UUID might be abbreviated..
-define(CONTAINER_ID, <<"container.id">>).

%% The container runtime managing this container..
-define(CONTAINER_RUNTIME, <<"container.runtime">>).

%% Name of the image the container was built on..
-define(CONTAINER_IMAGE_NAME, <<"container.image.name">>).

%% Container image tag..
-define(CONTAINER_IMAGE_TAG, <<"container.image.tag">>).

%% Name of the [deployment environment](https://en.wikipedia.org/wiki/Deployment_environment) (aka deployment tier)..
-define(DEPLOYMENT_ENVIRONMENT, <<"deployment.environment">>).

%% A unique identifier representing the device.
-define(DEVICE_ID, <<"device.id">>).

%% The model identifier for the device.
-define(DEVICE_MODEL_IDENTIFIER, <<"device.model.identifier">>).

%% The marketing name for the device model.
-define(DEVICE_MODEL_NAME, <<"device.model.name">>).

%% The name of the device manufacturer.
-define(DEVICE_MANUFACTURER, <<"device.manufacturer">>).

%% The name of the single function that this runtime instance executes..
-define(FAAS_RESOURCE_NAME, <<"faas_resource.name">>).

%% The unique ID of the single function that this runtime instance executes..
-define(FAAS_RESOURCE_ID, <<"faas_resource.id">>).

%% The immutable version of the function being executed..
-define(FAAS_RESOURCE_VERSION, <<"faas_resource.version">>).

%% The execution environment ID as a string, that will be potentially reused for other invocations to the same function/function version..
-define(FAAS_RESOURCE_INSTANCE, <<"faas_resource.instance">>).

%% The amount of memory available to the serverless function in MiB..
-define(FAAS_RESOURCE_MAX_MEMORY, <<"faas_resource.max_memory">>).

%% Unique host ID. For Cloud, this must be the instance_id assigned by the cloud provider..
-define(HOST_ID, <<"host.id">>).

%% Name of the host. On Unix systems, it may contain what the hostname command returns, or the fully qualified hostname, or another name specified by the user..
-define(HOST_NAME, <<"host.name">>).

%% Type of host. For Cloud, this must be the machine type..
-define(HOST_TYPE, <<"host.type">>).

%% The CPU architecture the host system is running on..
-define(HOST_ARCH, <<"host.arch">>).

%% Name of the VM image or OS install the host was instantiated from..
-define(HOST_IMAGE_NAME, <<"host.image.name">>).

%% VM image ID. For Cloud, this value is from the provider..
-define(HOST_IMAGE_ID, <<"host.image.id">>).

%% The version string of the VM image as defined in [Version Attributes](README.md#version-attributes)..
-define(HOST_IMAGE_VERSION, <<"host.image.version">>).

%% The name of the cluster..
-define(K8S_CLUSTER_NAME, <<"k8s.cluster.name">>).

%% The name of the Node..
-define(K8S_NODE_NAME, <<"k8s.node.name">>).

%% The UID of the Node..
-define(K8S_NODE_UID, <<"k8s.node.uid">>).

%% The name of the namespace that the pod is running in..
-define(K8S_NAMESPACE_NAME, <<"k8s.namespace.name">>).

%% The UID of the Pod..
-define(K8S_POD_UID, <<"k8s.pod.uid">>).

%% The name of the Pod..
-define(K8S_POD_NAME, <<"k8s.pod.name">>).

%% The name of the Container from Pod specification, must be unique within a Pod. Container runtime usually uses different globally unique name (`container.name`)..
-define(K8S_CONTAINER_NAME, <<"k8s.container.name">>).

%% Number of times the container was restarted. This attribute can be used to identify a particular container (running or stopped) within a container spec..
-define(K8S_CONTAINER_RESTART_COUNT, <<"k8s.container.restart_count">>).

%% The UID of the ReplicaSet..
-define(K8S_REPLICASET_UID, <<"k8s.replicaset.uid">>).

%% The name of the ReplicaSet..
-define(K8S_REPLICASET_NAME, <<"k8s.replicaset.name">>).

%% The UID of the Deployment..
-define(K8S_DEPLOYMENT_UID, <<"k8s.deployment.uid">>).

%% The name of the Deployment..
-define(K8S_DEPLOYMENT_NAME, <<"k8s.deployment.name">>).

%% The UID of the StatefulSet..
-define(K8S_STATEFULSET_UID, <<"k8s.statefulset.uid">>).

%% The name of the StatefulSet..
-define(K8S_STATEFULSET_NAME, <<"k8s.statefulset.name">>).

%% The UID of the DaemonSet..
-define(K8S_DAEMONSET_UID, <<"k8s.daemonset.uid">>).

%% The name of the DaemonSet..
-define(K8S_DAEMONSET_NAME, <<"k8s.daemonset.name">>).

%% The UID of the Job..
-define(K8S_JOB_UID, <<"k8s.job.uid">>).

%% The name of the Job..
-define(K8S_JOB_NAME, <<"k8s.job.name">>).

%% The UID of the CronJob..
-define(K8S_CRONJOB_UID, <<"k8s.cronjob.uid">>).

%% The name of the CronJob..
-define(K8S_CRONJOB_NAME, <<"k8s.cronjob.name">>).

%% The operating system type..
-define(OS_TYPE, <<"os.type">>).

%% Human readable (not intended to be parsed) OS version information, like e.g. reported by `ver` or `lsb_release -a` commands..
-define(OS_DESCRIPTION, <<"os.description">>).

%% Human readable operating system name..
-define(OS_NAME, <<"os.name">>).

%% The version string of the operating system as defined in [Version Attributes](../../resource/semantic_conventions/README.md#version-attributes)..
-define(OS_VERSION, <<"os.version">>).

%% Process identifier (PID)..
-define(PROCESS_PID, <<"process.pid">>).

%% Parent Process identifier (PID)..
-define(PROCESS_PARENT_PID, <<"process.parent_pid">>).

%% The name of the process executable. On Linux based systems, can be set to the `Name` in `proc/[pid]/status`. On Windows, can be set to the base name of `GetProcessImageFileNameW`..
-define(PROCESS_EXECUTABLE_NAME, <<"process.executable.name">>).

%% The full path to the process executable. On Linux based systems, can be set to the target of `proc/[pid]/exe`. On Windows, can be set to the result of `GetProcessImageFileNameW`..
-define(PROCESS_EXECUTABLE_PATH, <<"process.executable.path">>).

%% The command used to launch the process (i.e. the command name). On Linux based systems, can be set to the zeroth string in `proc/[pid]/cmdline`. On Windows, can be set to the first parameter extracted from `GetCommandLineW`..
-define(PROCESS_COMMAND, <<"process.command">>).

%% The full command used to launch the process as a single string representing the full command. On Windows, can be set to the result of `GetCommandLineW`. Do not set this if you have to assemble it just for monitoring; use `process.command_args` instead..
-define(PROCESS_COMMAND_LINE, <<"process.command_line">>).

%% All the command arguments (including the command/executable itself) as received by the process. On Linux-based systems (and some other Unixoid systems supporting procfs), can be set according to the list of null-delimited strings extracted from `proc/[pid]/cmdline`. For libc-based executables, this would be the full argv vector passed to `main`..
-define(PROCESS_COMMAND_ARGS, <<"process.command_args">>).

%% The username of the user that owns the process..
-define(PROCESS_OWNER, <<"process.owner">>).

%% The name of the runtime of this process. For compiled native binaries, this SHOULD be the name of the compiler..
-define(PROCESS_RUNTIME_NAME, <<"process.runtime.name">>).

%% The version of the runtime of this process, as returned by the runtime without modification..
-define(PROCESS_RUNTIME_VERSION, <<"process.runtime.version">>).

%% An additional description about the runtime of the process, for example a specific vendor customization of the runtime environment..
-define(PROCESS_RUNTIME_DESCRIPTION, <<"process.runtime.description">>).

%% Logical name of the service..
-define(SERVICE_NAME, <<"service.name">>).

%% A namespace for `service.name`..
-define(SERVICE_NAMESPACE, <<"service.namespace">>).

%% The string ID of the service instance..
-define(SERVICE_INSTANCE_ID, <<"service.instance.id">>).

%% The version string of the service API or implementation..
-define(SERVICE_VERSION, <<"service.version">>).

%% The name of the telemetry SDK as defined above..
-define(TELEMETRY_SDK_NAME, <<"telemetry.sdk.name">>).

%% The language of the telemetry SDK..
-define(TELEMETRY_SDK_LANGUAGE, <<"telemetry.sdk.language">>).

%% The version string of the telemetry SDK..
-define(TELEMETRY_SDK_VERSION, <<"telemetry.sdk.version">>).

%% The version string of the auto instrumentation agent, if used..
-define(TELEMETRY_AUTO_VERSION, <<"telemetry.auto.version">>).

%% The name of the web engine..
-define(WEBENGINE_RESOURCE_NAME, <<"webengine_resource.name">>).

%% The version of the web engine..
-define(WEBENGINE_RESOURCE_VERSION, <<"webengine_resource.version">>).

%% Additional description of the web engine (e.g. detailed version and edition information)..
-define(WEBENGINE_RESOURCE_DESCRIPTION, <<"webengine_resource.description">>).

%% The name of the instrumentation scope - (`InstrumentationScope.Name` in OTLP)..
-define(OTEL_SCOPE_NAME, <<"otel.scope.name">>).

%% The version of the instrumentation scope - (`InstrumentationScope.Version` in OTLP)..
-define(OTEL_SCOPE_VERSION, <<"otel.scope.version">>).

%% Deprecated, use the `otel.scope.name` attribute..
-define(OTEL_LIBRARY_NAME, <<"otel.library.name">>).

%% Deprecated, use the `otel.scope.version` attribute..
-define(OTEL_LIBRARY_VERSION, <<"otel.library.version">>).

%% The full invoked ARN as provided on the `Context` passed to the function (`Lambda-Runtime-Invoked-Function-Arn` header on the `/runtime/invocation/next` applicable)..
-define(AWS_LAMBDA_INVOKED_ARN, <<"aws.lambda.invoked_arn">>).

%% The [event_id](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md#id) uniquely identifies the event..
-define(CLOUDEVENTS_EVENT_ID, <<"cloudevents.event_id">>).

%% The [source](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md#source-1) identifies the context in which an event happened..
-define(CLOUDEVENTS_EVENT_SOURCE, <<"cloudevents.event_source">>).

%% The [version of the CloudEvents specification](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md#specversion) which the event uses..
-define(CLOUDEVENTS_EVENT_SPEC_VERSION, <<"cloudevents.event_spec_version">>).

%% The [event_type](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md#type) contains a value describing the type of event related to the originating occurrence..
-define(CLOUDEVENTS_EVENT_TYPE, <<"cloudevents.event_type">>).

%% The [subject](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md#subject) of the event in the context of the event producer (identified by source)..
-define(CLOUDEVENTS_EVENT_SUBJECT, <<"cloudevents.event_subject">>).

%% Parent-child Reference type.
-define(OPENTRACING_REF_TYPE, <<"opentracing.ref_type">>).

%% An identifier for the database management system (DBMS) product being used. See below for a list of well-known identifiers..
-define(DB_SYSTEM, <<"db.system">>).

%% The connection string used to connect to the database. It is recommended to remove embedded credentials..
-define(DB_CONNECTION_STRING, <<"db.connection_string">>).

%% Username for accessing the database..
-define(DB_USER, <<"db.user">>).

%% The fully-qualified class name of the [Java Database Connectivity (JDBC)](https://docs.oracle.com/javase/8/docs/technotes/guides/jdbc/) driver used to connect..
-define(DB_JDBC_DRIVER_CLASSNAME, <<"db.jdbc.driver_classname">>).

%% This attribute is used to report the name of the database being accessed. For commands that switch the database, this should be set to the target database (even if the command fails)..
-define(DB_NAME, <<"db.name">>).

%% The database statement being executed..
-define(DB_STATEMENT, <<"db.statement">>).

%% The name of the operation being executed, e.g. the [MongoDB command name](https://docs.mongodb.com/manual/reference/command/#database-operations) such as `findAndModify`, or the SQL keyword..
-define(DB_OPERATION, <<"db.operation">>).

%% Name of the database host..
-define(DB_NET_PEER_NAME, <<"db.net.peer.name">>).

-define(DB_NET_PEER_PORT, <<"db.net.peer.port">>).

-define(DB_NET_SOCK_PEER_ADDR, <<"db.net.sock.peer.addr">>).

-define(DB_NET_SOCK_PEER_PORT, <<"db.net.sock.peer.port">>).

-define(DB_NET_SOCK_FAMILY, <<"db.net.sock.family">>).

-define(DB_NET_SOCK_PEER_NAME, <<"db.net.sock.peer.name">>).

-define(DB_NET_TRANSPORT, <<"db.net.transport">>).

%% The Microsoft SQL Server [instance name](https://docs.microsoft.com/en-us/sql/connect/jdbc/building-the-connection-url?view=sql-server-ver15) connecting to. This name is used to determine the port of a named instance..
-define(DB_MSSQL_INSTANCE_NAME, <<"db.mssql.instance_name">>).

%% The fetch size used for paging, i.e. how many rows will be returned at once..
-define(DB_CASSANDRA_PAGE_SIZE, <<"db.cassandra.page_size">>).

%% The consistency level of the query. Based on consistency values from [CQL](https://docs.datastax.com/en/cassandra-oss/3.0/cassandra/dml/dmlConfigConsistency.html)..
-define(DB_CASSANDRA_CONSISTENCY_LEVEL, <<"db.cassandra.consistency_level">>).

%% The name of the primary table that the operation is acting upon, including the keyspace name (if applicable)..
-define(DB_CASSANDRA_TABLE, <<"db.cassandra.table">>).

%% Whether or not the query is idempotent..
-define(DB_CASSANDRA_IDEMPOTENCE, <<"db.cassandra.idempotence">>).

%% The number of times a query was speculatively executed. Not set or `0` if the query was not executed speculatively..
-define(DB_CASSANDRA_SPECULATIVE_EXECUTION_COUNT, <<"db.cassandra.speculative_execution_count">>).

%% The ID of the coordinating node for a query..
-define(DB_CASSANDRA_COORDINATOR_ID, <<"db.cassandra.coordinator.id">>).

%% The data center of the coordinating node for a query..
-define(DB_CASSANDRA_COORDINATOR_DC, <<"db.cassandra.coordinator.dc">>).

%% The index of the database being accessed as used in the [`SELECT` command](https://redis.io/commands/select), provided as an integer. To be used instead of the generic `db.name` attribute..
-define(DB_REDIS_DATABASE_INDEX, <<"db.redis.database_index">>).

%% The collection being accessed within the database stated in `db.name`..
-define(DB_MONGODB_COLLECTION, <<"db.mongodb.collection">>).

%% The name of the primary table that the operation is acting upon, including the database name (if applicable)..
-define(DB_SQL_TABLE, <<"db.sql.table">>).

%% Name of the code, either "OK" or "ERROR". MUST NOT be set if the status code is UNSET..
-define(OTEL_SPAN_STATUS_CODE, <<"otel_span.status_code">>).

%% Description of the Status if it has a value, otherwise not set..
-define(OTEL_SPAN_STATUS_DESCRIPTION, <<"otel_span.status_description">>).

%% Type of the trigger which caused this function execution..
-define(FAAS_SPAN_TRIGGER, <<"faas_span.trigger">>).

%% The execution ID of the current function execution..
-define(FAAS_SPAN_EXECUTION, <<"faas_span.execution">>).

%% The name of the source on which the triggering operation was performed. For example, in Cloud Storage or S3 corresponds to the bucket name, and in Cosmos DB to the database name..
-define(FAAS_SPAN_DATASOURCE_COLLECTION, <<"faas_span.datasource.collection">>).

%% Describes the type of the operation that was performed on the data..
-define(FAAS_SPAN_DATASOURCE_OPERATION, <<"faas_span.datasource.operation">>).

%% A string containing the time when the data was accessed in the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format expressed in [UTC](https://www.w3.org/TR/NOTE-datetime)..
-define(FAAS_SPAN_DATASOURCE_TIME, <<"faas_span.datasource.time">>).

%% The document name/table subjected to the operation. For example, in Cloud Storage or S3 is the name of the file, and in Cosmos DB the table name..
-define(FAAS_SPAN_DATASOURCE_NAME, <<"faas_span.datasource.name">>).

%% A string containing the function invocation time in the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format expressed in [UTC](https://www.w3.org/TR/NOTE-datetime)..
-define(FAAS_SPAN_TIMER_TIME, <<"faas_span.timer.time">>).

%% A string containing the schedule period as [Cron Expression](https://docs.oracle.com/cd/E12058_01/doc/doc.1014/e12030/cron_expressions.htm)..
-define(FAAS_SPAN_TIMER_CRON, <<"faas_span.timer.cron">>).

%% A boolean that is true if the serverless function is executed for the first time (aka cold-start)..
-define(FAAS_SPAN_IN_COLDSTART, <<"faas_span.in.coldstart">>).

-define(FAAS_SPAN_IN_FAAS_TRIGGER, <<"faas_span.in.faas.trigger">>).

%% The name of the invoked function..
-define(FAAS_SPAN_OUT_INVOKED_NAME, <<"faas_span.out.invoked_name">>).

%% The cloud provider of the invoked function..
-define(FAAS_SPAN_OUT_INVOKED_PROVIDER, <<"faas_span.out.invoked_provider">>).

%% The cloud region of the invoked function..
-define(FAAS_SPAN_OUT_INVOKED_REGION, <<"faas_span.out.invoked_region">>).

%% Transport protocol used. See note below..
-define(NETWORK_TRANSPORT, <<"network.transport">>).

%% Application layer protocol used. The value SHOULD be normalized to lowercase..
-define(NETWORK_APP_PROTOCOL_NAME, <<"network.app.protocol.name">>).

%% Version of the application layer protocol used. See note below..
-define(NETWORK_APP_PROTOCOL_VERSION, <<"network.app.protocol.version">>).

%% Remote socket peer name..
-define(NETWORK_SOCK_PEER_NAME, <<"network.sock.peer.name">>).

%% Remote socket peer address: IPv4 or IPv6 for internet protocols, path for local communication, [etc](https://man7.org/linux/man-pages/man7/address_families.7.html)..
-define(NETWORK_SOCK_PEER_ADDR, <<"network.sock.peer.addr">>).

%% Remote socket peer port..
-define(NETWORK_SOCK_PEER_PORT, <<"network.sock.peer.port">>).

%% Protocol [address family](https://man7.org/linux/man-pages/man7/address_families.7.html) which is used for communication..
-define(NETWORK_SOCK_FAMILY, <<"network.sock.family">>).

%% Logical remote hostname, see note below..
-define(NETWORK_PEER_NAME, <<"network.peer.name">>).

%% Logical remote port number.
-define(NETWORK_PEER_PORT, <<"network.peer.port">>).

%% Logical local hostname or similar, see note below..
-define(NETWORK_HOST_NAME, <<"network.host.name">>).

%% Logical local port number, preferably the one that the peer used to connect.
-define(NETWORK_HOST_PORT, <<"network.host.port">>).

%% Local socket address. Useful in case of a multi-IP host..
-define(NETWORK_SOCK_HOST_ADDR, <<"network.sock.host.addr">>).

%% Local socket port number..
-define(NETWORK_SOCK_HOST_PORT, <<"network.sock.host.port">>).

%% The internet connection type currently being used by the host..
-define(NETWORK_HOST_CONNECTION_TYPE, <<"network.host.connection.type">>).

%% This describes more details regarding the connection.type. It may be the type of cell technology connection, but it could be used for describing details about a wifi connection..
-define(NETWORK_HOST_CONNECTION_SUBTYPE, <<"network.host.connection.subtype">>).

%% The name of the mobile carrier..
-define(NETWORK_HOST_CARRIER_NAME, <<"network.host.carrier.name">>).

%% The mobile carrier country code..
-define(NETWORK_HOST_CARRIER_MCC, <<"network.host.carrier.mcc">>).

%% The mobile carrier network code..
-define(NETWORK_HOST_CARRIER_MNC, <<"network.host.carrier.mnc">>).

%% The ISO 3166-1 alpha-2 2-character country code associated with the mobile carrier network..
-define(NETWORK_HOST_CARRIER_ICC, <<"network.host.carrier.icc">>).

%% The [`service.name`](../../resource/semantic_conventions/README.md#service) of the remote service. SHOULD be equal to the actual `service.name` resource attribute of the remote service if any..
-define(PEER_SERVICE, <<"peer.service">>).

%% Username or client_id extracted from the access token or [Authorization](https://tools.ietf.org/html/rfc7235#section-4.2) header in the inbound request from outside the system..
-define(IDENTITY_ID, <<"identity.id">>).

%% Actual/assumed role the client is making the request under extracted from token or application security context..
-define(IDENTITY_ROLE, <<"identity.role">>).

%% Scopes or granted authorities the client currently possesses extracted from token or application security context. The value would come from the scope associated with an [OAuth 2.0 Access Token](https://tools.ietf.org/html/rfc6749#section-3.3) or an attribute value in a [SAML 2.0 Assertion](http://docs.oasis-open.org/security/saml/Post2.0/sstc-saml-tech-overview-2.0.html)..
-define(IDENTITY_SCOPE, <<"identity.scope">>).

%% Current "managed" thread ID (as opposed to OS thread ID)..
-define(THREAD_ID, <<"thread.id">>).

%% Current thread name..
-define(THREAD_NAME, <<"thread.name">>).

%% The method or function name, or equivalent (usually rightmost part of the code unit's name)..
-define(CODE_FUNCTION, <<"code.function">>).

%% The "namespace" within which `code.function` is defined. Usually the qualified class or module name, such that `code.namespace` + some separator + `code.function` form a unique identifier for the code unit..
-define(CODE_NAMESPACE, <<"code.namespace">>).

%% The source code file name that identifies the code unit as uniquely as possible (preferably an absolute file path)..
-define(CODE_FILEPATH, <<"code.filepath">>).

%% The line number in `code.filepath` best representing the operation. It SHOULD point within the code unit named in `code.function`..
-define(CODE_LINENO, <<"code.lineno">>).

%% HTTP request method..
-define(HTTP_METHOD, <<"http.method">>).

%% [HTTP response status code](https://tools.ietf.org/html/rfc7231#section-6)..
-define(HTTP_STATUS_CODE, <<"http.status_code">>).

%% Kind of HTTP protocol used..
-define(HTTP_FLAVOR, <<"http.flavor">>).

%% Value of the [HTTP User-Agent](https://www.rfc-editor.org/rfc/rfc9110.html#field.user-agent) header sent by the client..
-define(HTTP_USER_AGENT, <<"http.user_agent">>).

%% The size of the request payload body in bytes. This is the number of bytes transferred excluding headers and is often, but not always, present as the [Content-Length](https://www.rfc-editor.org/rfc/rfc9110.html#field.content-length) header. For requests using transport encoding, this should be the compressed size..
-define(HTTP_REQUEST_CONTENT_LENGTH, <<"http.request_content_length">>).

%% The size of the response payload body in bytes. This is the number of bytes transferred excluding headers and is often, but not always, present as the [Content-Length](https://www.rfc-editor.org/rfc/rfc9110.html#field.content-length) header. For requests using transport encoding, this should be the compressed size..
-define(HTTP_RESPONSE_CONTENT_LENGTH, <<"http.response_content_length">>).

-define(HTTP_NET_SOCK_PEER_ADDR, <<"http.net.sock.peer.addr">>).

-define(HTTP_NET_SOCK_PEER_PORT, <<"http.net.sock.peer.port">>).

-define(HTTP_NET_SOCK_PEER_NAME, <<"http.net.sock.peer.name">>).

-define(HTTP_NET_SOCK_FAMILY, <<"http.net.sock.family">>).

%% Full HTTP request URL in the form `scheme://host[:port]/path?query[#fragment]`. Usually the fragment is not transmitted over HTTP, but if it is known, it should be included nevertheless..
-define(HTTP_CLIENT_URL, <<"http.client.url">>).

%% Host identifier of the ["URI origin"](https://www.rfc-editor.org/rfc/rfc9110.html#name-uri-origin) HTTP request is sent to..
-define(HTTP_CLIENT_NET_PEER_NAME, <<"http.client.net.peer.name">>).

%% Port identifier of the ["URI origin"](https://www.rfc-editor.org/rfc/rfc9110.html#name-uri-origin) HTTP request is sent to..
-define(HTTP_CLIENT_NET_PEER_PORT, <<"http.client.net.peer.port">>).

%% The ordinal number of request resending attempt (for any reason, including redirects)..
-define(HTTP_CLIENT_RESEND_COUNT, <<"http.client.resend_count">>).

%% The URI scheme identifying the used protocol..
-define(HTTP_SERVER_SCHEME, <<"http.server.scheme">>).

%% The full request target as passed in a HTTP request line or equivalent..
-define(HTTP_SERVER_TARGET, <<"http.server.target">>).

%% The matched route (path template in the format used by the respective server framework). See note below.
-define(HTTP_SERVER_ROUTE, <<"http.server.route">>).

%% The IP address of the original client behind all proxies, if known (e.g. from [X-Forwarded-For](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Forwarded-For))..
-define(HTTP_SERVER_CLIENT_IP, <<"http.server.client_ip">>).

%% Name of the local HTTP server that received the request..
-define(HTTP_SERVER_NET_HOST_NAME, <<"http.server.net.host.name">>).

%% Port of the local HTTP server that received the request..
-define(HTTP_SERVER_NET_HOST_PORT, <<"http.server.net.host.port">>).

-define(HTTP_SERVER_NET_SOCK_HOST_ADDR, <<"http.server.net.sock.host.addr">>).

-define(HTTP_SERVER_NET_SOCK_HOST_PORT, <<"http.server.net.sock.host.port">>).

%% A string identifying the messaging system..
-define(MESSAGING_SYSTEM, <<"messaging.system">>).

%% The message destination name. This might be equal to the span name but is required nevertheless..
-define(MESSAGING_DESTINATION, <<"messaging.destination">>).

%% The kind of message destination.
-define(MESSAGING_DESTINATION_KIND, <<"messaging.destination_kind">>).

%% A boolean that is true if the message destination is temporary..
-define(MESSAGING_TEMP_DESTINATION, <<"messaging.temp_destination">>).

%% The name of the transport protocol..
-define(MESSAGING_PROTOCOL, <<"messaging.protocol">>).

%% The version of the transport protocol..
-define(MESSAGING_PROTOCOL_VERSION, <<"messaging.protocol_version">>).

%% Connection string..
-define(MESSAGING_URL, <<"messaging.url">>).

%% A value used by the messaging system as an identifier for the message, represented as a string..
-define(MESSAGING_MESSAGE_ID, <<"messaging.message_id">>).

%% The [conversation ID](#conversations) identifying the conversation to which the message belongs, represented as a string. Sometimes called "Correlation ID"..
-define(MESSAGING_CONVERSATION_ID, <<"messaging.conversation_id">>).

%% The (uncompressed) size of the message payload in bytes. Also use this attribute if it is unknown whether the compressed or uncompressed payload size is reported..
-define(MESSAGING_MESSAGE_PAYLOAD_SIZE_BYTES, <<"messaging.message_payload_size_bytes">>).

%% The compressed size of the message payload in bytes..
-define(MESSAGING_MESSAGE_PAYLOAD_COMPRESSED_SIZE_BYTES, <<"messaging.message_payload_compressed_size_bytes">>).

%% This should be the IP/hostname of the broker (or other network-level peer) this specific message is sent to/received from..
-define(MESSAGING_NET_PEER_NAME, <<"messaging.net.peer.name">>).

-define(MESSAGING_NET_SOCK_PEER_ADDR, <<"messaging.net.sock.peer.addr">>).

-define(MESSAGING_NET_SOCK_PEER_PORT, <<"messaging.net.sock.peer.port">>).

-define(MESSAGING_NET_SOCK_FAMILY, <<"messaging.net.sock.family">>).

-define(MESSAGING_NET_SOCK_PEER_NAME, <<"messaging.net.sock.peer.name">>).

%% A string identifying the kind of message consumption as defined in the [Operation names](#operation-names) section above. If the operation is "send", this attribute MUST NOT be set, since the operation can be inferred from the span kind in that case..
-define(MESSAGING_CONSUMER_OPERATION, <<"messaging.consumer.operation">>).

%% The identifier for the consumer receiving a message. For Kafka, set it to `{messaging.kafka.consumer_group} - {messaging.kafka.client_id}`, if both are present, or only `messaging.kafka.consumer_group`. For brokers, such as RabbitMQ and Artemis, set it to the `client_id` of the client consuming the message..
-define(MESSAGING_CONSUMER_CONSUMER_ID, <<"messaging.consumer.consumer_id">>).

%% RabbitMQ message routing key..
-define(MESSAGING_RABBITMQ_ROUTING_KEY, <<"messaging.rabbitmq.routing_key">>).

%% Message keys in Kafka are used for grouping alike messages to ensure they're processed on the same partition. They differ from `messaging.message_id` in that they're not unique. If the key is `null`, the attribute MUST NOT be set..
-define(MESSAGING_KAFKA_MESSAGE_KEY, <<"messaging.kafka.message_key">>).

%% Name of the Kafka Consumer Group that is handling the message. Only applies to consumers, not producers..
-define(MESSAGING_KAFKA_CONSUMER_GROUP, <<"messaging.kafka.consumer_group">>).

%% Client Id for the Consumer or Producer that is handling the message..
-define(MESSAGING_KAFKA_CLIENT_ID, <<"messaging.kafka.client_id">>).

%% Partition the message is sent to..
-define(MESSAGING_KAFKA_PARTITION, <<"messaging.kafka.partition">>).

%% A boolean that is true if the message is a tombstone..
-define(MESSAGING_KAFKA_TOMBSTONE, <<"messaging.kafka.tombstone">>).

%% Namespace of RocketMQ resources, resources in different namespaces are individual..
-define(MESSAGING_ROCKETMQ_NAMESPACE, <<"messaging.rocketmq.namespace">>).

%% Name of the RocketMQ producer/consumer group that is handling the message. The client type is identified by the SpanKind..
-define(MESSAGING_ROCKETMQ_CLIENT_GROUP, <<"messaging.rocketmq.client_group">>).

%% The unique identifier for each client..
-define(MESSAGING_ROCKETMQ_CLIENT_ID, <<"messaging.rocketmq.client_id">>).

%% Type of message..
-define(MESSAGING_ROCKETMQ_MESSAGE_TYPE, <<"messaging.rocketmq.message_type">>).

%% The secondary classifier of message besides topic..
-define(MESSAGING_ROCKETMQ_MESSAGE_TAG, <<"messaging.rocketmq.message_tag">>).

%% Key(s) of message, another way to mark message besides message id..
-define(MESSAGING_ROCKETMQ_MESSAGE_KEYS, <<"messaging.rocketmq.message_keys">>).

%% Model of message consumption. This only applies to consumer spans..
-define(MESSAGING_ROCKETMQ_CONSUMPTION_MODEL, <<"messaging.rocketmq.consumption_model">>).

%% A string identifying the remoting system. See below for a list of well-known identifiers..
-define(RPC_SYSTEM, <<"rpc.system">>).

%% The full (logical) name of the service being called, including its package name, if applicable..
-define(RPC_SERVICE, <<"rpc.service">>).

%% The name of the (logical) method being called, must be equal to the $method part in the span name..
-define(RPC_METHOD, <<"rpc.method">>).

-define(RPC_NET_SOCK_PEER_ADDR, <<"rpc.net.sock.peer.addr">>).

-define(RPC_NET_SOCK_PEER_PORT, <<"rpc.net.sock.peer.port">>).

-define(RPC_NET_SOCK_FAMILY, <<"rpc.net.sock.family">>).

-define(RPC_NET_SOCK_PEER_NAME, <<"rpc.net.sock.peer.name">>).

%% RPC server [host name](https://grpc.github.io/grpc/core/md_doc_naming.html)..
-define(RPC_NET_PEER_NAME, <<"rpc.net.peer.name">>).

-define(RPC_NET_PEER_PORT, <<"rpc.net.peer.port">>).

-define(RPC_NET_TRANSPORT, <<"rpc.net.transport">>).

-define(RPC_SERVER_NET_HOST_NAME, <<"rpc.server.net.host.name">>).

-define(RPC_SERVER_NET_SOCK_HOST_ADDR, <<"rpc.server.net.sock.host.addr">>).

-define(RPC_SERVER_NET_SOCK_HOST_PORT, <<"rpc.server.net.sock.host.port">>).

-define(RPC_SERVER_NET_SOCK_FAMILY, <<"rpc.server.net.sock.family">>).

%% The [numeric status code](https://github.com/grpc/grpc/blob/v1.33.2/doc/statuscodes.md) of the gRPC request..
-define(RPC_GRPC_STATUS_CODE, <<"rpc.grpc.status_code">>).

%% Protocol version as in `jsonrpc` property of request/response. Since JSON-RPC 1.0 does not specify this, the value can be omitted..
-define(RPC_JSONRPC_VERSION, <<"rpc.jsonrpc.version">>).

%% `id` property of request or response. Since protocol allows id to be int, string, `null` or missing (for notifications), value is expected to be cast to string for simplicity. Use empty string in case of `null` value. Omit entirely if this is a notification..
-define(RPC_JSONRPC_REQUEST_ID, <<"rpc.jsonrpc.request_id">>).

%% `error.code` property of response if it is an error response..
-define(RPC_JSONRPC_ERROR_CODE, <<"rpc.jsonrpc.error_code">>).

%% `error.message` property of response if it is an error response..
-define(RPC_JSONRPC_ERROR_MESSAGE, <<"rpc.jsonrpc.error_message">>).

%% This is always required for jsonrpc. See the note in the general RPC conventions for more information..
-define(RPC_JSONRPC_RPC_METHOD, <<"rpc.jsonrpc.rpc.method">>).

%% Whether this is a received or sent message..
-define(RPC_MESSAGE_TYPE, <<"rpc.message.type">>).

%% MUST be calculated as two different counters starting from `1` one for sent messages and one for received message..
-define(RPC_MESSAGE_ID, <<"rpc.message.id">>).

%% Compressed size of the message in bytes..
-define(RPC_MESSAGE_COMPRESSED_SIZE, <<"rpc.message.compressed_size">>).

%% Uncompressed size of the message in bytes..
-define(RPC_MESSAGE_UNCOMPRESSED_SIZE, <<"rpc.message.uncompressed_size">>).

-define(TRACE_EXCEPTION_EXCEPTION_TYPE, <<"trace-exception.exception.type">>).

-define(TRACE_EXCEPTION_EXCEPTION_MESSAGE, <<"trace-exception.exception.message">>).

-define(TRACE_EXCEPTION_EXCEPTION_STACKTRACE, <<"trace-exception.exception.stacktrace">>).

%% SHOULD be set to true if the exception event is recorded at a point where it is known that the exception is escaping the scope of the span..
-define(TRACE_EXCEPTION_ESCAPED, <<"trace-exception.escaped">>).
