defmodule OpenTelemetry.SemanticConventions do
  @doc ~S"""
  The type of the exception (its fully-qualified class name, if applicable). The dynamic type of the exception should be preferred over the static type in languages that support it.
  """
  defmacro exception_type do
    quote do: "exception.type"
  end

  @doc ~S"""
  The exception message.
  """
  defmacro exception_message do
    quote do: "exception.message"
  end

  @doc ~S"""
  A stacktrace as a string in the natural representation for the language runtime. The representation is to be determined and documented by each language SIG.
  """
  defmacro exception_stacktrace do
    quote do: "exception.stacktrace"
  end

  @doc ~S"""
  The name identifies the event.
  """
  defmacro event_name do
    quote do: "event.name"
  end

  @doc ~S"""
  The domain identifies the context in which an event happened. An event name is unique only within a domain.
  """
  defmacro event_domain do
    quote do: "event.domain"
  end

  defmacro log_exception_exception_type do
    quote do: "log-exception.exception.type"
  end

  defmacro log_exception_exception_message do
    quote do: "log-exception.exception.message"
  end

  defmacro log_exception_exception_stacktrace do
    quote do: "log-exception.exception.stacktrace"
  end

  @doc ~S"""
  Array of brand name and version separated by a space
  """
  defmacro browser_brands do
    quote do: "browser.brands"
  end

  @doc ~S"""
  The platform on which the browser is running
  """
  defmacro browser_platform do
    quote do: "browser.platform"
  end

  @doc ~S"""
  A boolean that is true if the browser is running on a mobile device
  """
  defmacro browser_mobile do
    quote do: "browser.mobile"
  end

  @doc ~S"""
  Full user-agent string provided by the browser
  """
  defmacro browser_user_agent do
    quote do: "browser.user_agent"
  end

  @doc ~S"""
  Preferred language of the user using the browser
  """
  defmacro browser_language do
    quote do: "browser.language"
  end

  @doc ~S"""
  Name of the cloud provider.
  """
  defmacro cloud_provider do
    quote do: "cloud.provider"
  end

  @doc ~S"""
  The cloud account ID the resource is assigned to.
  """
  defmacro cloud_account_id do
    quote do: "cloud.account.id"
  end

  @doc ~S"""
  The geographical region the resource is running.
  """
  defmacro cloud_region do
    quote do: "cloud.region"
  end

  @doc ~S"""
  Cloud regions often have multiple, isolated locations known as zones to increase availability. Availability zone represents the zone where the resource is running.
  """
  defmacro cloud_availability_zone do
    quote do: "cloud.availability_zone"
  end

  @doc ~S"""
  The cloud platform in use.
  """
  defmacro cloud_platform do
    quote do: "cloud.platform"
  end

  @doc ~S"""
  The Amazon Resource Name (ARN) of an [ECS container instance](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_instances.html).
  """
  defmacro aws_ecs_container_arn do
    quote do: "aws.ecs.container.arn"
  end

  @doc ~S"""
  The ARN of an [ECS cluster](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/clusters.html).
  """
  defmacro aws_ecs_cluster_arn do
    quote do: "aws.ecs.cluster.arn"
  end

  @doc ~S"""
  The [launch type](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_types.html) for an ECS task.
  """
  defmacro aws_ecs_launchtype do
    quote do: "aws.ecs.launchtype"
  end

  @doc ~S"""
  The ARN of an [ECS task definition](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definitions.html).
  """
  defmacro aws_ecs_task_arn do
    quote do: "aws.ecs.task.arn"
  end

  @doc ~S"""
  The task definition family this task definition is a member of.
  """
  defmacro aws_ecs_task_family do
    quote do: "aws.ecs.task.family"
  end

  @doc ~S"""
  The revision for this task definition.
  """
  defmacro aws_ecs_task_revision do
    quote do: "aws.ecs.task.revision"
  end

  @doc ~S"""
  The ARN of an EKS cluster.
  """
  defmacro aws_eks_cluster_arn do
    quote do: "aws.eks.cluster.arn"
  end

  @doc ~S"""
  The name(s) of the AWS log group(s) an application is writing to.
  """
  defmacro aws_log_group_names do
    quote do: "aws.log.group.names"
  end

  @doc ~S"""
  The Amazon Resource Name(s) (ARN) of the AWS log group(s).
  """
  defmacro aws_log_group_arns do
    quote do: "aws.log.group.arns"
  end

  @doc ~S"""
  The name(s) of the AWS log stream(s) an application is writing to.
  """
  defmacro aws_log_stream_names do
    quote do: "aws.log.stream.names"
  end

  @doc ~S"""
  The ARN(s) of the AWS log stream(s).
  """
  defmacro aws_log_stream_arns do
    quote do: "aws.log.stream.arns"
  end

  @doc ~S"""
  Container name used by container runtime.
  """
  defmacro container_name do
    quote do: "container.name"
  end

  @doc ~S"""
  Container ID. Usually a UUID, as for example used to [identify Docker containers](https://docs.docker.com/engine/reference/run/#container-identification). The UUID might be abbreviated.
  """
  defmacro container_id do
    quote do: "container.id"
  end

  @doc ~S"""
  The container runtime managing this container.
  """
  defmacro container_runtime do
    quote do: "container.runtime"
  end

  @doc ~S"""
  Name of the image the container was built on.
  """
  defmacro container_image_name do
    quote do: "container.image.name"
  end

  @doc ~S"""
  Container image tag.
  """
  defmacro container_image_tag do
    quote do: "container.image.tag"
  end

  @doc ~S"""
  Name of the [deployment environment](https://en.wikipedia.org/wiki/Deployment_environment) (aka deployment tier).
  """
  defmacro deployment_environment do
    quote do: "deployment.environment"
  end

  @doc ~S"""
  A unique identifier representing the device
  """
  defmacro device_id do
    quote do: "device.id"
  end

  @doc ~S"""
  The model identifier for the device
  """
  defmacro device_model_identifier do
    quote do: "device.model.identifier"
  end

  @doc ~S"""
  The marketing name for the device model
  """
  defmacro device_model_name do
    quote do: "device.model.name"
  end

  @doc ~S"""
  The name of the device manufacturer
  """
  defmacro device_manufacturer do
    quote do: "device.manufacturer"
  end

  @doc ~S"""
  The name of the single function that this runtime instance executes.
  """
  defmacro faas_resource_name do
    quote do: "faas_resource.name"
  end

  @doc ~S"""
  The unique ID of the single function that this runtime instance executes.
  """
  defmacro faas_resource_id do
    quote do: "faas_resource.id"
  end

  @doc ~S"""
  The immutable version of the function being executed.
  """
  defmacro faas_resource_version do
    quote do: "faas_resource.version"
  end

  @doc ~S"""
  The execution environment ID as a string, that will be potentially reused for other invocations to the same function/function version.
  """
  defmacro faas_resource_instance do
    quote do: "faas_resource.instance"
  end

  @doc ~S"""
  The amount of memory available to the serverless function in MiB.
  """
  defmacro faas_resource_max_memory do
    quote do: "faas_resource.max_memory"
  end

  @doc ~S"""
  Unique host ID. For Cloud, this must be the instance_id assigned by the cloud provider.
  """
  defmacro host_id do
    quote do: "host.id"
  end

  @doc ~S"""
  Name of the host. On Unix systems, it may contain what the hostname command returns, or the fully qualified hostname, or another name specified by the user.
  """
  defmacro host_name do
    quote do: "host.name"
  end

  @doc ~S"""
  Type of host. For Cloud, this must be the machine type.
  """
  defmacro host_type do
    quote do: "host.type"
  end

  @doc ~S"""
  The CPU architecture the host system is running on.
  """
  defmacro host_arch do
    quote do: "host.arch"
  end

  @doc ~S"""
  Name of the VM image or OS install the host was instantiated from.
  """
  defmacro host_image_name do
    quote do: "host.image.name"
  end

  @doc ~S"""
  VM image ID. For Cloud, this value is from the provider.
  """
  defmacro host_image_id do
    quote do: "host.image.id"
  end

  @doc ~S"""
  The version string of the VM image as defined in [Version Attributes](README.md#version-attributes).
  """
  defmacro host_image_version do
    quote do: "host.image.version"
  end

  @doc ~S"""
  The name of the cluster.
  """
  defmacro k8s_cluster_name do
    quote do: "k8s.cluster.name"
  end

  @doc ~S"""
  The name of the Node.
  """
  defmacro k8s_node_name do
    quote do: "k8s.node.name"
  end

  @doc ~S"""
  The UID of the Node.
  """
  defmacro k8s_node_uid do
    quote do: "k8s.node.uid"
  end

  @doc ~S"""
  The name of the namespace that the pod is running in.
  """
  defmacro k8s_namespace_name do
    quote do: "k8s.namespace.name"
  end

  @doc ~S"""
  The UID of the Pod.
  """
  defmacro k8s_pod_uid do
    quote do: "k8s.pod.uid"
  end

  @doc ~S"""
  The name of the Pod.
  """
  defmacro k8s_pod_name do
    quote do: "k8s.pod.name"
  end

  @doc ~S"""
  The name of the Container from Pod specification, must be unique within a Pod. Container runtime usually uses different globally unique name (`container.name`).
  """
  defmacro k8s_container_name do
    quote do: "k8s.container.name"
  end

  @doc ~S"""
  Number of times the container was restarted. This attribute can be used to identify a particular container (running or stopped) within a container spec.
  """
  defmacro k8s_container_restart_count do
    quote do: "k8s.container.restart_count"
  end

  @doc ~S"""
  The UID of the ReplicaSet.
  """
  defmacro k8s_replicaset_uid do
    quote do: "k8s.replicaset.uid"
  end

  @doc ~S"""
  The name of the ReplicaSet.
  """
  defmacro k8s_replicaset_name do
    quote do: "k8s.replicaset.name"
  end

  @doc ~S"""
  The UID of the Deployment.
  """
  defmacro k8s_deployment_uid do
    quote do: "k8s.deployment.uid"
  end

  @doc ~S"""
  The name of the Deployment.
  """
  defmacro k8s_deployment_name do
    quote do: "k8s.deployment.name"
  end

  @doc ~S"""
  The UID of the StatefulSet.
  """
  defmacro k8s_statefulset_uid do
    quote do: "k8s.statefulset.uid"
  end

  @doc ~S"""
  The name of the StatefulSet.
  """
  defmacro k8s_statefulset_name do
    quote do: "k8s.statefulset.name"
  end

  @doc ~S"""
  The UID of the DaemonSet.
  """
  defmacro k8s_daemonset_uid do
    quote do: "k8s.daemonset.uid"
  end

  @doc ~S"""
  The name of the DaemonSet.
  """
  defmacro k8s_daemonset_name do
    quote do: "k8s.daemonset.name"
  end

  @doc ~S"""
  The UID of the Job.
  """
  defmacro k8s_job_uid do
    quote do: "k8s.job.uid"
  end

  @doc ~S"""
  The name of the Job.
  """
  defmacro k8s_job_name do
    quote do: "k8s.job.name"
  end

  @doc ~S"""
  The UID of the CronJob.
  """
  defmacro k8s_cronjob_uid do
    quote do: "k8s.cronjob.uid"
  end

  @doc ~S"""
  The name of the CronJob.
  """
  defmacro k8s_cronjob_name do
    quote do: "k8s.cronjob.name"
  end

  @doc ~S"""
  The operating system type.
  """
  defmacro os_type do
    quote do: "os.type"
  end

  @doc ~S"""
  Human readable (not intended to be parsed) OS version information, like e.g. reported by `ver` or `lsb_release -a` commands.
  """
  defmacro os_description do
    quote do: "os.description"
  end

  @doc ~S"""
  Human readable operating system name.
  """
  defmacro os_name do
    quote do: "os.name"
  end

  @doc ~S"""
  The version string of the operating system as defined in [Version Attributes](../../resource/semantic_conventions/README.md#version-attributes).
  """
  defmacro os_version do
    quote do: "os.version"
  end

  @doc ~S"""
  Process identifier (PID).
  """
  defmacro process_pid do
    quote do: "process.pid"
  end

  @doc ~S"""
  Parent Process identifier (PID).
  """
  defmacro process_parent_pid do
    quote do: "process.parent_pid"
  end

  @doc ~S"""
  The name of the process executable. On Linux based systems, can be set to the `Name` in `proc/[pid]/status`. On Windows, can be set to the base name of `GetProcessImageFileNameW`.
  """
  defmacro process_executable_name do
    quote do: "process.executable.name"
  end

  @doc ~S"""
  The full path to the process executable. On Linux based systems, can be set to the target of `proc/[pid]/exe`. On Windows, can be set to the result of `GetProcessImageFileNameW`.
  """
  defmacro process_executable_path do
    quote do: "process.executable.path"
  end

  @doc ~S"""
  The command used to launch the process (i.e. the command name). On Linux based systems, can be set to the zeroth string in `proc/[pid]/cmdline`. On Windows, can be set to the first parameter extracted from `GetCommandLineW`.
  """
  defmacro process_command do
    quote do: "process.command"
  end

  @doc ~S"""
  The full command used to launch the process as a single string representing the full command. On Windows, can be set to the result of `GetCommandLineW`. Do not set this if you have to assemble it just for monitoring; use `process.command_args` instead.
  """
  defmacro process_command_line do
    quote do: "process.command_line"
  end

  @doc ~S"""
  All the command arguments (including the command/executable itself) as received by the process. On Linux-based systems (and some other Unixoid systems supporting procfs), can be set according to the list of null-delimited strings extracted from `proc/[pid]/cmdline`. For libc-based executables, this would be the full argv vector passed to `main`.
  """
  defmacro process_command_args do
    quote do: "process.command_args"
  end

  @doc ~S"""
  The username of the user that owns the process.
  """
  defmacro process_owner do
    quote do: "process.owner"
  end

  @doc ~S"""
  The name of the runtime of this process. For compiled native binaries, this SHOULD be the name of the compiler.
  """
  defmacro process_runtime_name do
    quote do: "process.runtime.name"
  end

  @doc ~S"""
  The version of the runtime of this process, as returned by the runtime without modification.
  """
  defmacro process_runtime_version do
    quote do: "process.runtime.version"
  end

  @doc ~S"""
  An additional description about the runtime of the process, for example a specific vendor customization of the runtime environment.
  """
  defmacro process_runtime_description do
    quote do: "process.runtime.description"
  end

  @doc ~S"""
  Logical name of the service.
  """
  defmacro service_name do
    quote do: "service.name"
  end

  @doc ~S"""
  A namespace for `service.name`.
  """
  defmacro service_namespace do
    quote do: "service.namespace"
  end

  @doc ~S"""
  The string ID of the service instance.
  """
  defmacro service_instance_id do
    quote do: "service.instance.id"
  end

  @doc ~S"""
  The version string of the service API or implementation.
  """
  defmacro service_version do
    quote do: "service.version"
  end

  @doc ~S"""
  The name of the telemetry SDK as defined above.
  """
  defmacro telemetry_sdk_name do
    quote do: "telemetry.sdk.name"
  end

  @doc ~S"""
  The language of the telemetry SDK.
  """
  defmacro telemetry_sdk_language do
    quote do: "telemetry.sdk.language"
  end

  @doc ~S"""
  The version string of the telemetry SDK.
  """
  defmacro telemetry_sdk_version do
    quote do: "telemetry.sdk.version"
  end

  @doc ~S"""
  The version string of the auto instrumentation agent, if used.
  """
  defmacro telemetry_auto_version do
    quote do: "telemetry.auto.version"
  end

  @doc ~S"""
  The name of the web engine.
  """
  defmacro webengine_resource_name do
    quote do: "webengine_resource.name"
  end

  @doc ~S"""
  The version of the web engine.
  """
  defmacro webengine_resource_version do
    quote do: "webengine_resource.version"
  end

  @doc ~S"""
  Additional description of the web engine (e.g. detailed version and edition information).
  """
  defmacro webengine_resource_description do
    quote do: "webengine_resource.description"
  end

  @doc ~S"""
  The name of the instrumentation scope - (`InstrumentationScope.Name` in OTLP).
  """
  defmacro otel_scope_name do
    quote do: "otel.scope.name"
  end

  @doc ~S"""
  The version of the instrumentation scope - (`InstrumentationScope.Version` in OTLP).
  """
  defmacro otel_scope_version do
    quote do: "otel.scope.version"
  end

  @doc ~S"""
  Deprecated, use the `otel.scope.name` attribute.
  """
  defmacro otel_library_name do
    quote do: "otel.library.name"
  end

  @doc ~S"""
  Deprecated, use the `otel.scope.version` attribute.
  """
  defmacro otel_library_version do
    quote do: "otel.library.version"
  end

  @doc ~S"""
  The full invoked ARN as provided on the `Context` passed to the function (`Lambda-Runtime-Invoked-Function-Arn` header on the `/runtime/invocation/next` applicable).
  """
  defmacro aws_lambda_invoked_arn do
    quote do: "aws.lambda.invoked_arn"
  end

  @doc ~S"""
  The [event_id](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md#id) uniquely identifies the event.
  """
  defmacro cloudevents_event_id do
    quote do: "cloudevents.event_id"
  end

  @doc ~S"""
  The [source](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md#source-1) identifies the context in which an event happened.
  """
  defmacro cloudevents_event_source do
    quote do: "cloudevents.event_source"
  end

  @doc ~S"""
  The [version of the CloudEvents specification](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md#specversion) which the event uses.
  """
  defmacro cloudevents_event_spec_version do
    quote do: "cloudevents.event_spec_version"
  end

  @doc ~S"""
  The [event_type](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md#type) contains a value describing the type of event related to the originating occurrence.
  """
  defmacro cloudevents_event_type do
    quote do: "cloudevents.event_type"
  end

  @doc ~S"""
  The [subject](https://github.com/cloudevents/spec/blob/v1.0.2/cloudevents/spec.md#subject) of the event in the context of the event producer (identified by source).
  """
  defmacro cloudevents_event_subject do
    quote do: "cloudevents.event_subject"
  end

  @doc ~S"""
  Parent-child Reference type
  """
  defmacro opentracing_ref_type do
    quote do: "opentracing.ref_type"
  end

  @doc ~S"""
  An identifier for the database management system (DBMS) product being used. See below for a list of well-known identifiers.
  """
  defmacro db_system do
    quote do: "db.system"
  end

  @doc ~S"""
  The connection string used to connect to the database. It is recommended to remove embedded credentials.
  """
  defmacro db_connection_string do
    quote do: "db.connection_string"
  end

  @doc ~S"""
  Username for accessing the database.
  """
  defmacro db_user do
    quote do: "db.user"
  end

  @doc ~S"""
  The fully-qualified class name of the [Java Database Connectivity (JDBC)](https://docs.oracle.com/javase/8/docs/technotes/guides/jdbc/) driver used to connect.
  """
  defmacro db_jdbc_driver_classname do
    quote do: "db.jdbc.driver_classname"
  end

  @doc ~S"""
  This attribute is used to report the name of the database being accessed. For commands that switch the database, this should be set to the target database (even if the command fails).
  """
  defmacro db_name do
    quote do: "db.name"
  end

  @doc ~S"""
  The database statement being executed.
  """
  defmacro db_statement do
    quote do: "db.statement"
  end

  @doc ~S"""
  The name of the operation being executed, e.g. the [MongoDB command name](https://docs.mongodb.com/manual/reference/command/#database-operations) such as `findAndModify`, or the SQL keyword.
  """
  defmacro db_operation do
    quote do: "db.operation"
  end

  @doc ~S"""
  Name of the database host.
  """
  defmacro db_net_peer_name do
    quote do: "db.net.peer.name"
  end

  defmacro db_net_peer_port do
    quote do: "db.net.peer.port"
  end

  defmacro db_net_sock_peer_addr do
    quote do: "db.net.sock.peer.addr"
  end

  defmacro db_net_sock_peer_port do
    quote do: "db.net.sock.peer.port"
  end

  defmacro db_net_sock_family do
    quote do: "db.net.sock.family"
  end

  defmacro db_net_sock_peer_name do
    quote do: "db.net.sock.peer.name"
  end

  defmacro db_net_transport do
    quote do: "db.net.transport"
  end

  @doc ~S"""
  The Microsoft SQL Server [instance name](https://docs.microsoft.com/en-us/sql/connect/jdbc/building-the-connection-url?view=sql-server-ver15) connecting to. This name is used to determine the port of a named instance.
  """
  defmacro db_mssql_instance_name do
    quote do: "db.mssql.instance_name"
  end

  @doc ~S"""
  The fetch size used for paging, i.e. how many rows will be returned at once.
  """
  defmacro db_cassandra_page_size do
    quote do: "db.cassandra.page_size"
  end

  @doc ~S"""
  The consistency level of the query. Based on consistency values from [CQL](https://docs.datastax.com/en/cassandra-oss/3.0/cassandra/dml/dmlConfigConsistency.html).
  """
  defmacro db_cassandra_consistency_level do
    quote do: "db.cassandra.consistency_level"
  end

  @doc ~S"""
  The name of the primary table that the operation is acting upon, including the keyspace name (if applicable).
  """
  defmacro db_cassandra_table do
    quote do: "db.cassandra.table"
  end

  @doc ~S"""
  Whether or not the query is idempotent.
  """
  defmacro db_cassandra_idempotence do
    quote do: "db.cassandra.idempotence"
  end

  @doc ~S"""
  The number of times a query was speculatively executed. Not set or `0` if the query was not executed speculatively.
  """
  defmacro db_cassandra_speculative_execution_count do
    quote do: "db.cassandra.speculative_execution_count"
  end

  @doc ~S"""
  The ID of the coordinating node for a query.
  """
  defmacro db_cassandra_coordinator_id do
    quote do: "db.cassandra.coordinator.id"
  end

  @doc ~S"""
  The data center of the coordinating node for a query.
  """
  defmacro db_cassandra_coordinator_dc do
    quote do: "db.cassandra.coordinator.dc"
  end

  @doc ~S"""
  The index of the database being accessed as used in the [`SELECT` command](https://redis.io/commands/select), provided as an integer. To be used instead of the generic `db.name` attribute.
  """
  defmacro db_redis_database_index do
    quote do: "db.redis.database_index"
  end

  @doc ~S"""
  The collection being accessed within the database stated in `db.name`.
  """
  defmacro db_mongodb_collection do
    quote do: "db.mongodb.collection"
  end

  @doc ~S"""
  The name of the primary table that the operation is acting upon, including the database name (if applicable).
  """
  defmacro db_sql_table do
    quote do: "db.sql.table"
  end

  @doc ~S"""
  Name of the code, either "OK" or "ERROR". MUST NOT be set if the status code is UNSET.
  """
  defmacro otel_span_status_code do
    quote do: "otel_span.status_code"
  end

  @doc ~S"""
  Description of the Status if it has a value, otherwise not set.
  """
  defmacro otel_span_status_description do
    quote do: "otel_span.status_description"
  end

  @doc ~S"""
  Type of the trigger which caused this function execution.
  """
  defmacro faas_span_trigger do
    quote do: "faas_span.trigger"
  end

  @doc ~S"""
  The execution ID of the current function execution.
  """
  defmacro faas_span_execution do
    quote do: "faas_span.execution"
  end

  @doc ~S"""
  The name of the source on which the triggering operation was performed. For example, in Cloud Storage or S3 corresponds to the bucket name, and in Cosmos DB to the database name.
  """
  defmacro faas_span_datasource_collection do
    quote do: "faas_span.datasource.collection"
  end

  @doc ~S"""
  Describes the type of the operation that was performed on the data.
  """
  defmacro faas_span_datasource_operation do
    quote do: "faas_span.datasource.operation"
  end

  @doc ~S"""
  A string containing the time when the data was accessed in the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format expressed in [UTC](https://www.w3.org/TR/NOTE-datetime).
  """
  defmacro faas_span_datasource_time do
    quote do: "faas_span.datasource.time"
  end

  @doc ~S"""
  The document name/table subjected to the operation. For example, in Cloud Storage or S3 is the name of the file, and in Cosmos DB the table name.
  """
  defmacro faas_span_datasource_name do
    quote do: "faas_span.datasource.name"
  end

  @doc ~S"""
  A string containing the function invocation time in the [ISO 8601](https://www.iso.org/iso-8601-date-and-time-format.html) format expressed in [UTC](https://www.w3.org/TR/NOTE-datetime).
  """
  defmacro faas_span_timer_time do
    quote do: "faas_span.timer.time"
  end

  @doc ~S"""
  A string containing the schedule period as [Cron Expression](https://docs.oracle.com/cd/E12058_01/doc/doc.1014/e12030/cron_expressions.htm).
  """
  defmacro faas_span_timer_cron do
    quote do: "faas_span.timer.cron"
  end

  @doc ~S"""
  A boolean that is true if the serverless function is executed for the first time (aka cold-start).
  """
  defmacro faas_span_in_coldstart do
    quote do: "faas_span.in.coldstart"
  end

  defmacro faas_span_in_faas_trigger do
    quote do: "faas_span.in.faas.trigger"
  end

  @doc ~S"""
  The name of the invoked function.
  """
  defmacro faas_span_out_invoked_name do
    quote do: "faas_span.out.invoked_name"
  end

  @doc ~S"""
  The cloud provider of the invoked function.
  """
  defmacro faas_span_out_invoked_provider do
    quote do: "faas_span.out.invoked_provider"
  end

  @doc ~S"""
  The cloud region of the invoked function.
  """
  defmacro faas_span_out_invoked_region do
    quote do: "faas_span.out.invoked_region"
  end

  @doc ~S"""
  Transport protocol used. See note below.
  """
  defmacro network_transport do
    quote do: "network.transport"
  end

  @doc ~S"""
  Application layer protocol used. The value SHOULD be normalized to lowercase.
  """
  defmacro network_app_protocol_name do
    quote do: "network.app.protocol.name"
  end

  @doc ~S"""
  Version of the application layer protocol used. See note below.
  """
  defmacro network_app_protocol_version do
    quote do: "network.app.protocol.version"
  end

  @doc ~S"""
  Remote socket peer name.
  """
  defmacro network_sock_peer_name do
    quote do: "network.sock.peer.name"
  end

  @doc ~S"""
  Remote socket peer address: IPv4 or IPv6 for internet protocols, path for local communication, [etc](https://man7.org/linux/man-pages/man7/address_families.7.html).
  """
  defmacro network_sock_peer_addr do
    quote do: "network.sock.peer.addr"
  end

  @doc ~S"""
  Remote socket peer port.
  """
  defmacro network_sock_peer_port do
    quote do: "network.sock.peer.port"
  end

  @doc ~S"""
  Protocol [address family](https://man7.org/linux/man-pages/man7/address_families.7.html) which is used for communication.
  """
  defmacro network_sock_family do
    quote do: "network.sock.family"
  end

  @doc ~S"""
  Logical remote hostname, see note below.
  """
  defmacro network_peer_name do
    quote do: "network.peer.name"
  end

  @doc ~S"""
  Logical remote port number
  """
  defmacro network_peer_port do
    quote do: "network.peer.port"
  end

  @doc ~S"""
  Logical local hostname or similar, see note below.
  """
  defmacro network_host_name do
    quote do: "network.host.name"
  end

  @doc ~S"""
  Logical local port number, preferably the one that the peer used to connect
  """
  defmacro network_host_port do
    quote do: "network.host.port"
  end

  @doc ~S"""
  Local socket address. Useful in case of a multi-IP host.
  """
  defmacro network_sock_host_addr do
    quote do: "network.sock.host.addr"
  end

  @doc ~S"""
  Local socket port number.
  """
  defmacro network_sock_host_port do
    quote do: "network.sock.host.port"
  end

  @doc ~S"""
  The internet connection type currently being used by the host.
  """
  defmacro network_host_connection_type do
    quote do: "network.host.connection.type"
  end

  @doc ~S"""
  This describes more details regarding the connection.type. It may be the type of cell technology connection, but it could be used for describing details about a wifi connection.
  """
  defmacro network_host_connection_subtype do
    quote do: "network.host.connection.subtype"
  end

  @doc ~S"""
  The name of the mobile carrier.
  """
  defmacro network_host_carrier_name do
    quote do: "network.host.carrier.name"
  end

  @doc ~S"""
  The mobile carrier country code.
  """
  defmacro network_host_carrier_mcc do
    quote do: "network.host.carrier.mcc"
  end

  @doc ~S"""
  The mobile carrier network code.
  """
  defmacro network_host_carrier_mnc do
    quote do: "network.host.carrier.mnc"
  end

  @doc ~S"""
  The ISO 3166-1 alpha-2 2-character country code associated with the mobile carrier network.
  """
  defmacro network_host_carrier_icc do
    quote do: "network.host.carrier.icc"
  end

  @doc ~S"""
  The [`service.name`](../../resource/semantic_conventions/README.md#service) of the remote service. SHOULD be equal to the actual `service.name` resource attribute of the remote service if any.
  """
  defmacro peer_service do
    quote do: "peer.service"
  end

  @doc ~S"""
  Username or client_id extracted from the access token or [Authorization](https://tools.ietf.org/html/rfc7235#section-4.2) header in the inbound request from outside the system.
  """
  defmacro identity_id do
    quote do: "identity.id"
  end

  @doc ~S"""
  Actual/assumed role the client is making the request under extracted from token or application security context.
  """
  defmacro identity_role do
    quote do: "identity.role"
  end

  @doc ~S"""
  Scopes or granted authorities the client currently possesses extracted from token or application security context. The value would come from the scope associated with an [OAuth 2.0 Access Token](https://tools.ietf.org/html/rfc6749#section-3.3) or an attribute value in a [SAML 2.0 Assertion](http://docs.oasis-open.org/security/saml/Post2.0/sstc-saml-tech-overview-2.0.html).
  """
  defmacro identity_scope do
    quote do: "identity.scope"
  end

  @doc ~S"""
  Current "managed" thread ID (as opposed to OS thread ID).
  """
  defmacro thread_id do
    quote do: "thread.id"
  end

  @doc ~S"""
  Current thread name.
  """
  defmacro thread_name do
    quote do: "thread.name"
  end

  @doc ~S"""
  The method or function name, or equivalent (usually rightmost part of the code unit's name).
  """
  defmacro code_function do
    quote do: "code.function"
  end

  @doc ~S"""
  The "namespace" within which `code.function` is defined. Usually the qualified class or module name, such that `code.namespace` + some separator + `code.function` form a unique identifier for the code unit.
  """
  defmacro code_namespace do
    quote do: "code.namespace"
  end

  @doc ~S"""
  The source code file name that identifies the code unit as uniquely as possible (preferably an absolute file path).
  """
  defmacro code_filepath do
    quote do: "code.filepath"
  end

  @doc ~S"""
  The line number in `code.filepath` best representing the operation. It SHOULD point within the code unit named in `code.function`.
  """
  defmacro code_lineno do
    quote do: "code.lineno"
  end

  @doc ~S"""
  HTTP request method.
  """
  defmacro http_method do
    quote do: "http.method"
  end

  @doc ~S"""
  [HTTP response status code](https://tools.ietf.org/html/rfc7231#section-6).
  """
  defmacro http_status_code do
    quote do: "http.status_code"
  end

  @doc ~S"""
  Kind of HTTP protocol used.
  """
  defmacro http_flavor do
    quote do: "http.flavor"
  end

  @doc ~S"""
  Value of the [HTTP User-Agent](https://www.rfc-editor.org/rfc/rfc9110.html#field.user-agent) header sent by the client.
  """
  defmacro http_user_agent do
    quote do: "http.user_agent"
  end

  @doc ~S"""
  The size of the request payload body in bytes. This is the number of bytes transferred excluding headers and is often, but not always, present as the [Content-Length](https://www.rfc-editor.org/rfc/rfc9110.html#field.content-length) header. For requests using transport encoding, this should be the compressed size.
  """
  defmacro http_request_content_length do
    quote do: "http.request_content_length"
  end

  @doc ~S"""
  The size of the response payload body in bytes. This is the number of bytes transferred excluding headers and is often, but not always, present as the [Content-Length](https://www.rfc-editor.org/rfc/rfc9110.html#field.content-length) header. For requests using transport encoding, this should be the compressed size.
  """
  defmacro http_response_content_length do
    quote do: "http.response_content_length"
  end

  defmacro http_net_sock_peer_addr do
    quote do: "http.net.sock.peer.addr"
  end

  defmacro http_net_sock_peer_port do
    quote do: "http.net.sock.peer.port"
  end

  defmacro http_net_sock_peer_name do
    quote do: "http.net.sock.peer.name"
  end

  defmacro http_net_sock_family do
    quote do: "http.net.sock.family"
  end

  @doc ~S"""
  Full HTTP request URL in the form `scheme://host[:port]/path?query[#fragment]`. Usually the fragment is not transmitted over HTTP, but if it is known, it should be included nevertheless.
  """
  defmacro http_client_url do
    quote do: "http.client.url"
  end

  @doc ~S"""
  Host identifier of the ["URI origin"](https://www.rfc-editor.org/rfc/rfc9110.html#name-uri-origin) HTTP request is sent to.
  """
  defmacro http_client_net_peer_name do
    quote do: "http.client.net.peer.name"
  end

  @doc ~S"""
  Port identifier of the ["URI origin"](https://www.rfc-editor.org/rfc/rfc9110.html#name-uri-origin) HTTP request is sent to.
  """
  defmacro http_client_net_peer_port do
    quote do: "http.client.net.peer.port"
  end

  @doc ~S"""
  The ordinal number of request resending attempt (for any reason, including redirects).
  """
  defmacro http_client_resend_count do
    quote do: "http.client.resend_count"
  end

  @doc ~S"""
  The URI scheme identifying the used protocol.
  """
  defmacro http_server_scheme do
    quote do: "http.server.scheme"
  end

  @doc ~S"""
  The full request target as passed in a HTTP request line or equivalent.
  """
  defmacro http_server_target do
    quote do: "http.server.target"
  end

  @doc ~S"""
  The matched route (path template in the format used by the respective server framework). See note below
  """
  defmacro http_server_route do
    quote do: "http.server.route"
  end

  @doc ~S"""
  The IP address of the original client behind all proxies, if known (e.g. from [X-Forwarded-For](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Forwarded-For)).
  """
  defmacro http_server_client_ip do
    quote do: "http.server.client_ip"
  end

  @doc ~S"""
  Name of the local HTTP server that received the request.
  """
  defmacro http_server_net_host_name do
    quote do: "http.server.net.host.name"
  end

  @doc ~S"""
  Port of the local HTTP server that received the request.
  """
  defmacro http_server_net_host_port do
    quote do: "http.server.net.host.port"
  end

  defmacro http_server_net_sock_host_addr do
    quote do: "http.server.net.sock.host.addr"
  end

  defmacro http_server_net_sock_host_port do
    quote do: "http.server.net.sock.host.port"
  end

  @doc ~S"""
  A string identifying the messaging system.
  """
  defmacro messaging_system do
    quote do: "messaging.system"
  end

  @doc ~S"""
  The message destination name. This might be equal to the span name but is required nevertheless.
  """
  defmacro messaging_destination do
    quote do: "messaging.destination"
  end

  @doc ~S"""
  The kind of message destination
  """
  defmacro messaging_destination_kind do
    quote do: "messaging.destination_kind"
  end

  @doc ~S"""
  A boolean that is true if the message destination is temporary.
  """
  defmacro messaging_temp_destination do
    quote do: "messaging.temp_destination"
  end

  @doc ~S"""
  The name of the transport protocol.
  """
  defmacro messaging_protocol do
    quote do: "messaging.protocol"
  end

  @doc ~S"""
  The version of the transport protocol.
  """
  defmacro messaging_protocol_version do
    quote do: "messaging.protocol_version"
  end

  @doc ~S"""
  Connection string.
  """
  defmacro messaging_url do
    quote do: "messaging.url"
  end

  @doc ~S"""
  A value used by the messaging system as an identifier for the message, represented as a string.
  """
  defmacro messaging_message_id do
    quote do: "messaging.message_id"
  end

  @doc ~S"""
  The [conversation ID](#conversations) identifying the conversation to which the message belongs, represented as a string. Sometimes called "Correlation ID".
  """
  defmacro messaging_conversation_id do
    quote do: "messaging.conversation_id"
  end

  @doc ~S"""
  The (uncompressed) size of the message payload in bytes. Also use this attribute if it is unknown whether the compressed or uncompressed payload size is reported.
  """
  defmacro messaging_message_payload_size_bytes do
    quote do: "messaging.message_payload_size_bytes"
  end

  @doc ~S"""
  The compressed size of the message payload in bytes.
  """
  defmacro messaging_message_payload_compressed_size_bytes do
    quote do: "messaging.message_payload_compressed_size_bytes"
  end

  @doc ~S"""
  This should be the IP/hostname of the broker (or other network-level peer) this specific message is sent to/received from.
  """
  defmacro messaging_net_peer_name do
    quote do: "messaging.net.peer.name"
  end

  defmacro messaging_net_sock_peer_addr do
    quote do: "messaging.net.sock.peer.addr"
  end

  defmacro messaging_net_sock_peer_port do
    quote do: "messaging.net.sock.peer.port"
  end

  defmacro messaging_net_sock_family do
    quote do: "messaging.net.sock.family"
  end

  defmacro messaging_net_sock_peer_name do
    quote do: "messaging.net.sock.peer.name"
  end

  @doc ~S"""
  A string identifying the kind of message consumption as defined in the [Operation names](#operation-names) section above. If the operation is "send", this attribute MUST NOT be set, since the operation can be inferred from the span kind in that case.
  """
  defmacro messaging_consumer_operation do
    quote do: "messaging.consumer.operation"
  end

  @doc ~S"""
  The identifier for the consumer receiving a message. For Kafka, set it to `{messaging.kafka.consumer_group} - {messaging.kafka.client_id}`, if both are present, or only `messaging.kafka.consumer_group`. For brokers, such as RabbitMQ and Artemis, set it to the `client_id` of the client consuming the message.
  """
  defmacro messaging_consumer_consumer_id do
    quote do: "messaging.consumer.consumer_id"
  end

  @doc ~S"""
  RabbitMQ message routing key.
  """
  defmacro messaging_rabbitmq_routing_key do
    quote do: "messaging.rabbitmq.routing_key"
  end

  @doc ~S"""
  Message keys in Kafka are used for grouping alike messages to ensure they're processed on the same partition. They differ from `messaging.message_id` in that they're not unique. If the key is `null`, the attribute MUST NOT be set.
  """
  defmacro messaging_kafka_message_key do
    quote do: "messaging.kafka.message_key"
  end

  @doc ~S"""
  Name of the Kafka Consumer Group that is handling the message. Only applies to consumers, not producers.
  """
  defmacro messaging_kafka_consumer_group do
    quote do: "messaging.kafka.consumer_group"
  end

  @doc ~S"""
  Client Id for the Consumer or Producer that is handling the message.
  """
  defmacro messaging_kafka_client_id do
    quote do: "messaging.kafka.client_id"
  end

  @doc ~S"""
  Partition the message is sent to.
  """
  defmacro messaging_kafka_partition do
    quote do: "messaging.kafka.partition"
  end

  @doc ~S"""
  A boolean that is true if the message is a tombstone.
  """
  defmacro messaging_kafka_tombstone do
    quote do: "messaging.kafka.tombstone"
  end

  @doc ~S"""
  Namespace of RocketMQ resources, resources in different namespaces are individual.
  """
  defmacro messaging_rocketmq_namespace do
    quote do: "messaging.rocketmq.namespace"
  end

  @doc ~S"""
  Name of the RocketMQ producer/consumer group that is handling the message. The client type is identified by the SpanKind.
  """
  defmacro messaging_rocketmq_client_group do
    quote do: "messaging.rocketmq.client_group"
  end

  @doc ~S"""
  The unique identifier for each client.
  """
  defmacro messaging_rocketmq_client_id do
    quote do: "messaging.rocketmq.client_id"
  end

  @doc ~S"""
  Type of message.
  """
  defmacro messaging_rocketmq_message_type do
    quote do: "messaging.rocketmq.message_type"
  end

  @doc ~S"""
  The secondary classifier of message besides topic.
  """
  defmacro messaging_rocketmq_message_tag do
    quote do: "messaging.rocketmq.message_tag"
  end

  @doc ~S"""
  Key(s) of message, another way to mark message besides message id.
  """
  defmacro messaging_rocketmq_message_keys do
    quote do: "messaging.rocketmq.message_keys"
  end

  @doc ~S"""
  Model of message consumption. This only applies to consumer spans.
  """
  defmacro messaging_rocketmq_consumption_model do
    quote do: "messaging.rocketmq.consumption_model"
  end

  @doc ~S"""
  A string identifying the remoting system. See below for a list of well-known identifiers.
  """
  defmacro rpc_system do
    quote do: "rpc.system"
  end

  @doc ~S"""
  The full (logical) name of the service being called, including its package name, if applicable.
  """
  defmacro rpc_service do
    quote do: "rpc.service"
  end

  @doc ~S"""
  The name of the (logical) method being called, must be equal to the $method part in the span name.
  """
  defmacro rpc_method do
    quote do: "rpc.method"
  end

  defmacro rpc_net_sock_peer_addr do
    quote do: "rpc.net.sock.peer.addr"
  end

  defmacro rpc_net_sock_peer_port do
    quote do: "rpc.net.sock.peer.port"
  end

  defmacro rpc_net_sock_family do
    quote do: "rpc.net.sock.family"
  end

  defmacro rpc_net_sock_peer_name do
    quote do: "rpc.net.sock.peer.name"
  end

  @doc ~S"""
  RPC server [host name](https://grpc.github.io/grpc/core/md_doc_naming.html).
  """
  defmacro rpc_net_peer_name do
    quote do: "rpc.net.peer.name"
  end

  defmacro rpc_net_peer_port do
    quote do: "rpc.net.peer.port"
  end

  defmacro rpc_net_transport do
    quote do: "rpc.net.transport"
  end

  defmacro rpc_server_net_host_name do
    quote do: "rpc.server.net.host.name"
  end

  defmacro rpc_server_net_sock_host_addr do
    quote do: "rpc.server.net.sock.host.addr"
  end

  defmacro rpc_server_net_sock_host_port do
    quote do: "rpc.server.net.sock.host.port"
  end

  defmacro rpc_server_net_sock_family do
    quote do: "rpc.server.net.sock.family"
  end

  @doc ~S"""
  The [numeric status code](https://github.com/grpc/grpc/blob/v1.33.2/doc/statuscodes.md) of the gRPC request.
  """
  defmacro rpc_grpc_status_code do
    quote do: "rpc.grpc.status_code"
  end

  @doc ~S"""
  Protocol version as in `jsonrpc` property of request/response. Since JSON-RPC 1.0 does not specify this, the value can be omitted.
  """
  defmacro rpc_jsonrpc_version do
    quote do: "rpc.jsonrpc.version"
  end

  @doc ~S"""
  `id` property of request or response. Since protocol allows id to be int, string, `null` or missing (for notifications), value is expected to be cast to string for simplicity. Use empty string in case of `null` value. Omit entirely if this is a notification.
  """
  defmacro rpc_jsonrpc_request_id do
    quote do: "rpc.jsonrpc.request_id"
  end

  @doc ~S"""
  `error.code` property of response if it is an error response.
  """
  defmacro rpc_jsonrpc_error_code do
    quote do: "rpc.jsonrpc.error_code"
  end

  @doc ~S"""
  `error.message` property of response if it is an error response.
  """
  defmacro rpc_jsonrpc_error_message do
    quote do: "rpc.jsonrpc.error_message"
  end

  @doc ~S"""
  This is always required for jsonrpc. See the note in the general RPC conventions for more information.
  """
  defmacro rpc_jsonrpc_rpc_method do
    quote do: "rpc.jsonrpc.rpc.method"
  end

  @doc ~S"""
  Whether this is a received or sent message.
  """
  defmacro rpc_message_type do
    quote do: "rpc.message.type"
  end

  @doc ~S"""
  MUST be calculated as two different counters starting from `1` one for sent messages and one for received message.
  """
  defmacro rpc_message_id do
    quote do: "rpc.message.id"
  end

  @doc ~S"""
  Compressed size of the message in bytes.
  """
  defmacro rpc_message_compressed_size do
    quote do: "rpc.message.compressed_size"
  end

  @doc ~S"""
  Uncompressed size of the message in bytes.
  """
  defmacro rpc_message_uncompressed_size do
    quote do: "rpc.message.uncompressed_size"
  end

  defmacro trace_exception_exception_type do
    quote do: "trace-exception.exception.type"
  end

  defmacro trace_exception_exception_message do
    quote do: "trace-exception.exception.message"
  end

  defmacro trace_exception_exception_stacktrace do
    quote do: "trace-exception.exception.stacktrace"
  end

  @doc ~S"""
  SHOULD be set to true if the exception event is recorded at a point where it is known that the exception is escaping the scope of the span.
  """
  defmacro trace_exception_escaped do
    quote do: "trace-exception.escaped"
  end

end