# Haskell to production

## See below the application development lifecycle phases and associated technologies/libraries.

1. [ ] [a] Install the haskell platform and create the project structure
   1. [x] [a] Install haskell stack
   2. [x] [a] Install and configure the VS Code Haskell extension (Haskell Language Server)
   3. [x] [a] Create the project (structure)
2. [ ] [a] Haskell idioms as much as possible (applied incrementally)
   1. [ ] [b] Usage of some advances FP technics
   2. [ ] [a] Handling exceptions/errors
3. [ ] [a] Use the right Prelude replacement.
   More information about the Prelude replacements could be found [here]()
4. [ ] [a] Data type based business domain
5. [ ] Logging
   1. [ ] [a] Local (file) logging
   2. [ ] [b] Centralized logging
6. [ ] [a] JSON (de)serialization
7. Haskell project structure idiom
   1. [ ] [a] Multi package / multi module application
8. [ ] Command line interface to interact with the business logic (battleship engine)
   1. [ ] [a] Simple cli
   2. [ ] [b] Advanced cli
9. [ ] Expose the interactions with engine by:
   1. [ ] [a] HTTP RESTful microservices
   2. [ ] [b] Messaging (Kafka)
10. [ ] [a] Concurrency
11. [ ] [b] Reactive Manifest/Streams
12. [ ] Tracing
   3. [ ] [b] Centralized tracing for HTTP(s) RESTful services
13. [ ] [b] Service Registration and Discovery
14. [ ] Persistence
   4. [ ] [a] RDBMS: PostgreSQL
   5. [ ] [b] NoSQL: Cassandra
15. [ ] Testing in Haskell
   6. [ ] [a] Unit testing
   7. [ ] [a] Integration testing
   8. [ ] [b] e2e testing
   9. [ ] [b] Performance testing (profile)
16. [ ] Security
    1.  [ ] [b] HTTPS RESTful services (certificate)
    2.  [ ] [b] AccessToken (JWT)
    3.  [ ] [b] Encrypted (Kafka) messages
    4.  [ ] [b] ACL (roles)
17. [ ] Web Application
    1.  [ ] [b] FP/Haskell variant
    2.  [ ] [b] SSE
18. [ ] Pipeline (AzureDevOps or Github)
   10. [ ] [b] Application as docker image
   11. [ ] [b] Application installed in kubernetes containers (minikube)
   12. [ ] [b] Application build and release with pipelines
19. [ ] [b] Alerting support (Incidents management)
20. [ ] [ ] Risks:
    1.  [ ] How security flows in used libraries are handled by the community/ecosystem
