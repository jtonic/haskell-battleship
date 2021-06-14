# Haskell to production

## See below the application development lifecycle phases and associated technologies/libraries.

1. [ ] [a] Install the haskell platform and create the project structure
   - [x] [a] Install haskell stack
   - [x] [a] Install and configure the VS Code Haskell extension (Haskell Language Server)
   - [x] [a] Create the project (structure)
2. [ ] [a] Haskell idioms as much as possible (applied incrementally)
   - [ ] [b] Usage of some advances FP technics
   - [ ] [a] Handling exceptions/errors
3. [ ] [a] Use the right Prelude replacement
4. [ ] [a] Data type based business domain
5. [ ] Logging
   - [ ] [a] Local (file) logging
   - [ ] [b] Centralized logging
6. [ ] [a] JSON (de)serialization
7. Haskell project structure idiom
   - [ ] [a] Multi package / multi module application
8. [ ] Command line interface to interact with the business logic (battleship engine)
   - [ ] [a] Simple cli
   - [ ] [b] Advanced cli
9.  [ ] Expose the interactions with engine by:
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
