# Haskell to production

## Sprint 3 (10 Jul - 14 Jul 2021)
- [x] Command line interface parameters with defaults
  - [x] clean up the garbage out of the cli options
  - [x] [CLI Server] kafka
    - [x] brokers-list - default (localhost:9092)
    - [x] schema-registry-url
  - [x] REST
    - [x] [CLI Server] Service
      - [x] http-port - default 8080
    - [x] [CLI client] Client
      - [x] http-api-url - default (http://)localhost:8080
    - [x] [CLI Server] Database (sqlite)
      - [x] db-path
  - [ ] Learn again ReaderT in RIO and how to handle state in env
  - [ ] Learn how to use Map and concurrency with STM (__book__ - The simple haskell handbook - ch. Storing Builds in memory with STM)
- [ ] Add the app options in the RIO reader [ReaderT](https://www.fpcomplete.com/blog/2017/06/readert-design-pattern/)


  > Note: Address the commands issue by applying [this fix](https://stackoverflow.com/questions/59722106/subcommand-help-using-optparse-applicative)

## Next sprints

- [ ] Parallelism and concurrency
- [ ] Finish the model
- [ ] Finish the DDL for SQLITE db
- [ ] Handling RIO reader with the optics/lenses
- [ ] engine implementation
- [ ] (tmp example) REST service integration
- [ ] [Optional] Cassandra integration
- [ ] Application configuration with [conferer](https://blog.10pines.com/2021/03/02/conferer-a-configuration-library-for-haskell/)

## Backlog
### See below the application development lifecycle phases and associated technologies/libraries.

1. [ ] [a] Haskell idioms as much as possible (applied incrementally)
   - [ ] [b] Usage of some advances FP technics
   - [ ] [a] Handling exceptions/errors
2. [ ] [a] Use the right Prelude replacement
3. [ ] [a] Data type based business domain
4. [ ] Logging
   - [ ] [a] Local (file) logging
   - [ ] [b] Centralized logging
5. [ ] [a] JSON (de)serialization
6.  [ ] Expose the interactions with engine by:
   - [ ] [a] HTTP RESTful microservices
   - [ ] [b] Messaging (Kafka)
10. [ ] [b] Concurrency
11. [ ] [b] Reactive Manifest/Streams
12. [ ] Tracing
   - [ ] [b] Centralized tracing for HTTP(s) RESTful services
13. [ ] [b] Service Registration and Discovery
14. [ ] Persistence
   - [ ] [a] RDBMS: PostgreSQL
   - [ ] [b] NoSQL: Cassandra
15. [ ] Testing in Haskell
    - [ ] [a] Unit testing
    - [ ] [a] Integration testing
    - [ ] [b] e2e testing
    - [ ] [b] Performance testing (profile)
16. [ ] Security
    - [ ] [b] HTTPS RESTful services (certificate)
    - [ ] [b] AccessToken (JWT)
    - [ ] [b] Encrypted (Kafka) messages
    - [ ] [b] ACL (roles)
17. [ ] Web Application
   - [ ] [b] FP/Haskell variant
   - [ ] [b] SSE
18. [ ] Pipeline (AzureDevOps or Github)
   - [ ] [b] Application as docker image
   - [ ] [b] Application installed in kubernetes containers (minikube)
   - [ ] [b] Application build and release with pipelines
19. [ ] [b] Alerting support (Incidents management)
20. [ ] [b] Function design and architecture. Glue everything together.
   Books:
   - Functional   Design and   Architecture by Alexander   Granin
   - Haskell in Depth by VITALY BRAGILEVSKY
21. [ ] [ ] Risks:
   - [ ] How security flows in used libraries are handled by the community/ecosystem


## Books

- The Simple Haskell Handbook by Marco Samplellegrini
-

## Failed/later
1. [ ] Multi package / multi module application


## Previous sprints
### Sprint 1 (14 Jun - 28 Jun 2021)
- [x] [a] Create the project (structure) - one lib and one executable
- [x] [a] Use RIO instead of Prelude module
- [x] [a] Create the [domain model](./architecture_design.md#domain-model))
- [x] [a] Install the haskell platform and create the project structure
- [x] [a] Install haskell stack
- [x] [a] Install and configure the VS Code Haskell extension (Haskell Language Server)
- [x] Simple logging

### Sprint 2 (28 Jun - 05 Jul 2021)
- [x] Command line interface to interact with the business logic (battleship engine)
  - [x] engine
  - [x] client
- [x] kafka integration
  - [x] As TMP example
- [x] database (with sqlite) integration
- [x] (tmp example) kafka integration
- [x] (tmp example) Avro serde example
- [x] (tmp example) REST client integration


